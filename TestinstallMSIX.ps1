<#	
  .Synopsis
    This powershell script is used as "When to Call Install Complete" Custom Script for MSIX or MSIXBundles
  .NOTES
	  Created:   	    August, 2021
	  Created by:	    Phil Helmling, @philhelmling
	  Organization:   VMware, Inc.
	  Filename:       TestinstallMSIX.ps1
	.DESCRIPTION
	  Used as "When to Call Install Complete" Custom Script for MSIX or MSIXBundles.
    Specify the MSIX Name with -Package parameter
    To determine what the name is, run the following on a machine already installed:
    Get-AppxPackage | Where-Object Name -like {*PACKAGENAME*}
    look for Name
  .EXAMPLE
    powershell.exe -ep bypass -file .\TestinstallMSIX.ps1 -Package Microsoft.MsixPackagingTool
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$Package
)

$ec = 1

$app = Get-AppPackage -AllUsers | Where-Object {$_.Name -eq $Package}
write-host $app.Name
if ($app) {$ec = 0}else{$ec = 1}
return $ec