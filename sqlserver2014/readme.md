# SQL Server 2014 Chocolatey Package

* Uses environment variables to configure.
* Minimum requirement is a local path to the ISO image.
* Path to the ISO is supplied to the package via the `choco:sqlserver2014:isoImage` environment variable.

See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://msdn.microsoft.com/en-us/library/ms144259(v=sql.120).aspx)

## Example install

Execute this from elevated PowerShell to install to an instance named `SQL2014` with sql management studio and a custom collation:

### mandatory param - use one of the following

```powershell
$env:choco:sqlserver2014:isoImage="D:\Downloads\en_sql_server_2014_developer_edition_with_service_pack_3_x86_dvd_7286785.iso"
$env:choco:sqlserver2014:setupFolder="E:" # Use this for Windows 7 which can't mount an iso from powershell
```

### optional params

```powershell
$env:choco:sqlserver2014:INSTALLSQLDATADIR="D:\Data\Sql"
$env:choco:sqlserver2014:INSTANCEID="sql2014"
$env:choco:sqlserver2014:INSTANCENAME="sql2014"
$env:choco:sqlserver2014:FEATURES="SQLENGINE,ADV_SSMS"
$env:choco:sqlserver2014:AGTSVCACCOUNT="NT Service\SQLAgent`$SQL2014"
$env:choco:sqlserver2014:SQLSVCACCOUNT="NT Service\MSSQL`$SQL2014"
$env:choco:sqlserver2014:SQLCOLLATION="SQL_Latin1_General_CP1_CI_AS"
```

### If you want mixed mode auth, you must supply a password for sa, otherwise skip these two configs

```powershell
$env:choco:sqlserver2014:SECURITYMODE="SQL"
$env:choco:sqlserver2014:SAPWD="0wn3d"
choco install sqlserver2014 -Source "https://www.myget.org/F/nm-chocolatey-packs/api/v2"
```











