# Microsoft Graph PowerShell
## Install Graph Module
```powershell
Install-Module Microsoft.Graph -Scope CurrentUser
```

### Verify Graph Installation
```powershell
Get-InstalledModule Microsoft.Graph
```

## Connect to Graph
```powershell
connect-mggraph
```

## Granular Delegated Admin Privileges Managment
### Connect
#### Install Modules
```powershell
Install-Module -Name Microsoft.Graph -Scope CurrentUser

Install-Module -Name PartnerCenter -Scope CurrentUser
```

#### Connect to Graph
```powershell
Connect-MgGraph -Scopes "Directory.ReadWrite.All", "User.ReadWrite.All"
```

#### Get List of GDAP Relationships
```powershell
$gdap_relationships = Get-MgTenantRelationshipDelegatedAdminRelationship -All

$relationships_table = @()

foreach ($gdap_relationship in $gdap_relationships) 
{
    $relationships_table += [PSCustomObject]@{
        RelationShipName    = $gdap_relationship.DisplayName
        CustomerName        = $gdap_relationship.Customer.DisplayName
        CustomerTenantId    = $gdap_relationship.Customer.TenantId        
    }
}

$relationships_table | FT -auto -wrap
```

#### Connect to Specific Tenant
```powershell
Connect-MgGraph -TenantId <tenant_id> -Scopes CurrentUser
```
