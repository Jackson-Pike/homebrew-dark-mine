# Dark Mine installer for Windows (64-bit). Run in PowerShell:
#   irm https://raw.githubusercontent.com/Jackson-Pike/homebrew-dark-mine/main/install.ps1 | iex
# Installs to %LOCALAPPDATA%\Programs\Dark Mine (no admin needed), adds a Start Menu shortcut, and launches it.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'   # Invoke-WebRequest is many times faster without the progress bar on PowerShell 5.1

$url  = if ($env:DARKMINE_ZIP_URL) { $env:DARKMINE_ZIP_URL } else { 'https://github.com/Jackson-Pike/homebrew-dark-mine/releases/latest/download/DarkMine-Windows.zip' }
$dest = Join-Path $env:LOCALAPPDATA 'Programs\Dark Mine'
$tmp  = Join-Path ([IO.Path]::GetTempPath()) ('DarkMine-' + [Guid]::NewGuid())
New-Item -ItemType Directory -Path $tmp | Out-Null

try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    Write-Host 'Downloading Dark Mine...'
    $zip = Join-Path $tmp 'DarkMine-Windows.zip'
    Invoke-WebRequest -Uri $url -OutFile $zip -UseBasicParsing
    Expand-Archive -Path $zip -DestinationPath (Join-Path $tmp 'unpacked') -Force

    $src = Join-Path $tmp 'unpacked\Dark Mine'
    if (-not (Test-Path (Join-Path $src 'Dark Mine.exe'))) { throw "The download didn't contain Dark Mine.exe." }

    if (Test-Path $dest) {
        try { Remove-Item -Path $dest -Recurse -Force }
        catch { throw 'Close Dark Mine first, then run the installer again.' }
    }
    New-Item -ItemType Directory -Path (Split-Path $dest) -Force | Out-Null
    Copy-Item -Path $src -Destination $dest -Recurse

    $exe = Join-Path $dest 'Dark Mine.exe'
    $lnk = Join-Path ([Environment]::GetFolderPath('Programs')) 'Dark Mine.lnk'
    $shortcut = (New-Object -ComObject WScript.Shell).CreateShortcut($lnk)
    $shortcut.TargetPath = $exe
    $shortcut.WorkingDirectory = $dest
    $shortcut.Save()

    Write-Host "Installed: $dest  (Start Menu: Dark Mine)"
    if (-not $env:DARKMINE_NO_LAUNCH) { Start-Process -FilePath $exe -WorkingDirectory $dest }
}
finally {
    Remove-Item -Path $tmp -Recurse -Force -ErrorAction SilentlyContinue
}
