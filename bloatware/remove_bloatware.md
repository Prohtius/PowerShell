## Remove Some Bloatware and Things Breaking Sysprep in 24H2

```
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
"*Widgets*"
)

foreach ($bloatapp in $bloatapps)
{
Get-AppxProvisionedPackage -Online | Where "DisplayName" -eq $bloatapp | Remove-AppxProvisionedPackage -Online -Verbose
Get-AppxPackage -Name $bloatapp -AllUsers | Remove-AppxPackage -AllUsers -Verbose
}
```
## Disable Bitlocker on Fresh Windows 11 install
`manage-bde -off C:`

### *Repeat to check progress on decryption until fully decrypted*
`maange-bde -status`
