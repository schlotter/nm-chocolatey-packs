# SQL Server 2019 Chocolatey Package
* Uses environment variables to configure.
* Minimum requirement is a local path to the ISO image.
* Path to the ISO is supplied to the package via the `choco:sqlserver2019:isoImage` environment variable.

See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://docs.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server-from-the-command-prompt?redirectedfrom=MSDN&view=sql-server-ver15)

## Example install
From elevated PowerShell:

	$env:choco:sqlserver2019:isoImage="C:\Downloads\SQLServer2019-x64-ENU-Dev.iso"
	
	$env:choco:sqlserver2019:SQLSYSADMINACCOUNTS="$env:UserDomain\$env:UserName"
	$env:choco:sqlserver2019:PID="22222-00000-00000-00000-00000" # Developer edition
	$env:choco:sqlserver2019:INSTANCEID="sql2019"
	$env:choco:sqlserver2019:INSTANCENAME="sql2019"
	$env:choco:sqlserver2019:AGTSVCACCOUNT="NT Service\SQLAgent`$SQL2019"
	$env:choco:sqlserver2019:SQLSVCACCOUNT="NT Service\MSSQL`$SQL2019"
	$env:choco:sqlserver2019:INSTALLSQLDATADIR="C:\Data\Sql"
	$env:choco:sqlserver2019:NPENABLED="1"
	$env:choco:sqlserver2019:FEATURES="SQLENGINE,IS"
	$env:choco:sqlserver2019:SQLCOLLATION="SQL_Latin1_General_CP1_CI_AS"
	
	# If you want mixed mode auth, you must supply a password for sa, otherwise skip these two configs
	$env:choco:sqlserver2019:SECURITYMODE="SQL"
	$env:choco:sqlserver2019:SAPWD="0wn3d" # Be sure to update this before running or after install
	

	$env:choco:sqlserver2019:UpdateEnabled=$true
	## Create a folder D:\temp\Updates and put any cumulative updates in there

	choco install sqlserver2019 --source=$sqlPackageSource  --install-arguments="'/UpdateSource="D:\temp\Updates"' /INDICATEPROGRESS"

	# Delete the INI file as it has passwords in it
	Remove-Item 'C:\programdata\chocolatey' -recurse -Include configuration.ini