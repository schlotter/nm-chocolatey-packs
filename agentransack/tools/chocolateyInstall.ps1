$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#cinst agentransack -s .
#cup agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3349/agentransack_x86_msi_3349.zip'
$url64      = 'https://download.mythicsoft.com/flp/3349/agentransack_x64_msi_3349.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3349.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3349.msi'

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
  checksum      = '137EAF02563A0EE3AACC5C78DC64F08D37DDED697BD0383650F0EB04CFDAF6E2'
  checksumType  = 'sha256'
  checksum64    = '8386BD1F76F47DFA64896356BA0D3CD2638B0663193F1FBFE05C1E67E7AAB9F8'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
