# Chocolatey Packs #
A collection of [chocolatey](https://chocolatey.org/) packages 

`Build.ps1` compiles all packages and places them in the `.artifacts` folder

`Push.ps1` Queries Chocolatey for the latest published version and pushes any packages that are not up to date

##SQL Server Packages
The SQL Server chocolatey packages were rejected from chocolatey.org since they cannot run without a user specified path to an ISO image. They are available from a public myget feed: [https://www.myget.org/F/nm-chocolatey-packs/api/v2](https://www.myget.org/F/nm-chocolatey-packs/api/v2)

See my [boxstarter script](https://github.com/neutmute/nm-boxstarter/blob/master/base-box.ps1) for example code on how to execute them as well as the package `readme.md` files

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
See [readme.md](https://github.com/neutmute/nm-chocolatey-packs/tree/master/sqlserver2016) in package folder

#### sqlserver2012
See [readme.md](https://github.com/neutmute/nm-chocolatey-packs/tree/master/sqlserver2012) in package folder

#### sqlserver2008
See [readme.md](https://github.com/neutmute/nm-chocolatey-packs/tree/master/sqlserver2008) in package folder

#### sqlstudio
SQL Management Studio




