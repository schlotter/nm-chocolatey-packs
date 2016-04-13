# SQL Server 2012 Chocolatey Package
* Uses environment variables to configure.
* Minimum requirement is a local path to the ISO image.
* Path to the ISO is supplied to the package via the `choco:sqlserver2012:isoImage` environment variable.

See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://technet.microsoft.com/en-us/library/ms144259%28v=sql.110%29.aspx)

##Example install
Execute this from elevated PowerShell to install to an instance named `SQL2012` with sql management studio and a custom collation:

	$env:choco:sqlserver2012:isoImage="D:\Downloads\en_sql_server_2012_developer_edition_with_service_pack_3_x86_dvd_7286785.iso"
	$env:choco:sqlserver2012:INSTALLSQLDATADIR="C:\Data\Sql\sql2012" # Optional parameter
	$env:choco:sqlserver2012:INSTANCEID="sql2012"
	$env:choco:sqlserver2012:INSTANCENAME="sql2012"
	$env:choco:sqlserver2012:FEATURES="SQLENGINE,SSMS,ADV_SSMS"
	$env:choco:sqlserver2012:AGTSVCACCOUNT="NT Service\SQLAgent`$SQL2012"
	$env:choco:sqlserver2012:SQLSVCACCOUNT="NT Service\MSSQL`$SQL2012"
	$env:choco:sqlserver2012:SQLCOLLATION="SQL_Latin1_General_CP1_CI_AS"

	choco install sqlserver2012












