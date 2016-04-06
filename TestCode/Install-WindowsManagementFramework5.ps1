Write-Host "Enabling PowerShell Remoting..."

Enable-PSRemoting -Force

Write-Host "Downloading Windows Management Framework 5..."

$WMF5Uri="https://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win8.1AndW2K12R2-KB3134758-x64.msu"
$WMF5msu="C:\WMF5.msu"

Invoke-WebRequest -Uri $WMF5Uri -OutFile $WMF5msu

Write-Host "Installing Windows Management Framework 5..."

&  wusa /install $WMF5msu  /quiet /forcerestart