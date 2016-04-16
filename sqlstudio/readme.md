# SQL Server Management Studio (SSMS) Package
SQL Server Management Studio (SSMS) is an integrated environment for accessing, configuring, managing, administering, and developing all components of SQL Server. 

##Example install
From elevated PowerShell:

	# optional if you have the 800MB download cached locally
	$env:chocolatey:sqlstudio:url="D:\Downloads\SSMS-Setup-ENU.exe" 

	# required
	choco install sqlstudio

##Prerequisites
[KB2919355](https://support.microsoft.com/en-au/kb/2919355) for applicable operating systems
