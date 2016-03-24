# stop on all errors
$ErrorActionPreference = 'Stop';

$packageName = 'HttpPlatformHandler' 
$registryUninstallerKeyName = 'HttpPlatformHandler' 
$installerType = 'msi' 
$url = 'http://go.microsoft.com/fwlink/?LinkId=690722' 
$url64 = 'http://go.microsoft.com/fwlink/?LinkId=690721'
$silentArgs = '/quiet' 
$validExitCodes = @(0) 
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
