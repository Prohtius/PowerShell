<!-- ![Prohtius Logo](https://prohtiusaws-0001.s3.us-east-1.amazonaws.com/ProhtiusText.png) -->
[![License: MIT](https://cdn.prod.website-files.com/5e0f1144930a8bc8aace526c/65dd9eb5aaca434fac4f1c34_License-MIT-blue.svg)](/LICENSE)

# Prohtius' PowerShell Scripts

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
