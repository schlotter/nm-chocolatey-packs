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
    ## Below generated from https://github.com/neutmute/nm-chocolatey-packs/raw/master/sqlserver2016/docs/sql2016_ParamGenerator.xlsx
	##
	
    # If user didn't supply some basic requirements, set them
    if (!(Test-Path env:\choco:sqlserver2016:ACTION)){$env:choco:sqlserver2016:ACTION="Install"}
    if (!(Test-Path env:\choco:sqlserver2016:IACCEPTSQLSERVERLICENSETERMS)){$env:choco:sqlserver2016:IACCEPTSQLSERVERLICENSETERMS="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2016:FEATURES)){$env:choco:sqlserver2016:FEATURES="SQLENGINE"}
    if (!(Test-Path env:\choco:sqlserver2016:INSTANCENAME)){$env:choco:sqlserver2016:INSTANCENAME="MSSQLSERVER"}
    if (!(Test-Path env:\choco:sqlserver2016:Q)){$env:choco:sqlserver2016:Q="TRUE"}
    if (!(Test-Path env:\choco:sqlserver2016:SQLSVCACCOUNT)){$env:choco:sqlserver2016:SQLSVCACCOUNT="NT Service\MSSQLSERVER"}
    if (!(Test-Path env:\choco:sqlserver2016:SQLSYSADMINACCOUNTS)){$env:choco:sqlserver2016:SQLSYSADMINACCOUNTS="$thisUser"}
    if (!(Test-Path env:\choco:sqlserver2016:SUPPRESSPRIVACYSTATEMENTNOTICE)){$env:choco:sqlserver2016:SUPPRESSPRIVACYSTATEMENTNOTICE="TRUE"}
	if (!(Test-Path env:\choco:sqlserver2016:PID)){$env:choco:sqlserver2016:PID="22222-00000-00000-00000-00000"} # developer edition https://connect.microsoft.com/SQLServer/feedback/details/2576662/sql-server-2016-specify-developer-edition-from-command-line-parameter-or-configuration-file-install

    # Write config to file
    if (Test-Path env:\choco:sqlserver2016:SUPPRESSPRIVACYSTATEMENTNOTICE){Add-Content $configFile "SUPPRESSPRIVACYSTATEMENTNOTICE=`"$env:choco:sqlserver2016:SUPPRESSPRIVACYSTATEMENTNOTICE`""}
    if (Test-Path env:\choco:sqlserver2016:ACTION){Add-Content $configFile "ACTION=`"$env:choco:sqlserver2016:ACTION`""}
    if (Test-Path env:\choco:sqlserver2016:IACCEPTSQLSERVERLICENSETERMS){Add-Content $configFile "IACCEPTSQLSERVERLICENSETERMS=`"$env:choco:sqlserver2016:IACCEPTSQLSERVERLICENSETERMS`""}
    if (Test-Path env:\choco:sqlserver2016:ENU){Add-Content $configFile "ENU=`"$env:choco:sqlserver2016:ENU`""}
    if (Test-Path env:\choco:sqlserver2016:UpdateEnabled){Add-Content $configFile "UpdateEnabled=`"$env:choco:sqlserver2016:UpdateEnabled`""}
    if (Test-Path env:\choco:sqlserver2016:UpdateSource){Add-Content $configFile "UpdateSource=`"$env:choco:sqlserver2016:UpdateSource`""}
    if (Test-Path env:\choco:sqlserver2016:CONFIGURATIONFILE){Add-Content $configFile "CONFIGURATIONFILE=`"$env:choco:sqlserver2016:CONFIGURATIONFILE`""}
    if (Test-Path env:\choco:sqlserver2016:ERRORREPORTING){Add-Content $configFile "ERRORREPORTING=`"$env:choco:sqlserver2016:ERRORREPORTING`""}
    if (Test-Path env:\choco:sqlserver2016:FEATURES){Add-Content $configFile "FEATURES=`"$env:choco:sqlserver2016:FEATURES`""}
    if (Test-Path env:\choco:sqlserver2016:HELP){Add-Content $configFile "HELP=`"$env:choco:sqlserver2016:HELP`""}
    if (Test-Path env:\choco:sqlserver2016:INDICATEPROGRESS){Add-Content $configFile "INDICATEPROGRESS=`"$env:choco:sqlserver2016:INDICATEPROGRESS`""}
    if (Test-Path env:\choco:sqlserver2016:INSTALLSHAREDDIR){Add-Content $configFile "INSTALLSHAREDDIR=`"$env:choco:sqlserver2016:INSTALLSHAREDDIR`""}
    if (Test-Path env:\choco:sqlserver2016:INSTALLSHAREDWOWDIR){Add-Content $configFile "INSTALLSHAREDWOWDIR=`"$env:choco:sqlserver2016:INSTALLSHAREDWOWDIR`""}
    if (Test-Path env:\choco:sqlserver2016:INSTANCEDIR){Add-Content $configFile "INSTANCEDIR=`"$env:choco:sqlserver2016:INSTANCEDIR`""}
    if (Test-Path env:\choco:sqlserver2016:INSTANCEID){Add-Content $configFile "INSTANCEID=`"$env:choco:sqlserver2016:INSTANCEID`""}
    if (Test-Path env:\choco:sqlserver2016:INSTANCENAME){Add-Content $configFile "INSTANCENAME=`"$env:choco:sqlserver2016:INSTANCENAME`""}
    if (Test-Path env:\choco:sqlserver2016:PBENGSVCACCOUNT){Add-Content $configFile "PBENGSVCACCOUNT=`"$env:choco:sqlserver2016:PBENGSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:PBDMSSVCPASSWORD){Add-Content $configFile "PBDMSSVCPASSWORD=`"$env:choco:sqlserver2016:PBDMSSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2016:PBENGSVCSTARTUPTYPE){Add-Content $configFile "PBENGSVCSTARTUPTYPE=`"$env:choco:sqlserver2016:PBENGSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2016:PBPORTRANGE){Add-Content $configFile "PBPORTRANGE=`"$env:choco:sqlserver2016:PBPORTRANGE`""}
    if (Test-Path env:\choco:sqlserver2016:PBSCALEOUT){Add-Content $configFile "PBSCALEOUT=`"$env:choco:sqlserver2016:PBSCALEOUT`""}
    if (Test-Path env:\choco:sqlserver2016:PID){Add-Content $configFile "PID=`"$env:choco:sqlserver2016:PID`""}
    if (Test-Path env:\choco:sqlserver2016:Q){Add-Content $configFile "Q=`"$env:choco:sqlserver2016:Q`""}
    if (Test-Path env:\choco:sqlserver2016:QS){Add-Content $configFile "QS=`"$env:choco:sqlserver2016:QS`""}
    if (Test-Path env:\choco:sqlserver2016:UIMODE){Add-Content $configFile "UIMODE=`"$env:choco:sqlserver2016:UIMODE`""}
    if (Test-Path env:\choco:sqlserver2016:SQMREPORTING){Add-Content $configFile "SQMREPORTING=`"$env:choco:sqlserver2016:SQMREPORTING`""}
    if (Test-Path env:\choco:sqlserver2016:HIDECONSOLE){Add-Content $configFile "HIDECONSOLE=`"$env:choco:sqlserver2016:HIDECONSOLE`""}
    if (Test-Path env:\choco:sqlserver2016:AGTSVCACCOUNT){Add-Content $configFile "AGTSVCACCOUNT=`"$env:choco:sqlserver2016:AGTSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:AGTSVCPASSWORD){Add-Content $configFile "AGTSVCPASSWORD=`"$env:choco:sqlserver2016:AGTSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2016:AGTSVCSTARTUPTYPE){Add-Content $configFile "AGTSVCSTARTUPTYPE=`"$env:choco:sqlserver2016:AGTSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2016:ASBACKUPDIR){Add-Content $configFile "ASBACKUPDIR=`"$env:choco:sqlserver2016:ASBACKUPDIR`""}
    if (Test-Path env:\choco:sqlserver2016:ASCOLLATION){Add-Content $configFile "ASCOLLATION=`"$env:choco:sqlserver2016:ASCOLLATION`""}
    if (Test-Path env:\choco:sqlserver2016:ASCONFIGDIR){Add-Content $configFile "ASCONFIGDIR=`"$env:choco:sqlserver2016:ASCONFIGDIR`""}
    if (Test-Path env:\choco:sqlserver2016:ASDATADIR){Add-Content $configFile "ASDATADIR=`"$env:choco:sqlserver2016:ASDATADIR`""}
    if (Test-Path env:\choco:sqlserver2016:ASLOGDIR){Add-Content $configFile "ASLOGDIR=`"$env:choco:sqlserver2016:ASLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2016:ASSERVERMODE){Add-Content $configFile "ASSERVERMODE=`"$env:choco:sqlserver2016:ASSERVERMODE`""}
    if (Test-Path env:\choco:sqlserver2016:ASSVCACCOUNT){Add-Content $configFile "ASSVCACCOUNT=`"$env:choco:sqlserver2016:ASSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:ASSVCPASSWORD){Add-Content $configFile "ASSVCPASSWORD=`"$env:choco:sqlserver2016:ASSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2016:ASSVCSTARTUPTYPE){Add-Content $configFile "ASSVCSTARTUPTYPE=`"$env:choco:sqlserver2016:ASSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2016:ASSYSADMINACCOUNTS){Add-Content $configFile "ASSYSADMINACCOUNTS=`"$env:choco:sqlserver2016:ASSYSADMINACCOUNTS`""}
    if (Test-Path env:\choco:sqlserver2016:ASTEMPDIR){Add-Content $configFile "ASTEMPDIR=`"$env:choco:sqlserver2016:ASTEMPDIR`""}
    if (Test-Path env:\choco:sqlserver2016:ASPROVIDERMSOLAP){Add-Content $configFile "ASPROVIDERMSOLAP=`"$env:choco:sqlserver2016:ASPROVIDERMSOLAP`""}
    if (Test-Path env:\choco:sqlserver2016:FARMACCOUNT){Add-Content $configFile "FARMACCOUNT=`"$env:choco:sqlserver2016:FARMACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:FARMPASSWORD){Add-Content $configFile "FARMPASSWORD=`"$env:choco:sqlserver2016:FARMPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2016:PASSPHRASE){Add-Content $configFile "PASSPHRASE=`"$env:choco:sqlserver2016:PASSPHRASE`""}
    if (Test-Path env:\choco:sqlserver2016:FARMADMINIPORT){Add-Content $configFile "FARMADMINIPORT=`"$env:choco:sqlserver2016:FARMADMINIPORT`""}
    if (Test-Path env:\choco:sqlserver2016:BROWSERSVCSTARTUPTYPE){Add-Content $configFile "BROWSERSVCSTARTUPTYPE=`"$env:choco:sqlserver2016:BROWSERSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2016:ENABLERANU){Add-Content $configFile "ENABLERANU=`"$env:choco:sqlserver2016:ENABLERANU`""}
    if (Test-Path env:\choco:sqlserver2016:INSTALLSQLDATADIR){Add-Content $configFile "INSTALLSQLDATADIR=`"$env:choco:sqlserver2016:INSTALLSQLDATADIR`""}
    if (Test-Path env:\choco:sqlserver2016:SAPWD){Add-Content $configFile "SAPWD=`"$env:choco:sqlserver2016:SAPWD`""}
    if (Test-Path env:\choco:sqlserver2016:SECURITYMODE){Add-Content $configFile "SECURITYMODE=`"$env:choco:sqlserver2016:SECURITYMODE`""}
    if (Test-Path env:\choco:sqlserver2016:SQLBACKUPDIR){Add-Content $configFile "SQLBACKUPDIR=`"$env:choco:sqlserver2016:SQLBACKUPDIR`""}
    if (Test-Path env:\choco:sqlserver2016:SQLCOLLATION){Add-Content $configFile "SQLCOLLATION=`"$env:choco:sqlserver2016:SQLCOLLATION`""}
    if (Test-Path env:\choco:sqlserver2016:ADDCURRENTUSERASSQLADMIN){Add-Content $configFile "ADDCURRENTUSERASSQLADMIN=`"$env:choco:sqlserver2016:ADDCURRENTUSERASSQLADMIN`""}
    if (Test-Path env:\choco:sqlserver2016:SQLSVCACCOUNT){Add-Content $configFile "SQLSVCACCOUNT=`"$env:choco:sqlserver2016:SQLSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:SQLSVCPASSWORD){Add-Content $configFile "SQLSVCPASSWORD=`"$env:choco:sqlserver2016:SQLSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2016:SQLSVCSTARTUPTYPE){Add-Content $configFile "SQLSVCSTARTUPTYPE=`"$env:choco:sqlserver2016:SQLSVCSTARTUPTYPE`""}
    if (Test-Path env:\choco:sqlserver2016:SQLSYSADMINACCOUNTS){Add-Content $configFile "SQLSYSADMINACCOUNTS=`"$env:choco:sqlserver2016:SQLSYSADMINACCOUNTS`""}
    if (Test-Path env:\choco:sqlserver2016:SQLTEMPDBDIR){Add-Content $configFile "SQLTEMPDBDIR=`"$env:choco:sqlserver2016:SQLTEMPDBDIR`""}
    if (Test-Path env:\choco:sqlserver2016:SQLTEMPDBLOGDIR){Add-Content $configFile "SQLTEMPDBLOGDIR=`"$env:choco:sqlserver2016:SQLTEMPDBLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2016:SQLTEMPDBFILECOUNT){Add-Content $configFile "SQLTEMPDBFILECOUNT=`"$env:choco:sqlserver2016:SQLTEMPDBFILECOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:SQLTEMPDBFILESIZE){Add-Content $configFile "SQLTEMPDBFILESIZE=`"$env:choco:sqlserver2016:SQLTEMPDBFILESIZE`""}
    if (Test-Path env:\choco:sqlserver2016:SQLTEMPDBFILEGROWTH){Add-Content $configFile "SQLTEMPDBFILEGROWTH=`"$env:choco:sqlserver2016:SQLTEMPDBFILEGROWTH`""}
    if (Test-Path env:\choco:sqlserver2016:SQLTEMPDBLOGFILESIZE){Add-Content $configFile "SQLTEMPDBLOGFILESIZE=`"$env:choco:sqlserver2016:SQLTEMPDBLOGFILESIZE`""}
    if (Test-Path env:\choco:sqlserver2016:SQLTEMPDBLOGFILEGROWTH){Add-Content $configFile "SQLTEMPDBLOGFILEGROWTH=`"$env:choco:sqlserver2016:SQLTEMPDBLOGFILEGROWTH`""}
    if (Test-Path env:\choco:sqlserver2016:SQLUSERDBDIR){Add-Content $configFile "SQLUSERDBDIR=`"$env:choco:sqlserver2016:SQLUSERDBDIR`""}
    if (Test-Path env:\choco:sqlserver2016:SQLSVCINSTANTFILEINIT){Add-Content $configFile "SQLSVCINSTANTFILEINIT=`"$env:choco:sqlserver2016:SQLSVCINSTANTFILEINIT`""}
    if (Test-Path env:\choco:sqlserver2016:SQLUSERDBLOGDIR){Add-Content $configFile "SQLUSERDBLOGDIR=`"$env:choco:sqlserver2016:SQLUSERDBLOGDIR`""}
    if (Test-Path env:\choco:sqlserver2016:FILESTREAMLEVEL){Add-Content $configFile "FILESTREAMLEVEL=`"$env:choco:sqlserver2016:FILESTREAMLEVEL`""}
    if (Test-Path env:\choco:sqlserver2016:FILESTREAMSHARENAME){Add-Content $configFile "FILESTREAMSHARENAME=`"$env:choco:sqlserver2016:FILESTREAMSHARENAME`""}
    if (Test-Path env:\choco:sqlserver2016:FTSVCACCOUNT){Add-Content $configFile "FTSVCACCOUNT=`"$env:choco:sqlserver2016:FTSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:FTSVCPASSWORD){Add-Content $configFile "FTSVCPASSWORD=`"$env:choco:sqlserver2016:FTSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2016:ISSVCACCOUNT){Add-Content $configFile "ISSVCACCOUNT=`"$env:choco:sqlserver2016:ISSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:ISSVCPASSWORD){Add-Content $configFile "ISSVCPASSWORD=`"$env:choco:sqlserver2016:ISSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2016:ISSVCStartupType){Add-Content $configFile "ISSVCStartupType=`"$env:choco:sqlserver2016:ISSVCStartupType`""}
    if (Test-Path env:\choco:sqlserver2016:NPENABLED){Add-Content $configFile "NPENABLED=`"$env:choco:sqlserver2016:NPENABLED`""}
    if (Test-Path env:\choco:sqlserver2016:TCPENABLED){Add-Content $configFile "TCPENABLED=`"$env:choco:sqlserver2016:TCPENABLED`""}
    if (Test-Path env:\choco:sqlserver2016:RSINSTALLMODE){Add-Content $configFile "RSINSTALLMODE=`"$env:choco:sqlserver2016:RSINSTALLMODE`""}
    if (Test-Path env:\choco:sqlserver2016:RSSVCACCOUNT){Add-Content $configFile "RSSVCACCOUNT=`"$env:choco:sqlserver2016:RSSVCACCOUNT`""}
    if (Test-Path env:\choco:sqlserver2016:RSSVCPASSWORD){Add-Content $configFile "RSSVCPASSWORD=`"$env:choco:sqlserver2016:RSSVCPASSWORD`""}
    if (Test-Path env:\choco:sqlserver2016:RSSVCStartupType){Add-Content $configFile "RSSVCStartupType=`"$env:choco:sqlserver2016:RSSVCStartupType`""}

}


function DetermineSetupPath(){

    if (!(Test-Path env:\choco:sqlserver2016:setupFolder)){

        if (!(Test-Path env:\choco:sqlserver2016:isoImage)) 
        {
	        Write-Error "This package requires a path to SQL installation Media via environment variables. eg: 'SET choco:sqlserver2016:setupFolder=<Folder>' or 'SET choco:sqlserver2016:isoImage=<Filename>'. See readme.md on github."
            exit -1
        }
        
        $global:mustDismountIso = $true;
        $mountedIso = Mount-DiskImage -PassThru "$env:choco:sqlserver2016:isoImage"
        $isoDrive = Get-Volume -DiskImage $mountedIso | Select -expand DriveLetter
        Write-Host "Mounted ISO to $isoDrive"
        $env:choco:sqlserver2016:setupFolder = "$isoDrive`:\"
    }

    Write-Host "Path to setup.exe is $env:choco:sqlserver2016:setupFolder"
}


function Teardown(){
    
    if ($global:mustDismountIso){
        Write-Host "Dismounting ISO"
        Dismount-DiskImage -ImagePath $env:choco:sqlserver2016:isoImage
    }
    else
    {
        Write-Host "No ISO to dismount"
    }
        
   #$sqlSetupErrorlevel = $LASTEXITCODE
   #Write-Host "setup error level=$sqlSetupErrorlevel"
   #Write-Host $output
   #
   #if ($sqlSetupErrorlevel -ne 0)
   #{
	#    Write-Error "SQL setup.exe exited with errorlevel '$sqlSetupErrorlevel'"
   #}
   #
   #exit $sqlSetupErrorlevel
}

function ExecuteSetup(){
    $setupExe = "$env:choco:sqlserver2016:setupFolder\setup.exe"
    Write-Host "Executing $setupExe with $configFile"
	
	Install-ChocolateyInstallPackage `
          -PackageName "sqlserver2016" `
          -FileType 'exe' `
          -SilentArgs "/IACCEPTSQLSERVERLICENSETERMS /ConfigurationFile=$configFile" `
          -File "$setupExe" `

    #& $setupExe "/IACCEPTSQLSERVERLICENSETERMS /ConfigurationFile=$configFile"  
}

$global:mustDismountIso = $false

DetermineSetupPath

BuildConfigurationFile

ExecuteSetup

Teardown
