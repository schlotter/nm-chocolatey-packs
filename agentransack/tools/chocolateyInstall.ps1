$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3341/agentransack_x86_msi_3341.zip'
$url64      = 'https://download.mythicsoft.com/flp/3341/agentransack_x64_msi_3341.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3341.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3341.msi'

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
  checksum      = '0120F17C4A089B131B24DFAFEF5225ED32026B88B19A0DA1EAA9588B0059808F'
  checksumType  = 'sha256'
  checksum64    = '681CD37A6193C8A2310ACFFB2155196CFB599EC45D9B7B5D037AB2BB6EFB9C55'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
