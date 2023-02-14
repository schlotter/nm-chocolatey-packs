$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3367/agentransack_x86_msi_3367.zip'
$url64      = 'https://download.mythicsoft.com/flp/3367/agentransack_x64_msi_3367.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3367.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3367.msi'

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
  checksum      = 'fa10ef357fa94674c75ac600d036a43559889eb046f6959ae9c5e9f321f4f984'
  checksumType  = 'sha256'
  checksum64    = 'f2ab079a406c37404f330e50a8acf672b8e47332d138790754cc2d0796fdaab2'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
