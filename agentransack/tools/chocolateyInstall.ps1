$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3366/agentransack_x86_msi_3366.zip'
$url64      = 'https://download.mythicsoft.com/flp/3366/agentransack_x64_msi_3366.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3366.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3366.msi'

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
  checksum      = '7C421A5047802A7149A4A1CFC5E79C7F7DA55A4EB0A54D989EBAEC8D434527B3'
  checksumType  = 'sha256'
  checksum64    = '98C70218E65D5AE9B3D4646FB5B42441FCA275460EFC6EAE5B24B422F8E835E0'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
