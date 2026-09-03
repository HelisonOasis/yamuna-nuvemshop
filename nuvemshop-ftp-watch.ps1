$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $repoRoot

$credsPath = Join-Path $repoRoot "ftp-credentials.md"
if (!(Test-Path $credsPath)) {
  throw "Arquivo de credenciais nao encontrado: $credsPath"
}

$md = Get-Content -Path $credsPath -Raw

function Get-MdValue([string]$pattern) {
  if ($md -match $pattern) {
    return $Matches[1].Trim()
  }
  throw "Nao encontrei valor no markdown com pattern: $pattern"
}

$ftpServer = Get-MdValue "Host:\s*(.+)"
$ftpUser = Get-MdValue "Usuário:\s*(.+)"
$ftpPassword = Get-MdValue "Senha:\s*(.+)"

$storeUrl = "https://yamuna3.lojavirtualnuvem.com.br"

$cliName = $null
if (Get-Command "nuvemshop" -ErrorAction SilentlyContinue) {
  $cliName = "nuvemshop"
} elseif (Get-Command "tiendanube" -ErrorAction SilentlyContinue) {
  $cliName = "tiendanube"
} else {
  throw "Nao encontrei o comando nuvemshop/tiendanube no PATH. Garanta que o CLI global (@tiendanube/cli) esta instalado e acessivel."
}

$nuvemPath = Join-Path $repoRoot ".nuvem"

if (!(Test-Path $nuvemPath)) {
  Write-Host "Executando setup+pull inicial (criando .nuvem)..."

  & $cliName theme ftp setup `
    --ftp-server $ftpServer `
    --ftp-username $ftpUser `
    --ftp-password $ftpPassword `
    --store-url $storeUrl `
    -y

  & $cliName theme ftp pull -y
} else {
  Write-Host ".nuvem ja existe, pulando setup/pull e iniciando watch..."
}

Write-Host "Iniciando watch (envia push automaticamente quando voce salvar arquivos)..."
& $cliName theme ftp watch --no-browser

