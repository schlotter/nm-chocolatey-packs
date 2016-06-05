# SQL Server 2016 Chocolatey Package
* Uses environment variables to configure.
* Minimum requirement is a local path to the ISO image (not publicly available at time of writing).
* Path to the ISO is supplied to the package via the `choco:sqlserver2016:isoImage` environment variable.

See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://msdn.microsoft.com/en-us/library/ms144259.aspx)

##Example install
From elevated PowerShell:

	
	$env:choco:sqlserver2016:isoImage="D:\Downloads\en_sql_server_2016_rc_2_x64_dvd_8509698.iso"

	$env:choco:sqlserver2016:PID="22222-00000-00000-00000-00000" # Developer edition
	$env:choco:sqlserver2016:INSTANCEID="sql2016"
	$env:choco:sqlserver2016:INSTANCENAME="sql2016"
	$env:choco:sqlserver2016:AGTSVCACCOUNT="NT Service\SQLAgent`$SQL2016"
	$env:choco:sqlserver2016:SQLSVCACCOUNT="NT Service\MSSQL`$SQL2016"
	$env:choco:sqlserver2016:INSTALLSQLDATADIR="C:\Data\Sql"
 
	choco install sqlserver2016 -Source "https://www.myget.org/F/nm-chocolatey-packs/api/v2"

##Prerequisites
[KB2919355](https://support.microsoft.com/en-au/kb/2919355) for applicable operating systems









