$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3536/agentransack_x86_msi_3536.zip'
$url64      = 'https://download.mythicsoft.com/flp/3536/agentransack_x64_msi_3536.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3536.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3536.msi'

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
  checksum      = '1d67aeb46a4fdb8a7318502d44d62b90fa4f81cf9d5856328bc6c7160dd60b58'
  checksumType  = 'sha256'
  checksum64    = 'c032c9b1b1aa3c219791a60eecc5ed6006ac4b76ce5bab6bd7a465952e4fb631'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
