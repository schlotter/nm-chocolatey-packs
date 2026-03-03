$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/3555/wzn-fyf5-HDG-mgW/agentransack_x86_msi_3555.zip'
$url64      = 'https://download.mythicsoft.com/flp/3555/wzn-fyf5-HDG-mgW/agentransack_x64_msi_3555.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3555.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3555.msi'

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
  checksum      = 'fd62cecfe2ad7767116917f525a5e6f99327bb1e40d04de3b6c5c4f23ced664f'
  checksumType  = 'sha256'
  checksum64    = 'c78bd72c85071a5bde5016b42a57ed17ecb8218a807c9d8ab30fd0657f2ead5a'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
