$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha1 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha1 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/2947/agentransack_x86_msi_2947.zip'
$url64      = 'https://download.mythicsoft.com/flp/2947/agentransack_x64_msi_2947.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_2947.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_2947.msi'

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
  checksum      = '6F7A9C48EC7A20579D17D87BCF2E51145D078F45'
  checksumType  = 'sha1'
  checksum64    = '311578AAC079A7F027C3891BC8446A980A529E21'
  checksumType64= 'sha1'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
