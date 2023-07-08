$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3405/agentransack_x86_msi_3405.zip'
$url64      = 'https://download.mythicsoft.com/flp/3405/agentransack_x64_msi_3405.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3405.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3405.msi'

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
  checksum      = '720540EC0901521F41F1882633697570D1D0EC95BE81754C7F807836C585811C'
  checksumType  = 'sha256'
  checksum64    = '76FEE8FDC9B6E84F563DD3F3A300B8F2328C381CAF2F829C293AE9B508EC8493'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
