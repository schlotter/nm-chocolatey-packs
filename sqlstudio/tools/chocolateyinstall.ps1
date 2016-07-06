
$packageName = 'sqlstudio' 
$registryUninstallerKeyName = 'sqlstudio' 
$installerType = 'exe' 
$validExitCodes = @(0) 
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$silentArgs = "/install /quiet /norestart /log $toolsDir\..\log.txt"

$url="http://download.microsoft.com/download/6/F/C/6FCFDC7F-772F-4FEF-BD48-D75C9A3CFB54/SSMS-Setup-ENU.exe"

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" -validExitCodes $validExitCodes