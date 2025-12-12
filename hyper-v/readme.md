# Hyper-V Commands

* [Enable Nested Virtualization](#enable-nested-virtualization)

## Enabled nested virtualization
```powershell
$vm_name = Read-Host "Enter VM Name"
Set-VMProcessor -VMName $vm_name -ExposeVirtualizationExtensions $true
```
