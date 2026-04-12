$ErrorActionPreference = 'Stop';

#choco install checksum
#checksum -t=sha256 AgentRansack_x86_msi_nnnn.zip
#checksum -t=sha256 AgentRansack_x64_msi_nnnn.zip

#test with (depending if already installed):
#choco install agentransack -s .
#choco upgrade agentransack -s .

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
#download links can be found at https://www.mythicsoft.com/agentransack/download/
$url        = 'https://download.mythicsoft.com/flp/3560/fdw_mxj9ech.XJB7zwt/agentransack_x86_msi_3560.zip'
$url64      = 'https://download.mythicsoft.com/flp/3560/fdw_mxj9ech.XJB7zwt/agentransack_x64_msi_3560.zip'
$fileLocation = Join-Path $toolsDir 'agentransack_x86_3560.msi'
$fileLocation64 = Join-Path $toolsDir 'agentransack_x64_3560.msi'

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
  checksum      = '232dd30c351f57f08543b9d7aeac62ab83dc0502b76ddc094adec9876340538e'
  checksumType  = 'sha256'
  checksum64    = 'fc330ac638474dc46465735fc2e3a9edcb324c083cddb6d14886d0efc31c759b'
  checksumType64= 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyInstallPackage @packageArgs
