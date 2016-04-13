# stop on all errors

$packageName = 'sqlstudio' 
$registryUninstallerKeyName = 'sqlstudio' 
$installerType = 'exe' 
$silentArgs = "/install /quiet /norestart /log $toolsDir\..\log.txt"
$validExitCodes = @(0) 
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

if (!(Test-Path env:\chocolatey:sqlstudio:url)){$env:chocolatey:sqlstudio:url="http://go.microsoft.com/fwlink/?LinkId=690722"}

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$env:chocolatey:sqlstudio:url" -validExitCodes $validExitCodes