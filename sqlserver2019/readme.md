# SQL Server 2019 Chocolatey Package
* Uses environment variables to configure.
* Minimum requirement is a local path to the ISO image.
* Path to the ISO is supplied to the package via the `choco:sqlserver2019:isoImage` environment variable.

See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://docs.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server-from-the-command-prompt?redirectedfrom=MSDN&view=sql-server-ver15)

## Example install
From elevated PowerShell:

	$env:choco:sqlserver2019:isoImage="D:\Downloads\SQLServer2019-x64-ENU-Dev.iso"

	$env:choco:sqlserver2019:PID="22222-00000-00000-00000-00000" # Developer edition
	$env:choco:sqlserver2019:INSTANCEID="sql2019"
	$env:choco:sqlserver2019:INSTANCENAME="sql2019"
	$env:choco:sqlserver2019:AGTSVCACCOUNT="NT Service\SQLAgent`$SQL2019"
	$env:choco:sqlserver2019:SQLSVCACCOUNT="NT Service\MSSQL`$SQL2019"
	$env:choco:sqlserver2019:INSTALLSQLDATADIR="C:\Data\Sql"

	# If you want mixed mode auth, you must supply a password for sa, otherwise skip these two configs
	$env:choco:sqlserver2019:SECURITYMODE="SQL"
	$env:choco:sqlserver2019:SAPWD="0wn3d"

	choco install sqlserver2019 -Source "https://www.myget.org/F/nm-chocolatey-packs/api/v2"
