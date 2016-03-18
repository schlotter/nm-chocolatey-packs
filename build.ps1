Write-Host "-=Build all chocolatey packs=-"

$nuspecs = Get-ChildItem -Path $PSScriptRoot -Filter *.nuspec -Recurse
Foreach($nuspec in $nuspecs){
    choco pack $nuspec.FullName
}