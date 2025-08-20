<#
  Author: Steve Grimstead (Prohtius)
  Date: 08-20-2025
  Version: 1.0  
  Purpose: Creates new webclient, then uses webclient to download the MS Server 2016 ISO image and save it to the destination.  
#>

#----- Change destination as need for your system ----
$destination = "C:\tmp\isos\server-2016\MSServer-2016.iso"

$source = "https://go.microsoft.com/fwlink/p/?LinkID=2195174&clcid=0x409&culture=en-us&country=US"

$webclient = New-Object System.Net.WebClient
$webClient.DownloadFile($source,$destination)
