$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3502/agentransack_x86_msi_3502.zip'
$url64      = 'https://download.mythicsoft.com/flp/3502/agentransack_x64_msi_3502.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3502.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3502.msi'

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
  checksum      = '3de0bce37c9f78ddba21fad1467e2c183668eeb39b6ea46b94af059c82244901'
  checksumType  = 'sha256'
  checksum64    = 'e8dad414d1fa0e7fdec0b0134451003b860e8eae13b21369d12f212a1e750330'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
