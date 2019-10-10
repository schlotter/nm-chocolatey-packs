$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha1 AgentRansack_x86_nnnn.zip
#checksum -t=sha1 AgentRansack_x64_nnnn.zip

#test with:
#cinst agentransack.2019.2929.nupkg --force

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/2929/agentransack_x86_msi_2929.zip'
$url64      = 'https://download.mythicsoft.com/flp/2929/agentransack_x64_msi_2929.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_2929.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_2929.msi'

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
  checksum      = 'CF9DC1E831DA98AB04B802EF8C4D486F08E4F2B4'
  checksumType  = 'sha1'
  checksum64    = '20265BD24EA276D60A18B001AD1D96D792437A9A'
  checksumType64= 'sha1'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
