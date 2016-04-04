$ErrorActionPreference = 'Stop';

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/ar/828/AgentRansack_828.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url

  silentArgs 	= ""

  softwareName  = 'AgentRansack'
  checksum      = 'adf11803e16b782eb1a437bb49bfb4fde82a5416'
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
