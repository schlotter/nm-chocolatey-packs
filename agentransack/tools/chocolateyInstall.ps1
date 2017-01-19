$ErrorActionPreference = 'Stop';

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/ar/865/AgentRansack_865.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url

  silentArgs 	= ""

  softwareName  = 'AgentRansack'
  checksum      = '34953E0F48AB4E5D45F43D5AD50E9C00C25C7AD7'
  checksumType  = 'sha1'
}


$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "agent-ransack-install.ahk"
$ahkProc = Start-Process -FilePath $ahkExe `
                         -ArgumentList $ahkFile `
                         -PassThru

$ahkId = $ahkProc.Id
Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$ahkId"

Install-ChocolateyPackage @packageArgs
