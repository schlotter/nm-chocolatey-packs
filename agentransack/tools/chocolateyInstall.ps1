$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3544/agentransack_x86_msi_3544.zip'
$url64      = 'https://download.mythicsoft.com/flp/3544/agentransack_x64_msi_3544.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3544.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3544.msi'

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
  checksum      = '09155a4b3446955c4a6b0a7ee68b0ddc0c11e56efe495452ff9200dcd42487c5'
  checksumType  = 'sha256'
  checksum64    = 'f3524cd4b121da21758a78fd438204d921c3e05e87e91261accaaa4e1a7c9809'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
