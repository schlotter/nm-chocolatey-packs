$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3434/agentransack_x86_msi_3434.zip'
$url64      = 'https://download.mythicsoft.com/flp/3434/agentransack_x64_msi_3434.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3434.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3434.msi'

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
  checksum      = '6600e17684eecebd3af974fc761dcb15fc4bee47e7f80419ad52c0b61fa5f0a1'
  checksumType  = 'sha256'
  checksum64    = '21ba767bc9c1b20360abca4e846f42a21056af082b49788abd28f1ecb3dfc5ea'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
