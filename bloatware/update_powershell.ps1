<#
  Author: Steve Grimstead (Prohtius)
  Date: 08-20-2025
  Version: 1.0
  Target OS: Microsoft Windows
  Purpose: Creates new webclient, then uses webclient to download the MS Server 2025 ISO image and save it to the destination.

  curl -L "https://github.com/PowerShell/PowerShell/releases/download/v7.5.4/PowerShell-7.5.4-win-x64.msi" --output c:\tmp\powershell-7.5.4.msi
#>

#-----------------------------------------------------
#|  Change variables in this section as needed       |
#-----------------------------------------------------

#----- Change drive letter as needed         -----
$target_drive = Read-Host "Enter drive to save file to"

#----- Change destination as needed          -----
#----- default path is C:\tmp\isos\server-2022 folder -----
Write-Host "Folder path should be in the format of just the folder name or path without the drive, such as 'tmp' or 'tmp\downloads'"
$folder_path = Read-Host "Enter folder to save file to"

#-----------------------------------------------------
#|  End change variables section                     |
#-----------------------------------------------------

$source = "https://github.com/PowerShell/PowerShell/releases/download/v7.5.4/PowerShell-7.5.4-win-x86.msi"

$msi_name = ($source -split "/")[-1]

$save_destination = "$($target_drive)\$($folder_path)\$($msi_name)"

Write-Host "$($save_destination)"

if (!(Test-Path -Path "$($target_drive)\$($folder_path)")) 
{
  Write-Host -Message "$($target_drive)\$($folder_path) does not exist, creating" -ForegroundColor Yellow

  try
  {
    new-item -itemtype directory -path "$($target_drive)\" -name $folder_path
  }
  catch 
  {
    Write-Error $_.Exception.Message
  }
}

try
{
  & curl -L $source --output "$($save_destination)"

  Write-Host "Download completed." -ForegroundColor Green

  try
  {
    Start-Process "msiexec.exe" /i $save_destination
  }
  catch
  {
    Write-Error $_.Error.Message
  }
}
catch 
{
  Write-Error $_.Exception.Message
}
