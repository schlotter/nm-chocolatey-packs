$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3503/agentransack_x86_msi_3503.zip'
$url64      = 'https://download.mythicsoft.com/flp/3503/agentransack_x64_msi_3503.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3503.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3503.msi'

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
  checksum      = 'c92a2b3fd2478732856b63409a3bd9a110f1745e5f3d953c7f03994357b48bd1'
  checksumType  = 'sha256'
  checksum64    = 'a40b42a2e06e88e5573893dba6d0f13754a513670150172185fee0e56d449a79'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
