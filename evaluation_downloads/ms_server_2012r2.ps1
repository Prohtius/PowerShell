<#
  Author: Steve Grimstead (Prohtius)
  Date: 08-20-2025
  Version: 1.0  
  Purpose: Creates new webclient, then uses webclient to download the MS Server 2012r2 ISO image and save it to the destination.

  Link: 
#>

#----- Change destination as need for your system ----
$destination = "C:\tmp\isos\server-2012r2\MSServer-2012r2.iso"

$source = "https://go.microsoft.com/fwlink/p/?LinkID=2195443&clcid=0x409&culture=en-us&country=US"

$webclient = New-Object System.Net.WebClient
$webClient.DownloadFile($source,$destination)
