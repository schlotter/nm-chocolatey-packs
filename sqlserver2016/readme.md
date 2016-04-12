# SQL Server 2016 Chocolatey Package
* Uses environment variables to configure.
* Minimum requirement is a local path to the ISO image (not publicly available at time of writing).
* Path to the ISO is supplied to the package via the `choco:sqlserver2016:isoImage` environment variable.

See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://msdn.microsoft.com/en-us/library/ms144259.aspx)

##Example install
From elevated PowerShell:

	$env:choco:sqlserver2016:isoImage="D:\Downloads\en_sql_server_2016_rc_2_x64_dvd_8509698.iso"
	$env:choco:sqlserver2016:INSTALLSQLDATADIR="C:\Data\Sql" # Optional parameter
	choco install sqlserver2016

## Known Issues
Developer edition currently cannot be installed due to limiations in the Mirosoft installer.

See the [Connect ticket](https://connect.microsoft.com/SQLServer/feedback/details/2576662/specify-developer-edition-from-command-line-parameter-or-configuration-file-install) for more information










