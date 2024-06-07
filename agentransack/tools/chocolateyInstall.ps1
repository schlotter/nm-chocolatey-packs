$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3435/agentransack_x86_msi_3435.zip'
$url64      = 'https://download.mythicsoft.com/flp/3435/agentransack_x64_msi_3435.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3435.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3435.msi'

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
  checksum      = '4b160c0ee06e5d10ea4c31326eabae1b90a308509f52750db9c9d2986f66bd94'
  checksumType  = 'sha256'
  checksum64    = 'f288d43238ba323526e6fc6702f2e61afd1e7f8bcbee4f2bcee208817968a5f7'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
