$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3425/agentransack_x86_msi_3425.zip'
$url64      = 'https://download.mythicsoft.com/flp/3425/agentransack_x64_msi_3425.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3425.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3425.msi'

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
  checksum      = 'fbcac0869e3712bec63a2939c62596b53d268a5b1b0ebf04928a7825d89c2e9d'
  checksumType  = 'sha256'
  checksum64    = '37c266037f4445c513a5fd0dbda5d841933228303f1a92d9947708c6ea5a3ecc'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
