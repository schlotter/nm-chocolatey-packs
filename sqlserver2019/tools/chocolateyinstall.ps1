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

    if (!(Test-Path env:\choco:sqlserver2019:ACTION)){$env:choco:sqlserver2019:ACTION="Install"}
    if (!(Test-Path env:\choco:sqlserver2019:SUPPRESSPRIVACYSTATEMENTNOTICE)){$env:choco:sqlserver2019:SUPPRESSPRIVACYSTATEMENTNOTICE="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2019:IACCEPTSQLSERVERLICENSETERMS)){$env:choco:sqlserver2019:IACCEPTSQLSERVERLICENSETERMS="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2019:IACCEPTPYTHONLICENSETERMS)){$env:choco:sqlserver2019:IACCEPTPYTHONLICENSETERMS="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2019:IACCEPTROPENLICENSETERMS)){$env:choco:sqlserver2019:IACCEPTROPENLICENSETERMS="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2019:ENU)){$env:choco:sqlserver2019:ENU="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2019:FEATURES)){$env:choco:sqlserver2019:FEATURES="SQLEngine"}
    if (!(Test-Path env:\choco:sqlserver2019:PID)){$env:choco:sqlserver2019:PID="22222-00000-00000-00000-00000"}
    if (!(Test-Path env:\choco:sqlserver2019:QUIET)){$env:choco:sqlserver2019:QUIET="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2019:INSTANCENAME)){$env:choco:sqlserver2019:INSTANCENAME="MSSQLSERVER"}
    

    if (Test-Path env:\choco:sqlserver2019:ACTION){Add-Content $configFile "ACTION=`"$env:choco:sqlserver2019:ACTION`""}
    if (Test-Path env:\choco:sqlserver2019:SUPPRESSPRIVACYSTATEMENTNOTICE){Add-Content $configFile "SUPPRESSPRIVACYSTATEMENTNOTICE=`"$env:choco:sqlserver2019:SUPPRESSPRIVACYSTATEMENTNOTICE`""}
    if (Test-Path env:\choco:sqlserver2019:IACCEPTSQLSERVERLICENSETERMS){Add-Content $configFile "IACCEPTSQLSERVERLICENSETERMS=`"$env:choco:sqlserver2019:IACCEPTSQLSERVERLICENSETERMS`""}
    if (Test-Path env:\choco:sqlserver2019:IACCEPTPYTHONLICENSETERMS){Add-Content $configFile "IACCEPTPYTHONLICENSETERMS=`"$env:choco:sqlserver2019:IACCEPTPYTHONLICENSETERMS`""}
    if (Test-Path env:\choco:sqlserver2019:IACCEPTROPENLICENSETERMS){Add-Content $configFile "IACCEPTROPENLICENSETERMS=`"$env:choco:sqlserver2019:IACCEPTROPENLICENSETERMS`""}
    if (Test-Path env:\choco:sqlserver2019:ENU){Add-Content $configFile "ENU=`"$env:choco:sqlserver2019:ENU`""}
    if (Test-Path env:\choco:sqlserver2019:UpdateEnabled){Add-Content $configFile "UpdateEnabled=`"$env:choco:sqlserver2019:UpdateEnabled`""}
    if (Test-Path env:\choco:sqlserver2019:UpdateSource){Add-Content $configFile "UpdateSource=`"$env:choco:sqlserver2019:UpdateSource`""}
    if (Test-Path env:\choco:sqlserver2019:CONFIGURATIONFILE){Add-Content $configFile "CONFIGURATIONFILE=`"$env:choco:sqlserver2019:CONFIGURATIONFILE`""}
    if (Test-Path env:\choco:sqlserver2019:ERRORREPORTING){Add-Content $configFile "ERRORREPORTING=`"$env:choco:sqlserver2019:ERRORREPORTING`""}
    if (Test-Path env:\choco:sqlserver2019:FEATURES){Add-Content $configFile "FEATURES=`"$env:choco:sqlserver2019:FEATURES`""}
    if (Test-Path env:\choco:sqlserver2019:HELP){Add-Content $configFile "HELP=`"$env:choco:sqlserver2019:HELP`""}
    if (Test-Path env:\choco:sqlserver2019:INDICATEPROGRESS){Add-Content $configFile "INDICATEPROGRESS=`"$env:choco:sqlserver2019:INDICATEPROGRESS`""}
    if (Test-Path env:\choco:sqlserver2019:INSTALLSHAREDDIR){Add-Content $configFile "INSTALLSHAREDDIR=`"$env:choco:sqlserver2019:INSTALLSHAREDDIR`""}
    if (Test-Path env:\choco:sqlserver2019:INSTALLSHAREDWOWDIR){Add-Content $configFile "INSTALLSHAREDWOWDIR=`"$env:choco:sqlserver2019:INSTALLSHAREDWOWDIR`""}
    if (Test-Path env:\choco:sqlserver2019:INSTANCEDIR){Add-Content $configFile "INSTANCEDIR=`"$env:choco:sqlserver2019:INSTANCEDIR`""}
    if (Test-Path env:\choco:sqlserver2019:INSTANCEID){Add-Content $configFile "INSTANCEID=`"$env:choco:sqlserver2019:INSTANCEID`""}
    if (Test-Path env:\choco:sqlserver2019:INSTANCENAME){Add-Content $configFile "INSTANCENAME=`"$env:choco:sqlserver2019:INSTANCENAME`""}
    if (Test-Path env:\choco:sqlserver2019:PBENGSVCACCOUNT){Add-Content $configFile "PBENGSVCACCOUNT=`"$env:choco:sqlserver2019:PBENGSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:PBDMSSVCPASSWORD){Add-Content $configFile "PBDMSSVCPASSWORD=`"$env:choco:sqlserver2019:PBDMSSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2019:PBENGSVCSTARTUPTYPE){Add-Content $configFile "PBENGSVCSTARTUPTYPE=`"$env:choco:sqlserver2019:PBENGSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2019:PBPORTRANGE){Add-Content $configFile "PBPORTRANGE=`"$env:choco:sqlserver2019:PBPORTRANGE`""}
    if (Test-Path env:\choco:sqlserver2019:PBSCALEOUT){Add-Content $configFile "PBSCALEOUT=`"$env:choco:sqlserver2019:PBSCALEOUT`""}
    if (Test-Path env:\choco:sqlserver2019:PID){Add-Content $configFile "PID=`"$env:choco:sqlserver2019:PID`""}
    if (Test-Path env:\choco:sqlserver2019:QUIET){Add-Content $configFile "Q or QUIET=`"$env:choco:sqlserver2019:QUIET`""}
    if (Test-Path env:\choco:sqlserver2019:QUIETSIMPLE){Add-Content $configFile "QS or QUIETSIMPLE=`"$env:choco:sqlserver2019:QUIETSIMPLE`""}
    if (Test-Path env:\choco:sqlserver2019:UIMODE){Add-Content $configFile "UIMODE=`"$env:choco:sqlserver2019:UIMODE`""}
    if (Test-Path env:\choco:sqlserver2019:SQMREPORTING){Add-Content $configFile "SQMREPORTING=`"$env:choco:sqlserver2019:SQMREPORTING`""}
    if (Test-Path env:\choco:sqlserver2019:HIDECONSOLE){Add-Content $configFile "HIDECONSOLE=`"$env:choco:sqlserver2019:HIDECONSOLE`""}
    if (Test-Path env:\choco:sqlserver2019:AGTSVCACCOUNT){Add-Content $configFile "AGTSVCACCOUNT=`"$env:choco:sqlserver2019:AGTSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:AGTSVCPASSWORD){Add-Content $configFile "AGTSVCPASSWORD=`"$env:choco:sqlserver2019:AGTSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2019:AGTSVCSTARTUPTYPE){Add-Content $configFile "AGTSVCSTARTUPTYPE=`"$env:choco:sqlserver2019:AGTSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2019:ASBACKUPDIR){Add-Content $configFile "ASBACKUPDIR=`"$env:choco:sqlserver2019:ASBACKUPDIR`""}
    if (Test-Path env:\choco:sqlserver2019:ASCOLLATION){Add-Content $configFile "ASCOLLATION=`"$env:choco:sqlserver2019:ASCOLLATION`""}
    if (Test-Path env:\choco:sqlserver2019:ASCONFIGDIR){Add-Content $configFile "ASCONFIGDIR=`"$env:choco:sqlserver2019:ASCONFIGDIR`""}
    if (Test-Path env:\choco:sqlserver2019:ASDATADIR){Add-Content $configFile "ASDATADIR=`"$env:choco:sqlserver2019:ASDATADIR`""}
    if (Test-Path env:\choco:sqlserver2019:ASLOGDIR){Add-Content $configFile "ASLOGDIR=`"$env:choco:sqlserver2019:ASLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2019:ASSERVERMODE){Add-Content $configFile "ASSERVERMODE=`"$env:choco:sqlserver2019:ASSERVERMODE`""}
    if (Test-Path env:\choco:sqlserver2019:ASSVCACCOUNT){Add-Content $configFile "ASSVCACCOUNT=`"$env:choco:sqlserver2019:ASSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:ASSVCPASSWORD){Add-Content $configFile "ASSVCPASSWORD=`"$env:choco:sqlserver2019:ASSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2019:ASSVCSTARTUPTYPE){Add-Content $configFile "ASSVCSTARTUPTYPE=`"$env:choco:sqlserver2019:ASSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2019:ASSYSADMINACCOUNTS){Add-Content $configFile "ASSYSADMINACCOUNTS=`"$env:choco:sqlserver2019:ASSYSADMINACCOUNTS`""}
    if (Test-Path env:\choco:sqlserver2019:ASTEMPDIR){Add-Content $configFile "ASTEMPDIR=`"$env:choco:sqlserver2019:ASTEMPDIR`""}
    if (Test-Path env:\choco:sqlserver2019:ASPROVIDERMSOLAP){Add-Content $configFile "ASPROVIDERMSOLAP=`"$env:choco:sqlserver2019:ASPROVIDERMSOLAP`""}
    if (Test-Path env:\choco:sqlserver2019:FARMACCOUNT){Add-Content $configFile "FARMACCOUNT=`"$env:choco:sqlserver2019:FARMACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:FARMPASSWORD){Add-Content $configFile "FARMPASSWORD=`"$env:choco:sqlserver2019:FARMPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2019:PASSPHRASE){Add-Content $configFile "PASSPHRASE=`"$env:choco:sqlserver2019:PASSPHRASE`""}
    if (Test-Path env:\choco:sqlserver2019:FARMADMINIPORT){Add-Content $configFile "FARMADMINIPORT=`"$env:choco:sqlserver2019:FARMADMINIPORT`""}
    if (Test-Path env:\choco:sqlserver2019:BROWSERSVCSTARTUPTYPE){Add-Content $configFile "BROWSERSVCSTARTUPTYPE=`"$env:choco:sqlserver2019:BROWSERSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2019:ENABLERANU){Add-Content $configFile "ENABLERANU=`"$env:choco:sqlserver2019:ENABLERANU`""}
    if (Test-Path env:\choco:sqlserver2019:INSTALLSQLDATADIR){Add-Content $configFile "INSTALLSQLDATADIR=`"$env:choco:sqlserver2019:INSTALLSQLDATADIR`""}
    if (Test-Path env:\choco:sqlserver2019:SAPWD){Add-Content $configFile "SAPWD=`"$env:choco:sqlserver2019:SAPWD`""}
    if (Test-Path env:\choco:sqlserver2019:SECURITYMODE){Add-Content $configFile "SECURITYMODE=`"$env:choco:sqlserver2019:SECURITYMODE`""}
    if (Test-Path env:\choco:sqlserver2019:SQLBACKUPDIR){Add-Content $configFile "SQLBACKUPDIR=`"$env:choco:sqlserver2019:SQLBACKUPDIR`""}
    if (Test-Path env:\choco:sqlserver2019:SQLCOLLATION){Add-Content $configFile "SQLCOLLATION=`"$env:choco:sqlserver2019:SQLCOLLATION`""}
    if (Test-Path env:\choco:sqlserver2019:ADDCURRENTUSERASSQLADMIN){Add-Content $configFile "ADDCURRENTUSERASSQLADMIN=`"$env:choco:sqlserver2019:ADDCURRENTUSERASSQLADMIN`""}
    if (Test-Path env:\choco:sqlserver2019:SQLSVCACCOUNT){Add-Content $configFile "SQLSVCACCOUNT=`"$env:choco:sqlserver2019:SQLSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:SQLSVCPASSWORD){Add-Content $configFile "SQLSVCPASSWORD=`"$env:choco:sqlserver2019:SQLSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2019:SQLSVCSTARTUPTYPE){Add-Content $configFile "SQLSVCSTARTUPTYPE=`"$env:choco:sqlserver2019:SQLSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2019:SQLSYSADMINACCOUNTS){Add-Content $configFile "SQLSYSADMINACCOUNTS=`"$env:choco:sqlserver2019:SQLSYSADMINACCOUNTS`""}
    if (Test-Path env:\choco:sqlserver2019:SQLTEMPDBDIR){Add-Content $configFile "SQLTEMPDBDIR=`"$env:choco:sqlserver2019:SQLTEMPDBDIR`""}
    if (Test-Path env:\choco:sqlserver2019:SQLTEMPDBLOGDIR){Add-Content $configFile "SQLTEMPDBLOGDIR=`"$env:choco:sqlserver2019:SQLTEMPDBLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2019:SQLTEMPDBFILECOUNT){Add-Content $configFile "SQLTEMPDBFILECOUNT=`"$env:choco:sqlserver2019:SQLTEMPDBFILECOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:SQLTEMPDBFILESIZE){Add-Content $configFile "SQLTEMPDBFILESIZE=`"$env:choco:sqlserver2019:SQLTEMPDBFILESIZE`""}
    if (Test-Path env:\choco:sqlserver2019:SQLTEMPDBFILEGROWTH){Add-Content $configFile "SQLTEMPDBFILEGROWTH=`"$env:choco:sqlserver2019:SQLTEMPDBFILEGROWTH`""}
    if (Test-Path env:\choco:sqlserver2019:SQLTEMPDBLOGFILESIZE){Add-Content $configFile "SQLTEMPDBLOGFILESIZE=`"$env:choco:sqlserver2019:SQLTEMPDBLOGFILESIZE`""}
    if (Test-Path env:\choco:sqlserver2019:SQLTEMPDBLOGFILEGROWTH){Add-Content $configFile "SQLTEMPDBLOGFILEGROWTH=`"$env:choco:sqlserver2019:SQLTEMPDBLOGFILEGROWTH`""}
    if (Test-Path env:\choco:sqlserver2019:SQLUSERDBDIR){Add-Content $configFile "SQLUSERDBDIR=`"$env:choco:sqlserver2019:SQLUSERDBDIR`""}
    if (Test-Path env:\choco:sqlserver2019:SQLSVCINSTANTFILEINIT){Add-Content $configFile "SQLSVCINSTANTFILEINIT=`"$env:choco:sqlserver2019:SQLSVCINSTANTFILEINIT`""}
    if (Test-Path env:\choco:sqlserver2019:SQLUSERDBLOGDIR){Add-Content $configFile "SQLUSERDBLOGDIR=`"$env:choco:sqlserver2019:SQLUSERDBLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2019:SQLMAXDOP){Add-Content $configFile "SQLMAXDOP=`"$env:choco:sqlserver2019:SQLMAXDOP`""}
    if (Test-Path env:\choco:sqlserver2019:USESQLRECOMMENDEDMEMORYLIMITS){Add-Content $configFile "USESQLRECOMMENDEDMEMORYLIMITS=`"$env:choco:sqlserver2019:USESQLRECOMMENDEDMEMORYLIMITS`""}
    if (Test-Path env:\choco:sqlserver2019:SQLMINMEMORY){Add-Content $configFile "SQLMINMEMORY=`"$env:choco:sqlserver2019:SQLMINMEMORY`""}
    if (Test-Path env:\choco:sqlserver2019:SQLMAXMEMORY){Add-Content $configFile "SQLMAXMEMORY=`"$env:choco:sqlserver2019:SQLMAXMEMORY`""}
    if (Test-Path env:\choco:sqlserver2019:FILESTREAMLEVEL){Add-Content $configFile "FILESTREAMLEVEL=`"$env:choco:sqlserver2019:FILESTREAMLEVEL`""}
    if (Test-Path env:\choco:sqlserver2019:FILESTREAMSHARENAME){Add-Content $configFile "FILESTREAMSHARENAME=`"$env:choco:sqlserver2019:FILESTREAMSHARENAME`""}
    if (Test-Path env:\choco:sqlserver2019:FTSVCACCOUNT){Add-Content $configFile "FTSVCACCOUNT=`"$env:choco:sqlserver2019:FTSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:FTSVCPASSWORD){Add-Content $configFile "FTSVCPASSWORD=`"$env:choco:sqlserver2019:FTSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2019:ISSVCACCOUNT){Add-Content $configFile "ISSVCACCOUNT=`"$env:choco:sqlserver2019:ISSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:ISSVCPASSWORD){Add-Content $configFile "ISSVCPASSWORD=`"$env:choco:sqlserver2019:ISSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2019:ISSVCStartupType){Add-Content $configFile "ISSVCStartupType=`"$env:choco:sqlserver2019:ISSVCStartupType`""}
    if (Test-Path env:\choco:sqlserver2019:NPENABLED){Add-Content $configFile "NPENABLED=`"$env:choco:sqlserver2019:NPENABLED`""}
    if (Test-Path env:\choco:sqlserver2019:TCPENABLED){Add-Content $configFile "TCPENABLED=`"$env:choco:sqlserver2019:TCPENABLED`""}
    if (Test-Path env:\choco:sqlserver2019:RSINSTALLMODE){Add-Content $configFile "RSINSTALLMODE=`"$env:choco:sqlserver2019:RSINSTALLMODE`""}
    if (Test-Path env:\choco:sqlserver2019:RSSVCACCOUNT){Add-Content $configFile "RSSVCACCOUNT=`"$env:choco:sqlserver2019:RSSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2019:RSSVCPASSWORD){Add-Content $configFile "RSSVCPASSWORD=`"$env:choco:sqlserver2019:RSSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2019:RSSVCStartupType){Add-Content $configFile "RSSVCStartupType=`"$env:choco:sqlserver2019:RSSVCStartupType`""}
    if (Test-Path env:\choco:sqlserver2019:MPYCACHEDIRECTORY){Add-Content $configFile "MPYCACHEDIRECTORY=`"$env:choco:sqlserver2019:MPYCACHEDIRECTORY`""}
    if (Test-Path env:\choco:sqlserver2019:MRCACHEDIRECTORY){Add-Content $configFile "MRCACHEDIRECTORY=`"$env:choco:sqlserver2019:MRCACHEDIRECTORY`""}
    if (Test-Path env:\choco:sqlserver2019:SQL_INST_JAVA){Add-Content $configFile "SQL_INST_JAVA=`"$env:choco:sqlserver2019:SQL_INST_JAVA`""}
    
    
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
