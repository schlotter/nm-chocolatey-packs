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
    ## Below generated from https://github.com/neutmute/nm-chocolatey-packs/raw/master/sqlserver2019/docs/sql2019_ParamGenerator.xlsx
	##

    # If user didn't supply some basic requirements, set them
    # Copy/paste 'Set Default' column under here

    # Write config to file
    # Copy/paste 'Write Env Var to config' column under here
    
}


function DetermineSetupPath(){

    if (!(Test-Path env:\choco:sqlserver2019:setupFolder)){

        if (!(Test-Path env:\choco:sqlserver2019:isoImage))
        {
	        Write-Error "This package requires a path to SQL installation Media via environment variables. eg: 'SET choco:sqlserver2019:setupFolder=<Folder>' or 'SET choco:sqlserver2019:isoImage=<Filename>'. See readme.md on github."
            exit -1
        }

        $global:mustDismountIso = $true;
        $mountedIso = Mount-DiskImage -PassThru "$env:choco:sqlserver2019:isoImage"
        $isoDrive = Get-Volume -DiskImage $mountedIso | Select -expand DriveLetter
        Write-Host "Mounted ISO to $isoDrive"
        $env:choco:sqlserver2019:setupFolder = "$isoDrive`:\"
    }

    Write-Host "Path to setup.exe is $env:choco:sqlserver2019:setupFolder"
}


function Teardown(){

    if ($global:mustDismountIso){
        Write-Host "Dismounting ISO"
        Dismount-DiskImage -ImagePath $env:choco:sqlserver2019:isoImage
    }
    else
    {
        Write-Host "No ISO to dismount"
    }
}

function ExecuteSetup(){
    $setupExe = "$env:choco:sqlserver2019:setupFolder\setup.exe"
    Write-Host "Executing $setupExe with $configFile"

	Install-ChocolateyInstallPackage `
          -PackageName "sqlserver2019" `
          -FileType 'exe' `
          -SilentArgs "/IACCEPTSQLSERVERLICENSETERMS /ConfigurationFile=$configFile" `
          -File "$setupExe" `
}

$global:mustDismountIso = $false

DetermineSetupPath

BuildConfigurationFile

ExecuteSetup

Teardown
