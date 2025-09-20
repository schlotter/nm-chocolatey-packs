$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3530/agentransack_x86_msi_3530.zip'
$url64      = 'https://download.mythicsoft.com/flp/3530/agentransack_x64_msi_3530.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3530.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3530.msi'

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
  checksum      = '7877170efac93b1d6a2da920dd51b5ea23298613e90d625baabf775111f33f99'
  checksumType  = 'sha256'
  checksum64    = '23ec37f22eccf35d8c1b452e9c509776a86fbeb2a461e1cfc00e5105cf1d7d59'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
