$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3418/agentransack_x86_msi_3418.zip'
$url64      = 'https://download.mythicsoft.com/flp/3418/agentransack_x64_msi_3418.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3418.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3418.msi'

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
  checksum      = 'b321468de2aaef60d71ea62bb1005ec9a85f8e01be82b7bb5ba48a8f74b820fa'
  checksumType  = 'sha256'
  checksum64    = '107f91735614092aa82cd2a03f1093ec1ecd6a3260c8669a1f8127821d0cabff'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
