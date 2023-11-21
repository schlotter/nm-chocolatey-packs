$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3416/agentransack_x86_msi_3416.zip'
$url64      = 'https://download.mythicsoft.com/flp/3416/agentransack_x64_msi_3416.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3416.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3416.msi'

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
  checksum      = '4BFFB17C5CE06D78508A39C58F11F26EE22F049A7875796484EBDA779D1407E9'
  checksumType  = 'sha256'
  checksum64    = '7227EDB88441C8F7386474A3C380B6B400B2EC7C55890164CF07F2F65682C75A'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
