
$packageName = 'sqlstudio' 
$registryUninstallerKeyName = 'sqlstudio' 
$installerType = 'exe' 
$validExitCodes = @(0) 
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$silentArgs = "/install /quiet /norestart /log $toolsDir\..\log.txt"

$url="http://go.microsoft.com/fwlink/?LinkID=786460"

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes