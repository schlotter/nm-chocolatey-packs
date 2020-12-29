$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha1 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha1 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/2951/agentransack_x86_msi_2951.zip'
$url64      = 'https://download.mythicsoft.com/flp/2951/agentransack_x64_msi_2951.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_2951.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_2951.msi'

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
  checksum      = '32AD45EF9981C32538C0D0A51EBB281FB4C40513'
  checksumType  = 'sha1'
  checksum64    = '8FBDFAE775905D5D8B0B87A529AAE1FE60B37B7C'
  checksumType64= 'sha1'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
