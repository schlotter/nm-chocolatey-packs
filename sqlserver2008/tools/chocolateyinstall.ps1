# stop on all errors
$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -parent $PSCommandPath
$configFile = "$toolsDir\configuration.ini"
$thisUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

Write-Host "Configuration file is $configFile"

function BuildConfigurationFile()
{
    remove-item -path "$configFile" -Force -ErrorAction SilentlyContinue
    
    Add-Content $configFile "[OPTIONS]"

	##
    ## Below generated from https://github.com/neutmute/chocolatey-packs/raw/master/sqlserver2008/docs/sql2008_ParamGenerator.xlsx
	##
	
    # If user didn't supply some basic requirements, set them
    
	# Write config to file


}

BuildConfigurationFile

$mountedIso = Mount-DiskImage -PassThru "$env:choco:sqlserver2008:isoImage"
$isoDrive = Get-Volume -DiskImage $mountedIso | Select -expand DriveLetter
Write-Host "Mounted ISO to $isoDrive"

$output = & "$isoDrive`:\setup.exe" "/ConfigurationFile=$configFile"

$sqlSetupErrorlevel = $LASTEXITCODE
Write-Host "setup error level=$sqlSetupErrorlevel"
Write-Host $output

Write-Host "Dismounting ISO"
Dismount-DiskImage -ImagePath $env:choco:sqlserver2008:isoImage
exit $sqlSetupErrorlevel
