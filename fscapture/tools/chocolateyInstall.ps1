$ErrorActionPreference = 'Stop';

$packageName= 'fscapture'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'http://www.faststonesoft.net/DN/FSCaptureSetup102.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url

  silentArgs 	= "/S"

  softwareName  = 'FastStone Image Capture'
  checksum      = '7C8B8488BADE84660C421B42BF82E63AECD0DD1D'
  checksumType  = 'sha1'
}

Install-ChocolateyPackage @packageArgs
