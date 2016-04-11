# Chocolatey Packs #
A collection of [chocolatey](https://chocolatey.org/) packages 

`Build.ps1` compiles all packages and places them in the `.artifacts` folder

`Push.ps1` Queries Chocolatey for the latest published version and pushes any packages that are not up to date

##Packages
#### agentransack
Silent install achieved via auto hot keys

#### application-initialization-module
Never published

#### commandWindowHere
Adds Open an elevated administrator command prompt to Explorer context menu 

#### explorer-expand-to-current-folder
Sets sensible Windows Explorer option

#### explorer-show-all-folders
Sets sensible Windows Explorer option

#### taskbar-never-combine
Sets sensible Windows Explorer option

#### httpPlatformHandler
Required for ASP.NET Core RC-1

#### web-platform-disable-prompt
Uses Autohotkey to disable annoying inetmgr dialog

#### wintail
Simple tail utility with shortcut added to `Send To` menu

#### sqlserver2016
Silent installs of SQL Server 2016. Uses environment variables to configure.
Minimum requirement is a local path to the ISO image (not publicly available at time of writing)
See `chocolateyinstall.ps1` for all environment vars which mirror those in the [documentation](https://msdn.microsoft.com/en-us/library/ms144259.aspx)

** Cannot install developer edition due to limits in the setup.exe params from Microsoft

######Example install
	$env:choco:sqlserver2016:isoImage="D:\Downloads\en_sql_server_2016_rc_2_x64_dvd_8509698.iso"
	$env:choco:sqlserver2016:INSTALLSQLDATADIR="C:\Data\Sql"
	choco install sqlserver2016





