$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3335/agentransack_x86_msi_3335.zip'
$url64      = 'https://download.mythicsoft.com/flp/3335/agentransack_x64_msi_3335.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3335.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3335.msi'

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
  checksum      = 'D3EA553EBD5EBB404CAAF9799C96EC4BB3F4CBDF435338E2220680B5547B4AC6'
  checksumType  = 'sha256'
  checksum64    = 'ED02B59D18767A8E2246CB120A69B972DD3C60430F84C769A9A0B025D82CFEAF'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
