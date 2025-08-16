## Remove Some Bloatware and Things Breaking Sysprep in 24H2

```powershell
$bloatapps = @(
"*WindowsMaps",
"MSTeams",
"*YourPhone",
"*ZuneMusic",
"*ZuneVideo",
"*WindowsMaps",
"*WindowsCamera",
"*WindowsAlarms",
"*Todos",
"*People",
"*MicrosoftOfficeHub",
"*MicrosoftSolitaireCollection",
"*Bing*",
"*windowscommunicationsapps",
"*Clipchamp",
"*OutlookForWindows",
"*Windows.Photos",
"*WindowsSoundRecorder",
"*MicrosoftStickyNotes",
"*Copilot",
"*WindowsFeedbackHub",
"*StartExperiences*",
"*Widget*",
"*family*"
)

foreach ($bloatapp in $bloatapps)
{
Get-AppxProvisionedPackage -Online | Where "DisplayName" -like $bloatapp | Remove-AppxProvisionedPackage -Online -Verbose
Get-AppxPackage -Name $bloatapp -AllUsers | Remove-AppxPackage -AllUsers -Verbose
}
```
## Disable Bitlocker on Fresh Windows 11 install
```powershell 
manage-bde -off C:
```
![starting decryption](https://prohtiusaws-0001.s3.us-east-1.amazonaws.com/off_cmd.png)

### *Repeat to check progress on decryption until fully decrypted*
```powershell
manage-bde -status
```
Check until zero!\

![starting decryption](https://prohtiusaws-0001.s3.us-east-1.amazonaws.com/check_progress.png)
![fully decrypted!](https://prohtiusaws-0001.s3.us-east-1.amazonaws.com/fully_decrypted.png)

Sysprep should run without complaining! 
