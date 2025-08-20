<#
  Author: Steve Grimstead (Prohtius)
  Date: 08-20-2025
  Version: 1.0
  Target OS: Microsoft Windows
  Purpose: Creates new webclient, then uses webclient to download the winget msixbundle and save it to the destination.
    Currently no error checking or verifying that folder structure exists!
#>

$webclient = New-Object System.Net.WebClient

$source = "https://github.com/microsoft/winget-cli/releases/download/v1.10.390/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"

$destination = "C:\tmp\winget\winget.msixbundle"

$webClient.DownloadFile($source,$destination) 

Write-Host "Download complete." -ForegroundColor Green

add-appxpackage -path "c:\tmp\winget\winget.msixbundle"
