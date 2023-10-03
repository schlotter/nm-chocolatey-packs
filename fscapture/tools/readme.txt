
curl -o FSCaptureSetup102.exe http://www.faststonesoft.net/DN/FSCaptureSetup102.exe

cinst checksum
checksum -t=sha1 FSCaptureSetup102.exe

choco pack fscapture.nuspec

# test with:
cinst fscapture.10.2.nupkg --force
