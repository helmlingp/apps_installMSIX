<#	
  .Synopsis
    This powershell script installs an MSIX or MSIXBUNDLE application from the current folder
  .NOTES
	  Created:   	    August, 2021
	  Created by:	    Phil Helmling, @philhelmling
	  Organization:   VMware, Inc.
	  Filename:       installMSIX.ps1
	.DESCRIPTION
	  Installs an MSIX or MSIXBUNDLE application from the current folder
  .EXAMPLE
    powershell.exe -ep bypass -file .\installMSIX.ps1
#>

$current_path = $PSScriptRoot;
if ($PSScriptRoot -eq "") {
    $current_path = "C:\Airwatch";
}

$msix = Get-ChildItem -Path $current_path -Include *.msix* -Recurse -ErrorAction SilentlyContinue
write-host $msix.FullName
if($msix){
	Add-AppxProvisionedPackage -Online -PackagePath $msix.FullName -SkipLicense
} else {
    
}