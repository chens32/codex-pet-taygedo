[CmdletBinding()]
param(
    [string] $Destination = (Join-Path $env:USERPROFILE ".codex\pets\taygedo")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir

$manifestSource = Join-Path $repoRoot "pet.json"
$spritesheetSource = Join-Path $repoRoot "spritesheet.png"

if (-not (Test-Path -LiteralPath $manifestSource -PathType Leaf)) {
    throw "Missing pet.json at repository root: $manifestSource"
}

if (-not (Test-Path -LiteralPath $spritesheetSource -PathType Leaf)) {
    throw "Missing spritesheet.png at repository root: $spritesheetSource"
}

$manifest = Get-Content -LiteralPath $manifestSource -Raw -Encoding UTF8 | ConvertFrom-Json

if ($manifest.displayName -ne "Taygedo") {
    throw "pet.json displayName must be Taygedo."
}

if ($manifest.spritesheetPath -ne "spritesheet.png") {
    throw "pet.json spritesheetPath must be spritesheet.png."
}

Add-Type -AssemblyName System.Drawing
$image = [System.Drawing.Image]::FromFile($spritesheetSource)
try {
    if ($image.Width -ne 1536 -or $image.Height -ne 1872) {
        throw "spritesheet.png must be 1536 x 1872. Actual size: $($image.Width) x $($image.Height)."
    }
}
finally {
    $image.Dispose()
}

$destinationFull = [System.IO.Path]::GetFullPath($Destination)
$destinationParent = Split-Path -Parent $destinationFull

New-Item -ItemType Directory -Force -Path $destinationParent | Out-Null

if (Test-Path -LiteralPath $destinationFull) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $backup = "$destinationFull.backup-$timestamp"
    Move-Item -LiteralPath $destinationFull -Destination $backup
    Write-Host "Backed up existing pet to: $backup"
}

New-Item -ItemType Directory -Force -Path $destinationFull | Out-Null
Copy-Item -LiteralPath $manifestSource -Destination (Join-Path $destinationFull "pet.json") -Force
Copy-Item -LiteralPath $spritesheetSource -Destination (Join-Path $destinationFull "spritesheet.png") -Force

Write-Host "Installed Taygedo Codex pet to: $destinationFull"
Write-Host "Refresh the Codex pet list or restart Codex, then select: Taygedo"
