$ErrorActionPreference = 'Stop';

$packageName= 'fscapture'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'http://www.faststonesoft.net/DN/FSCaptureSetup90.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url

  silentArgs 	= "/S"

  softwareName  = 'FastStone Image Capture'
  checksum      = 'AB3B0FDE4A162D81BD7D3520658B8F7DD95F7645'
  checksumType  = 'sha1'
}

Install-ChocolateyPackage @packageArgs
