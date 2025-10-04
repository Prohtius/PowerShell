# Using PowerShell

1. open terminal as admin
2. list rsat tools
```powershell
 Get-WindowsCapability -Name RSAT* -Online | Format-Table NAme,DisplayName,State -Auto -Wrap
```
3. Choose the RSAT tools to install using command
```powershell
<# --------------------------------------------------
   |   Installs the following RSAT Tools            |
   | Active Directory Tools, DHCP Manager,          |
   | DNS Manager, Group Policy Managemenr,          |
   | and Server Manager                             |
    --------------------------------------------------#>
$rsat_tools = @(
  "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0",
  "Rsat.DHCP.Tools~~~~0.0.1.0",
  "Rsat.Dns.Tools~~~~0.0.1.0",
  "Rsat.GroupPolicy.Management.Tools~~~~0.0.1.0 ",
  "Rsat.ServerManager.Tools~~~~0.0.1.0 "
)

foreach ($rsat_tool in $rsat_Tools)
{
  $is_installed = Get-WindowsCapability -Online -Name $rsat_tool

  if ($is_installed.State -ne "Installed")
  {
    try
    {
      Write-Host "Installing $($rsat_tool)" -ForegroundColor Green
      Add-WindowsCapability -Name $rsat_tool -Online -Verbose
    }
    catch
    {
      Write-Host "Failed to install $($rsat_tool)" -ForegroundColor Red
    }
  }
  else
  {
    Write-Host "$($rsat_tool) is installed, skipping." -ForegroundColor Yellow
  }
}
```
