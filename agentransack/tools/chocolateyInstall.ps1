$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3499/agentransack_x86_msi_3499.zip'
$url64      = 'https://download.mythicsoft.com/flp/3499/agentransack_x64_msi_3499.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3499.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3499.msi'

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
  checksum      = '194eb20b216f5fae2c33366e19ec9b7048b0264bb1cef70ad51e642cd5cb2900'
  checksumType  = 'sha256'
  checksum64    = '44cfc8877cc416e8c184893a106799b8b47a97ac54e7b284a0d917be18e655a9'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
