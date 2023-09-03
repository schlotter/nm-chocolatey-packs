$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3406/agentransack_x86_msi_3406.zip'
$url64      = 'https://download.mythicsoft.com/flp/3406/agentransack_x64_msi_3406.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3406.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3406.msi'

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
  checksum      = '4FA1BA366309F7B6E97802AE7BADA408C5E34EFD00F73567DEFD2847D4E87083'
  checksumType  = 'sha256'
  checksum64    = '8E09B21B07E05BEA63B750B5B35149A9B67727E6B1A5F2768AA29EF380A6B300'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
