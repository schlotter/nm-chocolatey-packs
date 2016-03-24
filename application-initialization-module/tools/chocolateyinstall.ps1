# stop on all errors
$ErrorActionPreference = 'Stop';

$packageName = 'application-initialization-module' 
$registryUninstallerKeyName = 'application-initialization-module' 
$installerType = 'msi' 
$url = 'http://go.microsoft.com/fwlink/?LinkID=247816' 
$url64 = 'http://go.microsoft.com/fwlink/?LinkID=247817'
$silentArgs = '/quiet' 
$validExitCodes = @(0) 
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
