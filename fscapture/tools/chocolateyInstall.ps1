$ErrorActionPreference = 'Stop';

$packageName= 'fscapture'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://www.faststonesoft.net/DN/FSCaptureSetup104.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url

  silentArgs 	= "/S"

  softwareName  = 'FastStone Image Capture'
  checksum      = 'BD9D9ADB3BBA7C91CF2FC8F10539CEC57F2DDEE9'
  checksumType  = 'sha1'
}

Install-ChocolateyPackage @packageArgs
