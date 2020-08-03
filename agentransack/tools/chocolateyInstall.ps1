$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha1 AgentRansack_x86_nnnn.zip
#checksum -t=sha1 AgentRansack_x64_nnnn.zip

#test with:
#cinst agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/flp/2946/agentransack_x86_msi_2946.zip'
$url64      = 'https://download.mythicsoft.com/flp/2946/agentransack_x64_msi_2946.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_2946.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_2946.msi'

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
  checksum      = '2ADB1DAB259D46D4EA3F3D501D51A310E94A9170'
  checksumType  = 'sha1'
  checksum64    = 'C1680147B47F4890DB30E06A16DDB7953CDE7C61'
  checksumType64= 'sha1'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
