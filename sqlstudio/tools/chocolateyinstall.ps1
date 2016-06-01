
$packageName = 'sqlstudio' 
$registryUninstallerKeyName = 'sqlstudio' 
$installerType = 'exe' 
$validExitCodes = @(0) 
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$silentArgs = "/install /quiet /norestart /log $toolsDir\..\log.txt"

$url="http://download.microsoft.com/download/E/D/3/ED3B06EC-E4B5-40B3-B861-996B710A540C/SSMS-Setup-ENU.exe"

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes