<# 
-= Push =-

Assumes 

1) You have configured your choco API key like below - see https://chocolatey.org/account
choco apiKey -k aaaabbbbb-cccc-dddd-eeee-ffffffeeeefff -source https://chocolatey.org/

2) You have setup OneGet (Powershell 5) with chocolatey source
PS> Get-PackageSource -Provider chocolatey

#>

$packageNamesToIgnore = @("agent-ransack");
$artifactsFolder = "$PSScriptRoot/.artifacts"

$packages = Get-ChildItem "$artifactsFolder" -Filter *.nupkg
foreach($package in $packages) 
{
    
    $isMatch = $package.Name -match '(?<name>[\D-]*)\.(?<version>\d+(?:\.\d+){0,3}).nupkg'; 
    
    $packageName = $matches['name']
    $packageVersion = $matches['version']

    if ($packageNamesToIgnore.Contains($packageName))
    {
        Write-Host "$packageName is on the ignore list"
        continue;
    }

    Write-Host "$package parsed as '$packageName', '$packageVersion'"

    $publishedVersion = (Find-Package -name "$packageName" -provider Chocolatey -RequiredVersion "$packageVersion").Version

    Write-Host "$packageName is published at $publishedVersion"

    if ($publishedVersion -eq $null)
    {
        Write-Host "We need to push"
        #choco push "$artifactsFolder\$package.Name"
    }

    if (($publishedVersion -ne $null) -and ($packageVersion > $publishedVersion))
    {
        Write-Host "!!!!!!!!!!!!!!!!!!!!! PUSH"
    }

}