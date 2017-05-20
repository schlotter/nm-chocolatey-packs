$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha1 FSCaptureSetup85.exe

#test with:
#cinst fscapture.8.5.nupkg --force

$packageName= 'fscapture'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'http://www.faststonesoft.net/DN/FSCaptureSetup85.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url

  silentArgs 	= "/S"

  softwareName  = 'FastStone Image Capture'
  checksum      = 'B30A1D9C2DED7F914CEC4C65A0507FC294F193F0'
  checksumType  = 'sha1'
}

Install-ChocolateyPackage @packageArgs
