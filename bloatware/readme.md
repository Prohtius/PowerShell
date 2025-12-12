* [24H2 Remove Bloatware](./24H2_remove_bloatware.md)

#Copy/Paste into PowerShell to run from GiHub

```powershell
$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/Prohtius/PowerShell/refs/heads/main/bloatware/remove_bloatware.ps1
Invoke-Expression $($ScriptFromGitHub.Content)
```
