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
    ## Below generated from https://github.com/neutmute/nm-chocolatey-packs/raw/master/sqlserver2014/docs/sql2014_ParamGenerator.xlsx
	##

    # If user didn't supply some basic requirements, set them
    if (!(Test-Path env:\choco:sqlserver2014:ACTION)){$env:choco:sqlserver2014:ACTION="Install"}
    if (!(Test-Path env:\choco:sqlserver2014:IACCEPTSQLSERVERLICENSETERMS)){$env:choco:sqlserver2014:IACCEPTSQLSERVERLICENSETERMS="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2014:FEATURES)){$env:choco:sqlserver2014:FEATURES="SQLENGINE"}
    if (!(Test-Path env:\choco:sqlserver2014:INSTANCENAME)){$env:choco:sqlserver2014:INSTANCENAME="MSSQLSERVER"}
    if (!(Test-Path env:\choco:sqlserver2014:Q)){$env:choco:sqlserver2014:Q="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2014:SQLSVCACCOUNT)){$env:choco:sqlserver2014:SQLSVCACCOUNT="NT Service\MSSQLSERVER"}
    if (!(Test-Path env:\choco:sqlserver2014:SQLSVCSTARTUPTYPE)){$env:choco:sqlserver2014:SQLSVCSTARTUPTYPE="Automatic"}
    if (!(Test-Path env:\choco:sqlserver2014:SQLSYSADMINACCOUNTS)){$env:choco:sqlserver2014:SQLSYSADMINACCOUNTS="$thisUser"}
    if (!(Test-Path env:\choco:sqlserver2014:FILESTREAMSHARENAME)){$env:choco:sqlserver2014:FILESTREAMSHARENAME=""}

    # Write config to file
    if (Test-Path env:\choco:sqlserver2014:ACTION){Add-Content $configFile "ACTION=`"$env:choco:sqlserver2014:ACTION`""}
    if (Test-Path env:\choco:sqlserver2014:IACCEPTSQLSERVERLICENSETERMS){Add-Content $configFile "IACCEPTSQLSERVERLICENSETERMS=`"$env:choco:sqlserver2014:IACCEPTSQLSERVERLICENSETERMS`""}
    if (Test-Path env:\choco:sqlserver2014:ENU){Add-Content $configFile "ENU=`"$env:choco:sqlserver2014:ENU`""}
    if (Test-Path env:\choco:sqlserver2014:UpdateEnabled){Add-Content $configFile "UpdateEnabled=`"$env:choco:sqlserver2014:UpdateEnabled`""}
    if (Test-Path env:\choco:sqlserver2014:UpdateSource){Add-Content $configFile "UpdateSource=`"$env:choco:sqlserver2014:UpdateSource`""}
    if (Test-Path env:\choco:sqlserver2014:CONFIGURATIONFILE){Add-Content $configFile "CONFIGURATIONFILE=`"$env:choco:sqlserver2014:CONFIGURATIONFILE`""}
    if (Test-Path env:\choco:sqlserver2014:ERRORREPORTING){Add-Content $configFile "ERRORREPORTING=`"$env:choco:sqlserver2014:ERRORREPORTING`""}
    if (Test-Path env:\choco:sqlserver2014:FEATURES){Add-Content $configFile "FEATURES=`"$env:choco:sqlserver2014:FEATURES`""}
    if (Test-Path env:\choco:sqlserver2014:HELP){Add-Content $configFile "HELP=`"$env:choco:sqlserver2014:HELP`""}
    if (Test-Path env:\choco:sqlserver2014:INDICATEPROGRESS){Add-Content $configFile "INDICATEPROGRESS=`"$env:choco:sqlserver2014:INDICATEPROGRESS`""}
    if (Test-Path env:\choco:sqlserver2014:INSTALLSHAREDDIR){Add-Content $configFile "INSTALLSHAREDDIR=`"$env:choco:sqlserver2014:INSTALLSHAREDDIR`""}
    if (Test-Path env:\choco:sqlserver2014:INSTALLSHAREDWOWDIR){Add-Content $configFile "INSTALLSHAREDWOWDIR=`"$env:choco:sqlserver2014:INSTALLSHAREDWOWDIR`""}
    if (Test-Path env:\choco:sqlserver2014:INSTANCEDIR){Add-Content $configFile "INSTANCEDIR=`"$env:choco:sqlserver2014:INSTANCEDIR`""}
    if (Test-Path env:\choco:sqlserver2014:INSTANCEID){Add-Content $configFile "INSTANCEID=`"$env:choco:sqlserver2014:INSTANCEID`""}
    if (Test-Path env:\choco:sqlserver2014:INSTANCENAME){Add-Content $configFile "INSTANCENAME=`"$env:choco:sqlserver2014:INSTANCENAME`""}
    if (Test-Path env:\choco:sqlserver2014:PID){Add-Content $configFile "PID=`"$env:choco:sqlserver2014:PID`""}
    if (Test-Path env:\choco:sqlserver2014:Q){Add-Content $configFile "Q=`"$env:choco:sqlserver2014:Q`""}
    if (Test-Path env:\choco:sqlserver2014:QS){Add-Content $configFile "QS=`"$env:choco:sqlserver2014:QS`""}
    if (Test-Path env:\choco:sqlserver2014:UIMODE){Add-Content $configFile "UIMODE=`"$env:choco:sqlserver2014:UIMODE`""}
    if (Test-Path env:\choco:sqlserver2014:SQMREPORTING){Add-Content $configFile "SQMREPORTING=`"$env:choco:sqlserver2014:SQMREPORTING`""}
    if (Test-Path env:\choco:sqlserver2014:HIDECONSOLE){Add-Content $configFile "HIDECONSOLE=`"$env:choco:sqlserver2014:HIDECONSOLE`""}
    if (Test-Path env:\choco:sqlserver2014:AGTSVCACCOUNT){Add-Content $configFile "AGTSVCACCOUNT=`"$env:choco:sqlserver2014:AGTSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2014:AGTSVCPASSWORD){Add-Content $configFile "AGTSVCPASSWORD=`"$env:choco:sqlserver2014:AGTSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2014:AGTSVCSTARTUPTYPE){Add-Content $configFile "AGTSVCSTARTUPTYPE=`"$env:choco:sqlserver2014:AGTSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2014:ASBACKUPDIR){Add-Content $configFile "ASBACKUPDIR=`"$env:choco:sqlserver2014:ASBACKUPDIR`""}
    if (Test-Path env:\choco:sqlserver2014:ASCOLLATION){Add-Content $configFile "ASCOLLATION=`"$env:choco:sqlserver2014:ASCOLLATION`""}
    if (Test-Path env:\choco:sqlserver2014:ASCONFIGDIR){Add-Content $configFile "ASCONFIGDIR=`"$env:choco:sqlserver2014:ASCONFIGDIR`""}
    if (Test-Path env:\choco:sqlserver2014:ASDATADIR){Add-Content $configFile "ASDATADIR=`"$env:choco:sqlserver2014:ASDATADIR`""}
    if (Test-Path env:\choco:sqlserver2014:ASLOGDIR){Add-Content $configFile "ASLOGDIR=`"$env:choco:sqlserver2014:ASLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2014:ASSERVERMODE){Add-Content $configFile "ASSERVERMODE=`"$env:choco:sqlserver2014:ASSERVERMODE`""}
    if (Test-Path env:\choco:sqlserver2014:ASSVCACCOUNT){Add-Content $configFile "ASSVCACCOUNT=`"$env:choco:sqlserver2014:ASSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2014:ASSVCPASSWORD){Add-Content $configFile "ASSVCPASSWORD=`"$env:choco:sqlserver2014:ASSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2014:ASSVCSTARTUPTYPE){Add-Content $configFile "ASSVCSTARTUPTYPE=`"$env:choco:sqlserver2014:ASSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2014:ASSYSADMINACCOUNTS){Add-Content $configFile "ASSYSADMINACCOUNTS=`"$env:choco:sqlserver2014:ASSYSADMINACCOUNTS`""}
    if (Test-Path env:\choco:sqlserver2014:ASTEMPDIR){Add-Content $configFile "ASTEMPDIR=`"$env:choco:sqlserver2014:ASTEMPDIR`""}
    if (Test-Path env:\choco:sqlserver2014:ASPROVIDERMSOLAP){Add-Content $configFile "ASPROVIDERMSOLAP=`"$env:choco:sqlserver2014:ASPROVIDERMSOLAP`""}
    if (Test-Path env:\choco:sqlserver2014:FARMACCOUNT){Add-Content $configFile "FARMACCOUNT=`"$env:choco:sqlserver2014:FARMACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2014:FARMPASSWORD){Add-Content $configFile "FARMPASSWORD=`"$env:choco:sqlserver2014:FARMPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2014:PASSPHRASE){Add-Content $configFile "PASSPHRASE=`"$env:choco:sqlserver2014:PASSPHRASE`""}
    if (Test-Path env:\choco:sqlserver2014:FARMADMINIPORT){Add-Content $configFile "FARMADMINIPORT=`"$env:choco:sqlserver2014:FARMADMINIPORT`""}
    if (Test-Path env:\choco:sqlserver2014:BROWSERSVCSTARTUPTYPE){Add-Content $configFile "BROWSERSVCSTARTUPTYPE=`"$env:choco:sqlserver2014:BROWSERSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2014:ENABLERANU){Add-Content $configFile "ENABLERANU=`"$env:choco:sqlserver2014:ENABLERANU`""}
    if (Test-Path env:\choco:sqlserver2014:INSTALLSQLDATADIR){Add-Content $configFile "INSTALLSQLDATADIR=`"$env:choco:sqlserver2014:INSTALLSQLDATADIR`""}
    if (Test-Path env:\choco:sqlserver2014:SAPWD){Add-Content $configFile "SAPWD=`"$env:choco:sqlserver2014:SAPWD`""}
    if (Test-Path env:\choco:sqlserver2014:SECURITYMODE){Add-Content $configFile "SECURITYMODE=`"$env:choco:sqlserver2014:SECURITYMODE`""}
    if (Test-Path env:\choco:sqlserver2014:SQLBACKUPDIR){Add-Content $configFile "SQLBACKUPDIR=`"$env:choco:sqlserver2014:SQLBACKUPDIR`""}
    if (Test-Path env:\choco:sqlserver2014:SQLCOLLATION){Add-Content $configFile "SQLCOLLATION=`"$env:choco:sqlserver2014:SQLCOLLATION`""}
    if (Test-Path env:\choco:sqlserver2014:ADDCURRENTUSERASSQLADMIN){Add-Content $configFile "ADDCURRENTUSERASSQLADMIN=`"$env:choco:sqlserver2014:ADDCURRENTUSERASSQLADMIN`""}
    if (Test-Path env:\choco:sqlserver2014:SQLSVCACCOUNT){Add-Content $configFile "SQLSVCACCOUNT=`"$env:choco:sqlserver2014:SQLSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2014:SQLSVCPASSWORD){Add-Content $configFile "SQLSVCPASSWORD=`"$env:choco:sqlserver2014:SQLSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2014:SQLSVCSTARTUPTYPE){Add-Content $configFile "SQLSVCSTARTUPTYPE=`"$env:choco:sqlserver2014:SQLSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2014:SQLSYSADMINACCOUNTS){Add-Content $configFile "SQLSYSADMINACCOUNTS=`"$env:choco:sqlserver2014:SQLSYSADMINACCOUNTS`""}
    if (Test-Path env:\choco:sqlserver2014:SQLTEMPDBDIR){Add-Content $configFile "SQLTEMPDBDIR=`"$env:choco:sqlserver2014:SQLTEMPDBDIR`""}
    if (Test-Path env:\choco:sqlserver2014:SQLTEMPDBLOGDIR){Add-Content $configFile "SQLTEMPDBLOGDIR=`"$env:choco:sqlserver2014:SQLTEMPDBLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2014:SQLUSERDBDIR){Add-Content $configFile "SQLUSERDBDIR=`"$env:choco:sqlserver2014:SQLUSERDBDIR`""}
    if (Test-Path env:\choco:sqlserver2014:SQLUSERDBLOGDIR){Add-Content $configFile "SQLUSERDBLOGDIR=`"$env:choco:sqlserver2014:SQLUSERDBLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2014:FILESTREAMLEVEL){Add-Content $configFile "FILESTREAMLEVEL=`"$env:choco:sqlserver2014:FILESTREAMLEVEL`""}
    if (Test-Path env:\choco:sqlserver2014:FILESTREAMSHARENAME){Add-Content $configFile "FILESTREAMSHARENAME=`"$env:choco:sqlserver2014:FILESTREAMSHARENAME`""}
    if (Test-Path env:\choco:sqlserver2014:FTSVCACCOUNT){Add-Content $configFile "FTSVCACCOUNT=`"$env:choco:sqlserver2014:FTSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2014:FTSVCPASSWORD){Add-Content $configFile "FTSVCPASSWORD=`"$env:choco:sqlserver2014:FTSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2014:ISSVCACCOUNT){Add-Content $configFile "ISSVCACCOUNT=`"$env:choco:sqlserver2014:ISSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2014:ISSVCPASSWORD){Add-Content $configFile "ISSVCPASSWORD=`"$env:choco:sqlserver2014:ISSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2014:ISSVCStartupType){Add-Content $configFile "ISSVCStartupType=`"$env:choco:sqlserver2014:ISSVCStartupType`""}
    if (Test-Path env:\choco:sqlserver2014:NPENABLED){Add-Content $configFile "NPENABLED=`"$env:choco:sqlserver2014:NPENABLED`""}
    if (Test-Path env:\choco:sqlserver2014:TCPENABLED){Add-Content $configFile "TCPENABLED=`"$env:choco:sqlserver2014:TCPENABLED`""}
    if (Test-Path env:\choco:sqlserver2014:RSINSTALLMODE){Add-Content $configFile "RSINSTALLMODE=`"$env:choco:sqlserver2014:RSINSTALLMODE`""}
    if (Test-Path env:\choco:sqlserver2014:RSSVCACCOUNT){Add-Content $configFile "RSSVCACCOUNT=`"$env:choco:sqlserver2014:RSSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2014:RSSVCPASSWORD){Add-Content $configFile "RSSVCPASSWORD=`"$env:choco:sqlserver2014:RSSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2014:RSSVCStartupType){Add-Content $configFile "RSSVCStartupType=`"$env:choco:sqlserver2014:RSSVCStartupType`""}

}


function DetermineSetupPath(){

    if (!(Test-Path env:\choco:sqlserver2014:setupFolder)){

        if (!(Test-Path env:\choco:sqlserver2014:isoImage))
        {
	        Write-Error "This package requires a path to SQL installation Media via environment variables. eg: 'SET choco:sqlserver2014:setupFolder=<Folder>' or 'SET choco:sqlserver2014:isoImage=<Filename>'. See readme.md on github."
            exit -1
        }

        $global:mustDismountIso = $true;
        $mountedIso = Mount-DiskImage -PassThru "$env:choco:sqlserver2014:isoImage"
        $isoDrive = Get-Volume -DiskImage $mountedIso | Select -expand DriveLetter
        Write-Host "Mounted ISO to $isoDrive"
        $env:choco:sqlserver2014:setupFolder = "$isoDrive`:\"
    }

    Write-Host "Path to setup.exe is $env:choco:sqlserver2014:setupFolder"
}


function Teardown(){

    if ($global:mustDismountIso){
        Write-Host "Dismounting ISO"
        Dismount-DiskImage -ImagePath $env:choco:sqlserver2014:isoImage
    }
    else
    {
        Write-Host "No ISO to dismount"
    }
}

function ExecuteSetup(){
    $setupExe = "$env:choco:sqlserver2014:setupFolder\setup.exe"
    Write-Host "Executing $setupExe with $configFile"

	Install-ChocolateyInstallPackage `
          -PackageName "sqlserver2014" `
          -FileType 'exe' `
          -SilentArgs "/IACCEPTSQLSERVERLICENSETERMS /ConfigurationFile=$configFile" `
          -File "$setupExe" `
}

$global:mustDismountIso = $false

DetermineSetupPath

BuildConfigurationFile

ExecuteSetup

Teardown
