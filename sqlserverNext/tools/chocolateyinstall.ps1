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
    ## Below generated from https://github.com/neutmute/nm-chocolatey-packs/raw/master/sqlserver{Next}/docs/sql{Next}_ParamGenerator.xlsx
	##

    # If user didn't supply some basic requirements, set them
    # Copy/paste 'Set Default' column under here

    # Write config to file
    # Copy/paste 'Write Env Var to config' column under here
    
}


function DetermineSetupPath(){

    if (!(Test-Path env:\choco:sqlserver{Next}:setupFolder)){

        if (!(Test-Path env:\choco:sqlserver{Next}:isoImage))
        {
	        Write-Error "This package requires a path to SQL installation Media via environment variables. eg: 'SET choco:sqlserver{Next}:setupFolder=<Folder>' or 'SET choco:sqlserver{Next}:isoImage=<Filename>'. See readme.md on github."
            exit -1
        }

        $global:mustDismountIso = $true;
        $mountedIso = Mount-DiskImage -PassThru "$env:choco:sqlserver{Next}:isoImage"
        $isoDrive = Get-Volume -DiskImage $mountedIso | Select -expand DriveLetter
        Write-Host "Mounted ISO to $isoDrive"
        $env:choco:sqlserver{Next}:setupFolder = "$isoDrive`:\"
    }

    Write-Host "Path to setup.exe is $env:choco:sqlserver{Next}:setupFolder"
}


function Teardown(){

    if ($global:mustDismountIso){
        Write-Host "Dismounting ISO"
        Dismount-DiskImage -ImagePath $env:choco:sqlserver{Next}:isoImage
    }
    else
    {
        Write-Host "No ISO to dismount"
    }
}

function ExecuteSetup(){
    $setupExe = "$env:choco:sqlserver{Next}:setupFolder\setup.exe"
    Write-Host "Executing $setupExe with $configFile"

	Install-ChocolateyInstallPackage `
          -PackageName "sqlserver{Next}" `
          -FileType 'exe' `
          -SilentArgs "/IACCEPTSQLSERVERLICENSETERMS /ConfigurationFile=$configFile" `
          -File "$setupExe" `
}

$global:mustDismountIso = $false

DetermineSetupPath

BuildConfigurationFile

ExecuteSetup

Teardown
