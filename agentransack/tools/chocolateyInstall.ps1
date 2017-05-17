$ErrorActionPreference = 'Stop';

#cinst checksum
#checksum -t=sha1 AgentRansack_nnn.exe

#test with:
#cinst agentransack.8.0.867.0.nupkg --force

$packageName= 'AgentRansack'
$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        = 'https://download.mythicsoft.com/ar/867/AgentRansack_867.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'EXE'
  url           = $url

  silentArgs 	= ""

  softwareName  = 'AgentRansack'
  checksum      = '6AF2115B473FDE77A9DC958DE4FF730EB25810EA'
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
