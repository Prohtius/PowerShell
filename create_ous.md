```powershell
$domain = (Get-AdDomain).DistinguishedName
$dnsRoot = (Get-AdDomain).DNSRoot

$root_OU = "_republic"

$base_OUs = @(
    "computers",
    "groups",
    "users"
)

$common_OUs = @(
    "it",
    "jedi",
    "senate"
)

$ouPath = $domain

$ouPath = $ouPath.insert(0, "ou=$($root_OU),")

#-------------------------
#   Script Start
#-------------------------

Write-Host "Verifying $($ouPath)..."

if (!(Get-ADOrganizationalUnit -Filter 'DistinguishedName -eq "$($ouPath)"' -ErrorAction SilentlyContinue)) {
    Write-Host "`t$($ouPath) not found!" -ForegroundColor Red

    Write-Host "`tAttempting to create $($ouPath)..."

    try 
    {
        New-ADOrganizationalUnit -Name $root_OU -path $domain -ProtectedFromAccidentalDeletion $false -WhatIf

        Write-Host "`t$($ouPath) created successfully...`n" -ForegroundColor Green
    }
    catch 
    {
        $err = $_.Exception.Message

        Write-Host "`t$($err)" -ForegroundColor Red
    }
}

foreach ($baseOU in $base_OUs)
{
    $baseOUPath = $ouPath.insert(0, "ou=$($baseOU),")

    Write-Host "Verifying $($baseOUPath)..."

    if (!(Get-ADOrganizationalUnit -Filter 'DistinguishedName -eq "$($baseOUPath)"' -ErrorAction SilentlyContinue))
    {
        Write-Host "`t$($baseOUPath) not found!" -ForegroundColor Red

        Write-Host "`tAttempting to create $($baseOUPath)..."

        try {
            New-ADOrganizationalUnit -Name $baseOU -path $ouPath -ProtectedFromAccidentalDeletion $false -WhatIf

            Write-Host "`t$($baseOUPath) created successfully...`n" -ForegroundColor Green
            
            foreach ($commonOU in $common_OUs)
            {
                $commonOUPath = $baseOUPath.insert(0, "ou=$($commonOU),")

                Write-Host "Verifying $($commonOUPath)..."

                if (!(Get-ADOrganizationalUnit -Filter 'DistinguishedName -eq "$($commonOUPath)"' -ErrorAction SilentlyContinue))
                {
                    Write-Host "`t$($commonOUPath) not found!" -ForegroundColor Red

                    Write-Host "`tAttempting to create $($commonOUPath)..."

                    try 
                    {
                        New-ADOrganizationalUnit -Name $commonOU -path $baseOUPath -ProtectedFromAccidentalDeletion $false -WhatIf

                        Write-Host "`t$($commonOUPath) created successfully...`n" -ForegroundColor Green
                    }
                    catch 
                    {
                        $err = $_.Exception.Message

                        Write-Host "`t$($err)" -ForegroundColor Red
                    }
                }
            }            
        }
        catch {
            $err = $_.Exception.Message

            Write-Host "`t$($err)" -ForegroundColor Red
        }        
    }
}
```
