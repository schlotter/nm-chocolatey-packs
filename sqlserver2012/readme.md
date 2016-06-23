# SQL Server 2012 Chocolatey Package
* Uses environment variables to configure.
* Minimum requirement is a local path to the ISO image.
* Path to the ISO is supplied to the package via the `choco:sqlserver2012:isoImage` environment variable.

See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://technet.microsoft.com/en-us/library/ms144259%28v=sql.110%29.aspx)

##Example install
Execute this from elevated PowerShell to install to an instance named `SQL2012` with sql management studio and a custom collation:

	#mandatory param - use one of the following
	$env:choco:sqlserver2012:isoImage="D:\Downloads\en_sql_server_2012_developer_edition_with_service_pack_3_x86_dvd_7286785.iso"
	$env:choco:sqlserver2012:setupFolder="E:" # Use this for Windows 7 which can't mount an iso from powershell 
	
	#optional params
	$env:choco:sqlserver2012:INSTALLSQLDATADIR="D:\Data\Sql"
	$env:choco:sqlserver2012:INSTANCEID="sql2012"
	$env:choco:sqlserver2012:INSTANCENAME="sql2012"
	$env:choco:sqlserver2012:FEATURES="SQLENGINE,SSMS,ADV_SSMS"
	$env:choco:sqlserver2012:AGTSVCACCOUNT="NT Service\SQLAgent`$SQL2012"
	$env:choco:sqlserver2012:SQLSVCACCOUNT="NT Service\MSSQL`$SQL2012"
	$env:choco:sqlserver2012:SQLCOLLATION="SQL_Latin1_General_CP1_CI_AS"
	
	# If you want mixed mode auth, you must supply a password for sa, otherwise skip these two configs
	$env:choco:sqlserver2012:SECURITYMODE="SQL"                
	$env:choco:sqlserver2012:SAPWD="0wn3d"

	choco install sqlserver2012 -Source "https://www.myget.org/F/nm-chocolatey-packs/api/v2"












