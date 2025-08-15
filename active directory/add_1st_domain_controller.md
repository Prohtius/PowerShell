
```powershell
<#
  Author: Steve Grimstead (Prohtius)
  Purpose: Creates the first domain controller in a forest using the
    domain name provided.

  *****************************
  *** Only for new forests! ***
  *****************************
#>

#  change the domain_name variable to the domain name of your domain!
$domain_name = "example.org"

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
