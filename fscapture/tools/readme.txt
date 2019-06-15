
curl -o FSCaptureSetup90.exe http://www.faststonesoft.net/DN/FSCaptureSetup90.exe

cinst checksum
checksum -t=sha1 FSCaptureSetup90.exe

choco pack fscapture.nuspec

# test with:
cinst fscapture.9.0.nupkg --force