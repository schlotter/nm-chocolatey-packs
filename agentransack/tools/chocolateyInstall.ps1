$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3522/agentransack_x86_msi_3522.zip'
$url64      = 'https://download.mythicsoft.com/flp/3522/agentransack_x64_msi_3522.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3522.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3522.msi'

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
  checksum      = '59cd396fb49c0451253672f9dca30c55a16d1134af1b39be864ab54c352cf303'
  checksumType  = 'sha256'
  checksum64    = '3c568ee9cdfb6aa69c9181d9f91c5b445c8271daa12e8e127fe87761b17286d7'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
