$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
#download links can be found at https://www.mythicsoft.com/agentransack/download/
$url        = 'https://download.mythicsoft.com/flp/3562/X4aef2vyu.bzx/agentransack_x86_msi_3562.zip'
$url64      = 'https://download.mythicsoft.com/flp/3562/X4aef2vyu.bzx/agentransack_x64_msi_3562.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3562.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3562.msi'

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
  checksum      = '4f2bcba8ea2c0d5f5ee53dc448302aac092d1e9576d6a3b6eacd6ff52abdc221'
  checksumType  = 'sha256'
  checksum64    = '0d79d8509500ee3144a87b374c962506fe3535479e072dde895a038e92bfadf7'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
