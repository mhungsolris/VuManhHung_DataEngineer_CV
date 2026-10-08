[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$cvDirectory = $PSScriptRoot
$workspaceDirectory = Split-Path -Parent $cvDirectory
$tectonicCacheDirectory = Join-Path $workspaceDirectory '.tools\tectonic-cache'

$tectonicCommand = Get-Command tectonic -ErrorAction SilentlyContinue
if ($tectonicCommand) {
    $tectonicExecutable = $tectonicCommand.Source
} else {
    $tectonicExecutable = Join-Path $env:USERPROFILE `
        '.codex\.tmp\bundled-marketplaces\openai-bundled\plugins\latex\bin\tectonic.exe'
}

if (-not (Test-Path -LiteralPath $tectonicExecutable)) {
    throw 'Không tìm thấy Tectonic. Hãy cài Tectonic hoặc mở workspace bằng Codex rồi thử lại.'
}

if (-not (Test-Path -LiteralPath $tectonicCacheDirectory)) {
    New-Item -ItemType Directory -Path $tectonicCacheDirectory | Out-Null
}

$env:TECTONIC_CACHE_DIR = $tectonicCacheDirectory

Push-Location $cvDirectory
try {
    & $tectonicExecutable --keep-logs main.tex
    if ($LASTEXITCODE -ne 0) {
        throw "Tectonic build thất bại với exit code $LASTEXITCODE."
    }
} finally {
    Pop-Location
}

Write-Host "Build thành công: $cvDirectory\main.pdf"
