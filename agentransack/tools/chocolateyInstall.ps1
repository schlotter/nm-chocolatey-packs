$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha1 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha1 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3314/agentransack_x86_msi_3314.zip'
$url64      = 'https://download.mythicsoft.com/flp/3314/agentransack_x64_msi_3314.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3314.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3314.msi'

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
  checksum      = '488036CCA999ED7A30ED71E1764565DDA58EB75F'
  checksumType  = 'sha1'
  checksum64    = '04BE914A482DC2648D64B1E42732C2DF0DB5E39B'
  checksumType64= 'sha1'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
