```powershell
<#
  Author: Steve Grimstead (Prohtius)
  Date: 08-19-2025
  Version: 1.0  
  Purpose: Creates the first domain controller in a forest using the
    domain name provided.

  Link: https://raw.githubusercontent.com/Prohtius/PowerShell/refs/heads/main/active%20directory/add_1st_domain_controller..ps1

  *****************************
  *** Only for new forests! ***
  *****************************
#>

#  change the domain_name variable to the domain name of your domain!
$domain_name = ""

<#
  Gets the first part of the domain name and uses it as the
  NetBIOS name, if this is a sub domain such as lan.example.org,
  then the NetBIOS name will be LAN.
#>
$net_bios_name = $domain_name.Split(".")[0]

$forest_settings = @{
    DomainName        = $domain_name
    DomainNetBIOSName = $net_bios_name
    DomainMode        = 6
    ForestMode        = 6
    InstallDNS        = $true
    Force             = $true
}

Install-ADDSForest @forest_settings
```
