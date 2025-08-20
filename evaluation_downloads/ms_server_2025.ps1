<#
  Author: Steve Grimstead (Prohtius)
  Date: 08-20-2025
  Version: 1.0
  Target OS: Microsoft Windows
  Purpose: Creates new webclient, then uses webclient to download the MS Server 2025 ISO image and save it to the destination.
#>

#-----------------------------------------------------
#|  Change variables in this section as needed       |
#-----------------------------------------------------
#----- Change name of ISO to what you prefer -----
$iso_name = "MSServer-2025.iso"

#----- Change drive letter as needed         -----
$target_drive = "C:"

#----- Change destination as needed          -----
#----- default path is C:\tmp\isos\server-2022 folder -----
$folder_path = "tmp\isos\server-2025"

#-----------------------------------------------------
#|  End change variables section                     |
#-----------------------------------------------------

$save_destination = "$($target_drive)\$($folder_path)\$($iso_name)"

Write-Host "$($save_destination)"

$source = "https://go.microsoft.com/fwlink/?linkid=2293215&clcid=0x409&culture=en-us&country=us"

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
  $webclient = New-Object System.Net.WebClient
  
  $webClient.DownloadFile($source, $save_destination) 

  Write-Host "Download completed." -ForegroundColor Green
}
catch 
{
  Write-Error $_.Exception.Message
}
