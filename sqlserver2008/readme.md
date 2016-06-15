# SQL Server 2008 Chocolatey Package
* Uses environment variables to configure.
* Minimum requirement is a local path to the ISO image.
* Path to the ISO is supplied to the package via the `choco:sqlserver2008:isoImage` environment variable.

See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://technet.microsoft.com/en-us/library/ms144259%28v=sql.110%29.aspx)

##Example install
Execute this from elevated PowerShell to install to an instance named `SQL2008` with sql management studio and a custom collation:

	#mandatory param - use one of the following
	$env:choco:sqlserver2008:isoImage="D:\Downloads\en_sql_server_2008_r2_developer_x86_x64_ia64_dvd_522665.iso"
	$env:choco:sqlserver2008:setupFolder="E:" # Use this for Windows 7 which can't mount an iso from powershell 
	
	#optional params
	$env:choco:sqlserver2008:INSTANCEID="sql2008"
	$env:choco:sqlserver2008:INSTANCENAME="SQL2008"
	$env:choco:sqlserver2008:AGTSVCACCOUNT="NT AUTHORITY\SYSTEM"
	$env:choco:sqlserver2008:SQLCOLLATION="SQL_Latin1_General_CP1_CI_AS"
	$env:choco:sqlserver2008:SQLSVCACCOUNT="NT AUTHORITY\SYSTEM"
	$env:choco:sqlserver2008:INSTALLSQLDATADIR="D:\data\sql"
	$env:choco:sqlserver2008:SECURITYMODE="SQL"                 # mixed mode auth

	choco install sqlserver2008 -Source "https://www.myget.org/F/nm-chocolatey-packs/api/v2"

