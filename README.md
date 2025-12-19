<!-- ![Prohtius Logo](https://prohtiusaws-0001.s3.us-east-1.amazonaws.com/ProhtiusText.png) -->
[![License: MIT](https://cdn.prod.website-files.com/5e0f1144930a8bc8aace526c/65dd9eb5aaca434fac4f1c34_License-MIT-blue.svg)](/LICENSE)

# Prohtius' PowerShell Scripts
PowerShell scripts for doing the things.

* [Insall Winget (PowerShell)](#install-winget)
* [Download System Setup Installer for VSCode](#download-system-setup-installer-for-vscode)

# Quick Scripts
## Install Winget
### PowerShell
Invoke-WebRequest can be used instead of WebClient, but to me, it feels slower.
```powershell
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
```
### Curl and PowerShell
Using Curl for the download also works, however, Curl in PowerShell is an alias for "Invoke-WebRequest" which is obviously not the same. 😄
From a Command Prompt (No "PS" before prompt)
```batch
curl -L "https://github.com/microsoft/winget-cli/releases/download/v1.10.390/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" --output "C:\tmp\winget-install.msxibundle"
```
In PowerShell
```powershell
add-appxpackage -path "c:\tmp\winget-install.msixbundle"
```

## Download System Setup Installer for VSCode
```
curl -L "https://go.microsoft.com/fwlink/?linkid=852157" --output C:\tmp\vscode.exe
```


## Quickly run the bloatware script
```powershell
$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/Prohtius/PowerShell/refs/heads/main/bloatware/remove_bloatware.ps1
Invoke-Expression $($ScriptFromGitHub.Content)
```

## Download System Setup installer for VSCode
```powershell
curl -L "https://go.microsoft.com/fwlink/?linkid=852157" --output C:\tmp\vscode.exe
```

## Install Hyper-V, Hypervisor Platform, Virtual Machine Platform, and WSL
```powershell
Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Hyper-V-All","HypervisorPlatform","VirtualMachinePlatform","Microsoft-Windows-Subsystem-Linux"
```

<!--
## Initial Settings
```
$ScriptFromGitHub = Invoke-WebRequest https://github.com/PowerShell/PowerShell/releases/download/v7.5.3/PowerShell-7.5.3-win-x64.msi
Invoke-Expression $($ScriptFromGitHub.Content)
```
-->
<!-- 
🎉
⚒️
🔧
🚀
📦
💰
💾
🔋
🔐
🔒
:atom:
☁️

-->
