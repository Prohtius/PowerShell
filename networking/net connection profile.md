# Change Network Profile from Public to Private for ALL Adapters
`Get-NetConnectionProfile -NetworkCategory "Public" | ForEach-Object { Set-NetConnectionProfile -InterfaceIndex $_.InterfaceIndex -NetworkCategory "Private" }`
