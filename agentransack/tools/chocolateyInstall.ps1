$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3326/agentransack_x86_msi_3326.zip'
$url64      = 'https://download.mythicsoft.com/flp/3326/agentransack_x64_msi_3326.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3326.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3326.msi'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'MSI'
  url           = $url
  url64         = $url64
  unzipLocation = $toolsDir
  file          = $fileLocation
  file64        = $fileLocation64

  silentArgs    = "/quiet"
  validExitCodes= @(0)

  softwareName  = 'AgentRansack'
  checksum      = 'A8B03186C831E8085058CF745E989E1E45481E1B078F31895B08912D8F9C1738'
  checksumType  = 'sha256'
  checksum64    = 'F85A90AFC7DE247D2402F73BB6E669392EDCBA288EFD4241E9CF9DF35E8E1BA9'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
