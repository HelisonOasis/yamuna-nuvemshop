$ErrorActionPreference = 'Continue'
$urls = @(
  @{ id = 'home'; url = 'https://yamuna.com.br/' },
  @{ id = 'plp-all'; url = 'https://yamuna.com.br/produtos/' },
  @{ id = 'plp-category'; url = 'https://yamuna.com.br/cremes-de-castanhas/' },
  @{ id = 'pdp'; url = 'https://yamuna.com.br/produtos/ghee-yamuna-300g/' },
  @{ id = 'cart'; url = 'https://yamuna.com.br/comprar/' },
  @{ id = 'blog'; url = 'https://yamuna.com.br/blog/' },
  @{ id = 'quem-somos'; url = 'https://yamuna.com.br/quem-somos/' },
  @{ id = 'aprenda'; url = 'https://yamuna.com.br/aprenda/' },
  @{ id = 'revenda'; url = 'https://yamuna.com.br/revenda/' },
  @{ id = 'login'; url = 'https://yamuna.com.br/account/login/' },
  @{ id = 'search'; url = 'https://yamuna.com.br/search/?q=ghee' }
)

$outDir = 'C:\Users\HelisonDias\yamuna-nuvemshop\docs\perf'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null
$results = @()

foreach ($item in $urls) {
  $sw = [Diagnostics.Stopwatch]::StartNew()
  try {
    $resp = Invoke-WebRequest -Uri $item.url -UseBasicParsing -TimeoutSec 60 -Headers @{ 'Cache-Control' = 'no-cache' }
    $sw.Stop()
    $content = $resp.Content
    $bytes = [Text.Encoding]::UTF8.GetByteCount($content)
    $results += [ordered]@{
      id = $item.id
      url = $item.url
      status = [int]$resp.StatusCode
      downloadMs = $sw.ElapsedMilliseconds
      htmlKB = [math]::Round($bytes / 1KB, 1)
      styleTags = ([regex]::Matches($content, '<style\b')).Count
      scriptSrc = ([regex]::Matches($content, '<script[^>]+src=')).Count
      scriptTags = ([regex]::Matches($content, '<script\b')).Count
      imgTags = ([regex]::Matches($content, '<img\b')).Count
      googleFontsMentions = ([regex]::Matches($content, 'fonts\.googleapis\.com')).Count
      hasFacebook = [bool]($content -match 'fbevents|connect\.facebook\.net')
      hasStyleAsync = [bool]($content -match 'style-async')
      hasStoreJsInline = [bool]($content -match 'LS\.ready\.then')
      hasCartPanel = [bool]($content -match 'modal-cart|yamuna-minicart|cart-panel')
      hasHero = [bool]($content -match 'yamuna/hero/')
    }
    Write-Host ("OK {0} html={1}KB ms={2}" -f $item.id, $results[-1].htmlKB, $results[-1].downloadMs)
  } catch {
    $sw.Stop()
    $results += [ordered]@{ id = $item.id; url = $item.url; status = 'ERR'; error = $_.Exception.Message; downloadMs = $sw.ElapsedMilliseconds }
    Write-Host ("ERR {0} {1}" -f $item.id, $_.Exception.Message)
  }
}

$results | ConvertTo-Json -Depth 5 | Set-Content -Encoding UTF8 (Join-Path $outDir 'html-weight-by-page.json')

# Resolve style-async URL from home and measure size
$homeHtml = (Invoke-WebRequest -Uri 'https://yamuna.com.br/' -UseBasicParsing -TimeoutSec 60).Content
$m = [regex]::Match($homeHtml, 'href="([^"]*style-async[^"]*)"')
$cssHref = $m.Groups[1].Value
$cssInfo = @{ href = $cssHref }
if ($cssHref) {
  $abs = if ($cssHref -match '^https?://') { $cssHref } else { 'https:' + $cssHref }
  if ($cssHref.StartsWith('/')) { $abs = 'https://yamuna.com.br' + $cssHref }
  try {
    $css = Invoke-WebRequest -Uri $abs -UseBasicParsing -TimeoutSec 90
    $cssInfo.abs = $abs
    $cssInfo.rawKB = [math]::Round($css.RawContentLength / 1KB, 1)
    $cssInfo.bodyKB = [math]::Round(([Text.Encoding]::UTF8.GetByteCount($css.Content)) / 1KB, 1)
    $cssInfo.contentType = $css.Headers['Content-Type']
    Write-Host ("async CSS bodyKB={0} rawKB={1}" -f $cssInfo.bodyKB, $cssInfo.rawKB)
  } catch {
    $cssInfo.error = $_.Exception.Message
    Write-Host "async CSS ERR $($_.Exception.Message)"
  }
}
$cssInfo | ConvertTo-Json | Set-Content -Encoding UTF8 (Join-Path $outDir 'style-async-live.json')

# Theme asset inventory
$repo = 'C:\Users\HelisonDias\yamuna-nuvemshop'
$assets = @(
  'static\css\style-async.scss.tpl',
  'static\css\style-critical.tpl',
  'static\css\style-colors.scss.tpl',
  'static\js\store-v2.js.tpl',
  'static\js\store.js.tpl',
  'static\js\external.js.tpl',
  'layouts\layout.tpl',
  'templates\cart.tpl',
  'snipplets\cart-panel.tpl',
  'static\checkout.scss.tpl'
) | ForEach-Object {
  $f = Get-Item (Join-Path $repo $_)
  [ordered]@{ path = $_; kb = [math]::Round($f.Length / 1KB, 1); bytes = $f.Length }
}
$hero = Get-ChildItem (Join-Path $repo 'static\images\yamuna\hero') -Recurse -File
$heroInfo = [ordered]@{
  files = $hero.Count
  totalMB = [math]::Round((($hero | Measure-Object Length -Sum).Sum / 1MB), 2)
  top = @($hero | Sort-Object Length -Descending | Select-Object -First 8 | ForEach-Object {
    [ordered]@{ kb = [math]::Round($_.Length / 1KB, 1); name = $_.FullName.Replace((Join-Path $repo 'static\images\yamuna\hero\'), '') }
  })
}
$important = (Select-String -Path (Join-Path $repo 'static\css\style-async.scss.tpl') -Pattern '!important' -AllMatches).Matches.Count
$inventory = [ordered]@{
  measuredAt = (Get-Date).ToString('o')
  assets = $assets
  importantCountAsync = $important
  hero = $heroInfo
}
$inventory | ConvertTo-Json -Depth 6 | Set-Content -Encoding UTF8 (Join-Path $outDir 'theme-asset-inventory.json')
Write-Host 'Done inventory'
