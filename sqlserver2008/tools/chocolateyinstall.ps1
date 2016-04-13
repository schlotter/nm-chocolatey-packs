# stop on all errors
$ErrorActionPreference = 'Stop';

$toolsDir = Split-Path -parent $PSCommandPath
$configFile = "$toolsDir\configuration.ini"
$thisUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

Write-Host "Configuration file is $configFile"

function BuildConfigurationFile()
{
    remove-item -path "$configFile" -Force -ErrorAction SilentlyContinue
    
    Add-Content $configFile "[SQLSERVER2008]"

	##
    ## Below generated from https://github.com/neutmute/chocolatey-packs/raw/master/sqlserver2008/docs/sql2008_ParamGenerator.xlsx
	##
	
    # If user didn't supply some basic requirements, set them
	if (!(Test-Path env:\choco:sqlserver2008:ACTION)){$env:choco:sqlserver2008:ACTION="INSTALL"}
	if (!(Test-Path env:\choco:sqlserver2008:FEATURES)){$env:choco:sqlserver2008:FEATURES="SQLEngine"}
	if (!(Test-Path env:\choco:sqlserver2008:QS)){$env:choco:sqlserver2008:QS="TRUE"}
	if (!(Test-Path env:\choco:sqlserver2008:SQLSYSADMINACCOUNTS)){$env:choco:sqlserver2008:SQLSYSADMINACCOUNTS="$thisUser"}
	if (!(Test-Path env:\choco:sqlserver2008:IAcceptSQLServerLicenseTerms)){$env:choco:sqlserver2008:IACCEPTSQLSERVERLICENSETERMS="TRUE"}

    
	# Write config to file
	if (Test-Path env:\choco:sqlserver2008:ACTION){Add-Content $configFile "ACTION=`"$env:choco:sqlserver2008:ACTION`""}
	if (Test-Path env:\choco:sqlserver2008:IAcceptSQLServerLicenseTerms){Add-Content $configFile "IACCEPTSQLSERVERLICENSETERMS=`"$env:choco:sqlserver2008:IACCEPTSQLSERVERLICENSETERMS`""}
	if (Test-Path env:\choco:sqlserver2008:CONFIGURATIONFILE){Add-Content $configFile "CONFIGURATIONFILE=`"$env:choco:sqlserver2008:CONFIGURATIONFILE`""}
	if (Test-Path env:\choco:sqlserver2008:ERRORREPORTING){Add-Content $configFile "ERRORREPORTING=`"$env:choco:sqlserver2008:ERRORREPORTING`""}
	if (Test-Path env:\choco:sqlserver2008:FEATURES){Add-Content $configFile "FEATURES=`"$env:choco:sqlserver2008:FEATURES`""}
	if (Test-Path env:\choco:sqlserver2008:HELP){Add-Content $configFile "HELP=`"$env:choco:sqlserver2008:HELP`""}
	if (Test-Path env:\choco:sqlserver2008:INDICATEPROGRESS){Add-Content $configFile "INDICATEPROGRESS=`"$env:choco:sqlserver2008:INDICATEPROGRESS`""}
	if (Test-Path env:\choco:sqlserver2008:INSTALLSHAREDDIR){Add-Content $configFile "INSTALLSHAREDDIR=`"$env:choco:sqlserver2008:INSTALLSHAREDDIR`""}
	if (Test-Path env:\choco:sqlserver2008:INSTALLSHAREDWOWDIR){Add-Content $configFile "INSTALLSHAREDWOWDIR=`"$env:choco:sqlserver2008:INSTALLSHAREDWOWDIR`""}
	if (Test-Path env:\choco:sqlserver2008:INSTANCEDIR){Add-Content $configFile "INSTANCEDIR=`"$env:choco:sqlserver2008:INSTANCEDIR`""}
	if (Test-Path env:\choco:sqlserver2008:INSTANCEID){Add-Content $configFile "INSTANCEID=`"$env:choco:sqlserver2008:INSTANCEID`""}
	if (Test-Path env:\choco:sqlserver2008:INSTANCENAME){Add-Content $configFile "INSTANCENAME=`"$env:choco:sqlserver2008:INSTANCENAME`""}
	if (Test-Path env:\choco:sqlserver2008:PID){Add-Content $configFile "PID=`"$env:choco:sqlserver2008:PID`""}
	if (Test-Path env:\choco:sqlserver2008:Q){Add-Content $configFile "Q=`"$env:choco:sqlserver2008:Q`""}
	if (Test-Path env:\choco:sqlserver2008:QS){Add-Content $configFile "QS=`"$env:choco:sqlserver2008:QS`""}
	if (Test-Path env:\choco:sqlserver2008:SQMREPORTING){Add-Content $configFile "SQMREPORTING=`"$env:choco:sqlserver2008:SQMREPORTING`""}
	if (Test-Path env:\choco:sqlserver2008:HIDECONSOLE){Add-Content $configFile "HIDECONSOLE=`"$env:choco:sqlserver2008:HIDECONSOLE`""}
	if (Test-Path env:\choco:sqlserver2008:AGTSVCACCOUNT){Add-Content $configFile "AGTSVCACCOUNT=`"$env:choco:sqlserver2008:AGTSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2008:AGTSVCPASSWORD){Add-Content $configFile "AGTSVCPASSWORD=`"$env:choco:sqlserver2008:AGTSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2008:AGTSVCSTARTUPTYPE){Add-Content $configFile "AGTSVCSTARTUPTYPE=`"$env:choco:sqlserver2008:AGTSVCSTARTUPTYPE`""}
	if (Test-Path env:\choco:sqlserver2008:ASBACKUPDIR){Add-Content $configFile "ASBACKUPDIR=`"$env:choco:sqlserver2008:ASBACKUPDIR`""}
	if (Test-Path env:\choco:sqlserver2008:ASCOLLATION){Add-Content $configFile "ASCOLLATION=`"$env:choco:sqlserver2008:ASCOLLATION`""}
	if (Test-Path env:\choco:sqlserver2008:ASCONFIGDIR){Add-Content $configFile "ASCONFIGDIR=`"$env:choco:sqlserver2008:ASCONFIGDIR`""}
	if (Test-Path env:\choco:sqlserver2008:ASDATADIR){Add-Content $configFile "ASDATADIR=`"$env:choco:sqlserver2008:ASDATADIR`""}
	if (Test-Path env:\choco:sqlserver2008:ASLOGDIR){Add-Content $configFile "ASLOGDIR=`"$env:choco:sqlserver2008:ASLOGDIR`""}
	if (Test-Path env:\choco:sqlserver2008:ASSVCACCOUNT){Add-Content $configFile "ASSVCACCOUNT=`"$env:choco:sqlserver2008:ASSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2008:ASSVCPASSWORD){Add-Content $configFile "ASSVCPASSWORD=`"$env:choco:sqlserver2008:ASSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2008:ASSVCSTARTUPTYPE){Add-Content $configFile "ASSVCSTARTUPTYPE=`"$env:choco:sqlserver2008:ASSVCSTARTUPTYPE`""}
	if (Test-Path env:\choco:sqlserver2008:ASSYSADMINACCOUNTS){Add-Content $configFile "ASSYSADMINACCOUNTS=`"$env:choco:sqlserver2008:ASSYSADMINACCOUNTS`""}
	if (Test-Path env:\choco:sqlserver2008:ASTEMPDIR){Add-Content $configFile "ASTEMPDIR=`"$env:choco:sqlserver2008:ASTEMPDIR`""}
	if (Test-Path env:\choco:sqlserver2008:ASPROVIDERMSOLAP){Add-Content $configFile "ASPROVIDERMSOLAP=`"$env:choco:sqlserver2008:ASPROVIDERMSOLAP`""}
	if (Test-Path env:\choco:sqlserver2008:BROWSERSVCSTARTUPTYPE){Add-Content $configFile "BROWSERSVCSTARTUPTYPE=`"$env:choco:sqlserver2008:BROWSERSVCSTARTUPTYPE`""}
	if (Test-Path env:\choco:sqlserver2008:ENABLERANU){Add-Content $configFile "ENABLERANU=`"$env:choco:sqlserver2008:ENABLERANU`""}
	if (Test-Path env:\choco:sqlserver2008:INSTALLSQLDATADIR){Add-Content $configFile "INSTALLSQLDATADIR=`"$env:choco:sqlserver2008:INSTALLSQLDATADIR`""}
	if (Test-Path env:\choco:sqlserver2008:SAPWD){Add-Content $configFile "SAPWD=`"$env:choco:sqlserver2008:SAPWD`""}
	if (Test-Path env:\choco:sqlserver2008:SECURITYMODE){Add-Content $configFile "SECURITYMODE=`"$env:choco:sqlserver2008:SECURITYMODE`""}
	if (Test-Path env:\choco:sqlserver2008:SQLBACKUPDIR){Add-Content $configFile "SQLBACKUPDIR=`"$env:choco:sqlserver2008:SQLBACKUPDIR`""}
	if (Test-Path env:\choco:sqlserver2008:SQLCOLLATION){Add-Content $configFile "SQLCOLLATION=`"$env:choco:sqlserver2008:SQLCOLLATION`""}
	if (Test-Path env:\choco:sqlserver2008:SQLSVCACCOUNT){Add-Content $configFile "SQLSVCACCOUNT=`"$env:choco:sqlserver2008:SQLSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2008:SQLSVCPASSWORD){Add-Content $configFile "SQLSVCPASSWORD=`"$env:choco:sqlserver2008:SQLSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2008:SQLSVCSTARTUPTYPE){Add-Content $configFile "SQLSVCSTARTUPTYPE=`"$env:choco:sqlserver2008:SQLSVCSTARTUPTYPE`""}
	if (Test-Path env:\choco:sqlserver2008:SQLSYSADMINACCOUNTS){Add-Content $configFile "SQLSYSADMINACCOUNTS=`"$env:choco:sqlserver2008:SQLSYSADMINACCOUNTS`""}
	if (Test-Path env:\choco:sqlserver2008:SQLTEMPDBDIR){Add-Content $configFile "SQLTEMPDBDIR=`"$env:choco:sqlserver2008:SQLTEMPDBDIR`""}
	if (Test-Path env:\choco:sqlserver2008:SQLTEMPDBLOGDIR){Add-Content $configFile "SQLTEMPDBLOGDIR=`"$env:choco:sqlserver2008:SQLTEMPDBLOGDIR`""}
	if (Test-Path env:\choco:sqlserver2008:SQLUSERDBDIR){Add-Content $configFile "SQLUSERDBDIR=`"$env:choco:sqlserver2008:SQLUSERDBDIR`""}
	if (Test-Path env:\choco:sqlserver2008:SQLUSERDBLOGDIR){Add-Content $configFile "SQLUSERDBLOGDIR=`"$env:choco:sqlserver2008:SQLUSERDBLOGDIR`""}
	if (Test-Path env:\choco:sqlserver2008:USESYSDB){Add-Content $configFile "USESYSDB=`"$env:choco:sqlserver2008:USESYSDB`""}
	if (Test-Path env:\choco:sqlserver2008:FILESTREAMLEVEL){Add-Content $configFile "FILESTREAMLEVEL=`"$env:choco:sqlserver2008:FILESTREAMLEVEL`""}
	if (Test-Path env:\choco:sqlserver2008:FILESTREAMSHARENAME){Add-Content $configFile "FILESTREAMSHARENAME=`"$env:choco:sqlserver2008:FILESTREAMSHARENAME`""}
	if (Test-Path env:\choco:sqlserver2008:FTSVCACCOUNT){Add-Content $configFile "FTSVCACCOUNT=`"$env:choco:sqlserver2008:FTSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2008:FTSVCPASSWORD){Add-Content $configFile "FTSVCPASSWORD=`"$env:choco:sqlserver2008:FTSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2008:ISSVCACCOUNT){Add-Content $configFile "ISSVCACCOUNT=`"$env:choco:sqlserver2008:ISSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2008:ISSVCPASSWORD){Add-Content $configFile "ISSVCPASSWORD=`"$env:choco:sqlserver2008:ISSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2008:ISSVCStartupType){Add-Content $configFile "ISSVCStartupType=`"$env:choco:sqlserver2008:ISSVCStartupType`""}
	if (Test-Path env:\choco:sqlserver2008:NPENABLED){Add-Content $configFile "NPENABLED=`"$env:choco:sqlserver2008:NPENABLED`""}
	if (Test-Path env:\choco:sqlserver2008:TCPENABLED){Add-Content $configFile "TCPENABLED=`"$env:choco:sqlserver2008:TCPENABLED`""}
	if (Test-Path env:\choco:sqlserver2008:RSINSTALLMODE){Add-Content $configFile "RSINSTALLMODE=`"$env:choco:sqlserver2008:RSINSTALLMODE`""}
	if (Test-Path env:\choco:sqlserver2008:RSSVCACCOUNT){Add-Content $configFile "RSSVCACCOUNT=`"$env:choco:sqlserver2008:RSSVCACCOUNT`""}
	if (Test-Path env:\choco:sqlserver2008:RSSVCPASSWORD){Add-Content $configFile "RSSVCPASSWORD=`"$env:choco:sqlserver2008:RSSVCPASSWORD`""}
	if (Test-Path env:\choco:sqlserver2008:RSSVCStartupType){Add-Content $configFile "RSSVCStartupType=`"$env:choco:sqlserver2008:RSSVCStartupType`""}

}

BuildConfigurationFile

$mountedIso = Mount-DiskImage -PassThru "$env:choco:sqlserver2008:isoImage"
$isoDrive = Get-Volume -DiskImage $mountedIso | Select -expand DriveLetter
Write-Host "Mounted ISO to $isoDrive, starting setup.exe"

$output = & "$isoDrive`:\setup.exe" "/ConfigurationFile=$configFile"

$sqlSetupErrorlevel = $LASTEXITCODE
Write-Host "setup error level=$sqlSetupErrorlevel"
Write-Host $output

if ($sqlSetupErrorlevel -ne 0)
{
	Write-Error "SQL setup.exe exited with errorlevel $sqlSetupErrorlevel"
}

Write-Host "Dismounting ISO"
Dismount-DiskImage -ImagePath $env:choco:sqlserver2008:isoImage
exit $sqlSetupErrorlevel
