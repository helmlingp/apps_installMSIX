<#	
  .Synopsis
    This powershell script installs an MSIX or MSIXBUNDLE application from the current folder
  .NOTES
	  Created:   	    August, 2021
	  Created by:	    Phil Helmling, @philhelmling
	  Organization:   VMware, Inc.
	  Filename:       installMSIX.ps1
		github:         https://github.com/helmlingp/apps_installMSIX
	.DESCRIPTION
	  Installs an MSIX or MSIXBUNDLE application from the current folder
  .EXAMPLE
    Install Command
    powershell.exe -ep bypass -file .\installMSIX.ps1

    When to Call Install Complete (see TestinstallMSIX.ps1 script in same repo)
    powershell.exe -ep bypass -file .\TestinstallMSIX.ps1 -Package Microsoft.MsixPackagingTool

    Uninstall Command
    powershell.exe -Command "Get-AppxPackage -AllUsers | Where-Object Name -eq {Microsoft.MsixPackagingTool} | Remove-AppxPackage -AllUsers"
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
