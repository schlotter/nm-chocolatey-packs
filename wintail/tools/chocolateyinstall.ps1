$ErrorActionPreference = 'Stop';

$url = 'http://www.baremetalsoft.com/wintail/download.php?p=p'  
$destination = "$env:ChocolateyInstall\lib\wintail\wintail.exe"

Get-WebFile -url $url -filename $destination
Install-ChocolateyShortcut -TargetPath $destination -ShortcutFilePath "$env:appdata\Microsoft\Windows\SendTo\WinTail.lnk"