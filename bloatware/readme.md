* [24H2 Remove Bloatware (copy/paste)](./24H2_remove_bloatware.md)
* [24H2 Remove Blaotware and Disable Bitlocker for Sysprep](./remove_bloatware.md)
* [Remove Bloatware (PowerShell Script)](./remove_bloatware.ps1)

#Copy/Paste into PowerShell to run from GiHub

```powershell
$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/Prohtius/PowerShell/refs/heads/main/bloatware/remove_bloatware.ps1
Invoke-Expression $($ScriptFromGitHub.Content)
```
