$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3517/agentransack_x86_msi_3517.zip'
$url64      = 'https://download.mythicsoft.com/flp/3517/agentransack_x64_msi_3517.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3517.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3517.msi'

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
  checksum      = '972dff9faa42c1771279b13976bae0825b6f3583400a28bcb28a98e71abcd77f'
  checksumType  = 'sha256'
  checksum64    = '98577db3b1087c42c46768748a1e815d2a51a225f8dcb1876e86b305d1ffaa9b'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
