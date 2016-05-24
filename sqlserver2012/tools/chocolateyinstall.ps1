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
    ## Below generated from https://github.com/neutmute/nm-chocolatey-packs/raw/master/sqlserver2012/docs/sql2012_ParamGenerator.xlsx
	##
	
    # If user didn't supply some basic requirements, set them
	if (!(Test-Path env:\choco:sqlserver2012:ACTION)){$env:choco:sqlserver2012:ACTION="Install"}
	if (!(Test-Path env:\choco:sqlserver2012:FEATURES)){$env:choco:sqlserver2012:FEATURES="SQLENGINE"}
	if (!(Test-Path env:\choco:sqlserver2012:IACCEPTSQLSERVERLICENSETERMS)){$env:choco:sqlserver2012:IACCEPTSQLSERVERLICENSETERMS="TRUE"}
	if (!(Test-Path env:\choco:sqlserver2012:Q)){$env:choco:sqlserver2012:Q="TRUE"}
	if (!(Test-Path env:\choco:sqlserver2012:SQLSVCACCOUNT)){$env:choco:sqlserver2012:SQLSVCACCOUNT="NT Service\MSSQLSERVER"}
	if (!(Test-Path env:\choco:sqlserver2012:SQLSYSADMINACCOUNTS)){$env:choco:sqlserver2012:SQLSYSADMINACCOUNTS="$thisUser"}  
    
	# Write config to file
    if (Test-Path env:\choco:sqlserver2012:ACTION){Add-Content $configFile "ACTION=`"$env:choco:sqlserver2012:ACTION`""}
	if (Test-Path env:\choco:sqlserver2012:IACCEPTSQLSERVERLICENSETERMS){Add-Content $configFile "IACCEPTSQLSERVERLICENSETERMS=`"$env:choco:sqlserver2012:IACCEPTSQLSERVERLICENSETERMS`""}
	if (Test-Path env:\choco:sqlserver2012:ENU){Add-Content $configFile "ENU=`"$env:choco:sqlserver2012:ENU`""}
	if (Test-Path env:\choco:sqlserver2012:UpdateEnabled){Add-Content $configFile "UpdateEnabled=`"$env:choco:sqlserver2012:UpdateEnabled`""}
	if (Test-Path env:\choco:sqlserver2012:UpdateSource){Add-Content $configFile "UpdateSource=`"$env:choco:sqlserver2012:UpdateSource`""}
	if (Test-Path env:\choco:sqlserver2012:CONFIGURATIONFILE){Add-Content $configFile "CONFIGURATIONFILE=`"$env:choco:sqlserver2012:CONFIGURATIONFILE`""}
	if (Test-Path env:\choco:sqlserver2012:ERRORREPORTING){Add-Content $configFile "ERRORREPORTING=`"$env:choco:sqlserver2012:ERRORREPORTING`""}
	if (Test-Path env:\choco:sqlserver2012:FEATURES){Add-Content $configFile "FEATURES=`"$env:choco:sqlserver2012:FEATURES`""}
	if (Test-Path env:\choco:sqlserver2012:HELP){Add-Content $configFile "HELP=`"$env:choco:sqlserver2012:HELP`""}
	if (Test-Path env:\choco:sqlserver2012:INDICATEPROGRESS){Add-Content $configFile "INDICATEPROGRESS=`"$env:choco:sqlserver2012:INDICATEPROGRESS`""}
	if (Test-Path env:\choco:sqlserver2012:INSTALLSHAREDDIR){Add-Content $configFile "INSTALLSHAREDDIR=`"$env:choco:sqlserver2012:INSTALLSHAREDDIR`""}
	if (Test-Path env:\choco:sqlserver2012:INSTALLSHAREDWOWDIR){Add-Content $configFile "INSTALLSHAREDWOWDIR=`"$env:choco:sqlserver2012:INSTALLSHAREDWOWDIR`""}
	if (Test-Path env:\choco:sqlserver2012:INSTANCEDIR){Add-Content $configFile "INSTANCEDIR=`"$env:choco:sqlserver2012:INSTANCEDIR`""}
	if (Test-Path env:\choco:sqlserver2012:INSTANCEID){Add-Content $configFile "INSTANCEID=`"$env:choco:sqlserver2012:INSTANCEID`""}
	if (Test-Path env:\choco:sqlserver2012:INSTANCENAME){Add-Content $configFile "INSTANCENAME=`"$env:choco:sqlserver2012:INSTANCENAME`""}
	if (Test-Path env:\choco:sqlserver2012:PID){Add-Content $configFile "PID=`"$env:choco:sqlserver2012:PID`""}
	if (Test-Path env:\choco:sqlserver2012:Q){Add-Content $configFile "Q=`"$env:choco:sqlserver2012:Q`""}
	if (Test-Path env:\choco:sqlserver2012:QS){Add-Content $configFile "QS=`"$env:choco:sqlserver2012:QS`""}
	if (Test-Path env:\choco:sqlserver2012:UIMODE){Add-Content $configFile "UIMODE=`"$env:choco:sqlserver2012:UIMODE`""}
	if (Test-Path env:\choco:sqlserver2012:SQMREPORTING){Add-Content $configFile "SQMREPORTING=`"$env:choco:sqlserver2012:SQMREPORTING`""}
	if (Test-Path env:\choco:sqlserver2012:HIDECONSOLE){Add-Content $configFile "HIDECONSOLE=`"$env:choco:sqlserver2012:HIDECONSOLE`""}
	if (Test-Path env:\choco:sqlserver2012:AGTSVCACCOUNT){Add-Content $configFile "AGTSVCACCOUNT=`"$env:choco:sqlserver2012:AGTSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2012:AGTSVCPASSWORD){Add-Content $configFile "AGTSVCPASSWORD=`"$env:choco:sqlserver2012:AGTSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2012:AGTSVCSTARTUPTYPE){Add-Content $configFile "AGTSVCSTARTUPTYPE=`"$env:choco:sqlserver2012:AGTSVCSTARTUPTYPE`""}
	if (Test-Path env:\choco:sqlserver2012:ASBACKUPDIR){Add-Content $configFile "ASBACKUPDIR=`"$env:choco:sqlserver2012:ASBACKUPDIR`""}
	if (Test-Path env:\choco:sqlserver2012:ASCOLLATION){Add-Content $configFile "ASCOLLATION=`"$env:choco:sqlserver2012:ASCOLLATION`""}
	if (Test-Path env:\choco:sqlserver2012:ASCONFIGDIR){Add-Content $configFile "ASCONFIGDIR=`"$env:choco:sqlserver2012:ASCONFIGDIR`""}
	if (Test-Path env:\choco:sqlserver2012:ASDATADIR){Add-Content $configFile "ASDATADIR=`"$env:choco:sqlserver2012:ASDATADIR`""}
	if (Test-Path env:\choco:sqlserver2012:ASLOGDIR){Add-Content $configFile "ASLOGDIR=`"$env:choco:sqlserver2012:ASLOGDIR`""}
	if (Test-Path env:\choco:sqlserver2012:ASSERVERMODE){Add-Content $configFile "ASSERVERMODE=`"$env:choco:sqlserver2012:ASSERVERMODE`""}
	if (Test-Path env:\choco:sqlserver2012:ASSVCACCOUNT){Add-Content $configFile "ASSVCACCOUNT=`"$env:choco:sqlserver2012:ASSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2012:ASSVCPASSWORD){Add-Content $configFile "ASSVCPASSWORD=`"$env:choco:sqlserver2012:ASSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2012:ASSVCSTARTUPTYPE){Add-Content $configFile "ASSVCSTARTUPTYPE=`"$env:choco:sqlserver2012:ASSVCSTARTUPTYPE`""}
	if (Test-Path env:\choco:sqlserver2012:ASSYSADMINACCOUNTS){Add-Content $configFile "ASSYSADMINACCOUNTS=`"$env:choco:sqlserver2012:ASSYSADMINACCOUNTS`""}
	if (Test-Path env:\choco:sqlserver2012:ASTEMPDIR){Add-Content $configFile "ASTEMPDIR=`"$env:choco:sqlserver2012:ASTEMPDIR`""}
	if (Test-Path env:\choco:sqlserver2012:ASPROVIDERMSOLAP){Add-Content $configFile "ASPROVIDERMSOLAP=`"$env:choco:sqlserver2012:ASPROVIDERMSOLAP`""}
	if (Test-Path env:\choco:sqlserver2012:FARMACCOUNT){Add-Content $configFile "FARMACCOUNT=`"$env:choco:sqlserver2012:FARMACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2012:FARMPASSWORD){Add-Content $configFile "FARMPASSWORD=`"$env:choco:sqlserver2012:FARMPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2012:PASSPHRASE){Add-Content $configFile "PASSPHRASE=`"$env:choco:sqlserver2012:PASSPHRASE`""}
	if (Test-Path env:\choco:sqlserver2012:FARMADMINIPORT){Add-Content $configFile "FARMADMINIPORT=`"$env:choco:sqlserver2012:FARMADMINIPORT`""}
	if (Test-Path env:\choco:sqlserver2012:BROWSERSVCSTARTUPTYPE){Add-Content $configFile "BROWSERSVCSTARTUPTYPE=`"$env:choco:sqlserver2012:BROWSERSVCSTARTUPTYPE`""}
	if (Test-Path env:\choco:sqlserver2012:ENABLERANU){Add-Content $configFile "ENABLERANU=`"$env:choco:sqlserver2012:ENABLERANU`""}
	if (Test-Path env:\choco:sqlserver2012:INSTALLSQLDATADIR){Add-Content $configFile "INSTALLSQLDATADIR=`"$env:choco:sqlserver2012:INSTALLSQLDATADIR`""}
	if (Test-Path env:\choco:sqlserver2012:SAPWD){Add-Content $configFile "SAPWD=`"$env:choco:sqlserver2012:SAPWD`""}
	if (Test-Path env:\choco:sqlserver2012:SECURITYMODE){Add-Content $configFile "SECURITYMODE=`"$env:choco:sqlserver2012:SECURITYMODE`""}
	if (Test-Path env:\choco:sqlserver2012:SQLBACKUPDIR){Add-Content $configFile "SQLBACKUPDIR=`"$env:choco:sqlserver2012:SQLBACKUPDIR`""}
	if (Test-Path env:\choco:sqlserver2012:SQLCOLLATION){Add-Content $configFile "SQLCOLLATION=`"$env:choco:sqlserver2012:SQLCOLLATION`""}
	if (Test-Path env:\choco:sqlserver2012:ADDCURRENTUSERASSQLADMIN){Add-Content $configFile "ADDCURRENTUSERASSQLADMIN=`"$env:choco:sqlserver2012:ADDCURRENTUSERASSQLADMIN`""}
	if (Test-Path env:\choco:sqlserver2012:SQLSVCACCOUNT){Add-Content $configFile "SQLSVCACCOUNT=`"$env:choco:sqlserver2012:SQLSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2012:SQLSVCPASSWORD){Add-Content $configFile "SQLSVCPASSWORD=`"$env:choco:sqlserver2012:SQLSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2012:SQLSVCSTARTUPTYPE){Add-Content $configFile "SQLSVCSTARTUPTYPE=`"$env:choco:sqlserver2012:SQLSVCSTARTUPTYPE`""}
	if (Test-Path env:\choco:sqlserver2012:SQLSYSADMINACCOUNTS){Add-Content $configFile "SQLSYSADMINACCOUNTS=`"$env:choco:sqlserver2012:SQLSYSADMINACCOUNTS`""}
	if (Test-Path env:\choco:sqlserver2012:SQLTEMPDBDIR){Add-Content $configFile "SQLTEMPDBDIR=`"$env:choco:sqlserver2012:SQLTEMPDBDIR`""}
	if (Test-Path env:\choco:sqlserver2012:SQLTEMPDBLOGDIR){Add-Content $configFile "SQLTEMPDBLOGDIR=`"$env:choco:sqlserver2012:SQLTEMPDBLOGDIR`""}
	if (Test-Path env:\choco:sqlserver2012:SQLUSERDBDIR){Add-Content $configFile "SQLUSERDBDIR=`"$env:choco:sqlserver2012:SQLUSERDBDIR`""}
	if (Test-Path env:\choco:sqlserver2012:SQLUSERDBLOGDIR){Add-Content $configFile "SQLUSERDBLOGDIR=`"$env:choco:sqlserver2012:SQLUSERDBLOGDIR`""}
	if (Test-Path env:\choco:sqlserver2012:FILESTREAMLEVEL){Add-Content $configFile "FILESTREAMLEVEL=`"$env:choco:sqlserver2012:FILESTREAMLEVEL`""}
	if (Test-Path env:\choco:sqlserver2012:FILESTREAMSHARENAME){Add-Content $configFile "FILESTREAMSHARENAME=`"$env:choco:sqlserver2012:FILESTREAMSHARENAME`""}
	if (Test-Path env:\choco:sqlserver2012:FTSVCACCOUNT){Add-Content $configFile "FTSVCACCOUNT=`"$env:choco:sqlserver2012:FTSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2012:FTSVCPASSWORD){Add-Content $configFile "FTSVCPASSWORD=`"$env:choco:sqlserver2012:FTSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2012:ISSVCACCOUNT){Add-Content $configFile "ISSVCACCOUNT=`"$env:choco:sqlserver2012:ISSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2012:ISSVCPASSWORD){Add-Content $configFile "ISSVCPASSWORD=`"$env:choco:sqlserver2012:ISSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2012:ISSVCStartupType){Add-Content $configFile "ISSVCStartupType=`"$env:choco:sqlserver2012:ISSVCStartupType`""}
	if (Test-Path env:\choco:sqlserver2012:NPENABLED){Add-Content $configFile "NPENABLED=`"$env:choco:sqlserver2012:NPENABLED`""}
	if (Test-Path env:\choco:sqlserver2012:TCPENABLED){Add-Content $configFile "TCPENABLED=`"$env:choco:sqlserver2012:TCPENABLED`""}
	if (Test-Path env:\choco:sqlserver2012:RSINSTALLMODE){Add-Content $configFile "RSINSTALLMODE=`"$env:choco:sqlserver2012:RSINSTALLMODE`""}
	if (Test-Path env:\choco:sqlserver2012:RSSVCACCOUNT){Add-Content $configFile "RSSVCACCOUNT=`"$env:choco:sqlserver2012:RSSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2012:RSSVCPASSWORD){Add-Content $configFile "RSSVCPASSWORD=`"$env:choco:sqlserver2012:RSSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2012:RSSVCStartupType){Add-Content $configFile "RSSVCStartupType=`"$env:choco:sqlserver2012:RSSVCStartupType`""}


}


function DetermineSetupPath(){

    if (!(Test-Path env:\choco:sqlserver2012:setupFolder)){

        if (!(Test-Path env:\choco:sqlserver2012:isoImage)) 
        {
	        Write-Error "This package requires a path to SQL installation Media via environment variables. eg: 'SET choco:sqlserver2012:setupFolder=<Folder>' or 'SET choco:sqlserver2012:isoImage=<Filename>'. See readme.md on github."
            exit -1
        }
        
        $global:mustDismountIso = $true;
        $mountedIso = Mount-DiskImage -PassThru "$env:choco:sqlserver2012:isoImage"
        $isoDrive = Get-Volume -DiskImage $mountedIso | Select -expand DriveLetter
        Write-Host "Mounted ISO to $isoDrive"
        $env:choco:sqlserver2012:setupFolder = "$isoDrive`:\"
    }

    Write-Host "Path to setup.exe is $env:choco:sqlserver2012:setupFolder"
}


function Teardown(){
    
    if ($global:mustDismountIso){
        Write-Host "Dismounting ISO"
        Dismount-DiskImage -ImagePath $env:choco:sqlserver2012:isoImage
    }
    else
    {
        Write-Host "No ISO to dismount"
    }
        
    $sqlSetupErrorlevel = $LASTEXITCODE
    Write-Host "setup error level=$sqlSetupErrorlevel"
    Write-Host $output

    if ($sqlSetupErrorlevel -ne 0)
    {
	    Write-Error "SQL setup.exe exited with errorlevel '$sqlSetupErrorlevel'"
    }

    exit $sqlSetupErrorlevel
}

function ExecuteSetup(){
    $setupExe = "$env:choco:sqlserver2012:setupFolder\setup.exe"
    Write-Host "Executing $setupExe with $configFile"
    & $setupExe "/ConfigurationFile=$configFile"  
}

$global:mustDismountIso = $false

DetermineSetupPath

BuildConfigurationFile

ExecuteSetup

Teardown

