# Domain join and put in target Organizational Unit and restart



$domain -- gets your domain name in format dc=example,dc=org <br />
$ouPath -- uses ldap convention of ou's being in bottom up then domain

```
galactic-republic.org/
├─ computers/
│  ├─ senate/
```
oupath = "ou=senate,ou=computers,dc=galactic-republic,dc=org"

```
$ouPath = "add your path here"

$domainName = (Get-AdDomain).DistinguishedName

$add_computer_details = @{
  Domain = $domainName
  OUPath = $ouPath
}

Add-Computer @add_computer_details
```
