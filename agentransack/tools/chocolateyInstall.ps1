$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3389/agentransack_x86_msi_3389.zip'
$url64      = 'https://download.mythicsoft.com/flp/3389/agentransack_x64_msi_3389.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3389.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3389.msi'

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
  checksum      = 'A0667CBC13688288F54F420C5C9AA4A6DC8D2208D58193350DEE61352F185D65'
  checksumType  = 'sha256'
  checksum64    = 'C9052951C547990354DA2616581D5646F62D83081668A4BA3580361A68DAFAAC'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
