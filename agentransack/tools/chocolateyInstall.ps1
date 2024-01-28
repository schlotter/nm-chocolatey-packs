$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3420/agentransack_x86_msi_3420.zip'
$url64      = 'https://download.mythicsoft.com/flp/3420/agentransack_x64_msi_3420.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3420.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3420.msi'

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
  checksum      = '654151a23f388d72e64dc274a60c145a75c0fd68dcada3246b313d402cae39e7'
  checksumType  = 'sha256'
  checksum64    = '6277a68d8adb4eb47e0389a6b0540ce99a9fc12bb6f21f42731524216072cc3a'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
