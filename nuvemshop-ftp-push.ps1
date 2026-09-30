# Robust Nuvemshop FTP publish.
# Daily 530 is NOT a wrong password - it is concurrent FTP sessions
# (usually leftover `theme ftp watch`) and/or the CLI opening too many
# connections during a bulk sync.
#
# Strategy:
# 1) Kill stuck watchers
# 2) Try normal CLI push with retries
# 3) Fallback: one-by-one FTPS upload of changed files via .NET

$ErrorActionPreference = "Continue"
$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

function Stop-StuckFtpWatch {
  Write-Host "Stopping stuck 'theme ftp watch' processes..."
  Get-CimInstance Win32_Process |
    Where-Object { $_.CommandLine -match 'theme ftp watch|theme ftp push' } |
    ForEach-Object {
      try {
        Stop-Process -Id $_.ProcessId -Force -ErrorAction Stop
        Write-Host "  killed PID $($_.ProcessId)"
      } catch {
        Write-Host "  could not kill PID $($_.ProcessId)"
      }
    }
}

function Get-FtpConfig {
  $b64 = (Get-Content (Join-Path $repoRoot '.nuvem') -Raw).Trim()
  $json = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($b64)) | ConvertFrom-Json
  return $json.'theme-ftp'.ftp
}

function Publish-FilesOneByOne {
  param([string[]]$Files)

  $cfg = Get-FtpConfig
  $server = $cfg.ftpServer
  $user = $cfg.ftpUsername
  $pass = $cfg.ftpPassword
  Write-Host "Fallback FTPS one-by-one to $server as $user"

  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }

  $ok = 0
  $fail = 0
  foreach ($rel in $Files) {
    $local = Join-Path $repoRoot $rel
    if (-not (Test-Path $local)) {
      Write-Host "SKIP missing $rel"
      continue
    }

    $attempt = 0
    $done = $false
    while (-not $done -and $attempt -lt 5) {
      $attempt++
      try {
        $uri = "ftp://${server}/$($rel.Replace('\', '/'))"
        $req = [System.Net.FtpWebRequest]::Create($uri)
        $req.Credentials = New-Object System.Net.NetworkCredential($user, $pass)
        $req.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
        $req.EnableSsl = $true
        $req.UseBinary = $true
        $req.UsePassive = $true
        $req.KeepAlive = $false
        $req.Timeout = 180000
        $bytes = [IO.File]::ReadAllBytes($local)
        $req.ContentLength = $bytes.Length
        $stream = $req.GetRequestStream()
        $stream.Write($bytes, 0, $bytes.Length)
        $stream.Close()
        $resp = $req.GetResponse()
        $resp.Close()
        Write-Host "OK ($attempt) $rel"
        $ok++
        $done = $true
      } catch {
        Write-Host "RETRY $attempt $rel : $($_.Exception.Message)"
        Start-Sleep -Seconds (10 * $attempt)
      }
    }
    if (-not $done) { $fail++ }
    Start-Sleep -Seconds 3
  }

  Write-Host "One-by-one done. ok=$ok fail=$fail"
  return ($fail -eq 0)
}

Stop-StuckFtpWatch
Write-Host "Waiting 25s for FTP session release..."
Start-Sleep -Seconds 25

$maxAttempts = 4
$delaySeconds = 10
$cliOk = $false
for ($attempt = 1; $attempt -le $maxAttempts; $attempt++) {
  Write-Host "[$attempt/$maxAttempts] nuvemshop theme ftp push -y ..."
  & nuvemshop theme ftp push -y
  if ($LASTEXITCODE -eq 0) {
    Write-Host "FTP push OK (CLI)."
    $cliOk = $true
    break
  }
  Write-Host "CLI push failed (exit $LASTEXITCODE). Waiting ${delaySeconds}s..."
  Stop-StuckFtpWatch
  Start-Sleep -Seconds $delaySeconds
  $delaySeconds = [Math]::Min($delaySeconds * 2, 40)
}

if ($cliOk) { exit 0 }

Write-Host "CLI bulk sync unstable - publishing key changed files one-by-one..."
$changed = @(
  'static/checkout.scss.tpl',
  'static/css/yamuna-checkout-fix.css',
  'static/js/yamuna-checkout-fix.js',
  'static/js/yamuna-checkout-fix-loader.js',
  'static/js/yamuna-checkout-extras.nube.jsx',
  'snipplets/newsletter.tpl',
  'snipplets/home/home-featured-grid.tpl',
  'snipplets/home/home-slider.tpl',
  'snipplets/home/home-migration-popup.tpl',
  'snipplets/grid/item.tpl',
  'snipplets/banner-services/banner-services.tpl',
  'snipplets/banner-services/banner-services-item.tpl',
  'static/css/style-colors.scss.tpl',
  'static/css/style-async.scss.tpl',
  'static/css/style-critical.tpl',
  'static/js/store.js.tpl',
  'static/js/store-v2.js.tpl',
  'static/images/yamuna/hero-arrow-prev.svg',
  'static/images/yamuna/hero-arrow-next.svg',
  'config/defaults.txt',
  'layouts/layout.tpl',
  'templates/home.tpl',
  'templates/product.tpl'
)

if (Publish-FilesOneByOne -Files $changed) {
  Write-Host "FTP publish OK (one-by-one fallback)."
  exit 0
}

Write-Host "FTP publish failed."
exit 1
