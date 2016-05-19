$build = '18'
$jdk_version = '8u25'
$arch = 'x64' 

# Helper function to properly download a given JDK version from Oracle
# Key for this to work is to set the Header Cookie Information
# Will only if it doesn't already exist on the local system
function download-from-oracle($url, $output_filename) {
        Write-Host  "`n`nDownloading JDK from $url`n"
 
        [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
        $client = New-Object Net.WebClient
        $client.Proxy = [System.Net.WebRequest]::DefaultWebProxy
        $client.Headers.Add('Cookie', 'gpw_e24=http://www.oracle.com; oraclelicense=accept-securebackup-cookie')
        $client.DownloadFile($url, "C:\$output_filename")
         
        Write-Host  "`n`nCompleted Downloading JDK from $url"

}

# Download the JDK version that we need.
function download-jdk() {
     
    $filename = "jdk-$jdk_version-windows-$arch.exe"
    $url = "http://download.oracle.com/otn-pub/java/jdk/$jdk_version-b$build/$filename"
    $output_filename = "$filename"
   
    download-from-oracle $url $output_filename
   
    return "C:\$output_filename"
}

$javaInstaller = download-jdk

#Write-Host "The installer is at $javaInstaller"


#Set-ExecutionPolicy -ExecutionPolicy Bypass

Write-Host "`n`nInstalling Java..."

#.\"$javaInstaller INSTALL_SILENT=1"

Start-Process $javaInstaller -ArgumentList "INSTALL_SILENT=1"

Write-Host "`n`nDone!"