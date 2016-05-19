Configuration PullDemo {
    Node MEMBER2 {
        WindowsFeature Backup {
            Ensure = 'Present'
            Name = 'Windows-Server-Backup'
        }
    }
}

PullDemo


function New-ELKInstanceMOF {
    # Paramemters for creating MOF file
    param(
        $NewComputerName,

    )
    
    # Create MOF file
    configuration New-ELK {
        Node localhost {
            Script InstallJava {
                
                SetScript = {
                    $build = '18'
                    $jdk_version = '8u25'
                    $arch = 'x64' 

                    # Helper function to properly download a given JDK version from Oracle
                    # Key for this to work is to set the Header Cookie Information
                    # Will only if it doesn't already exist on the local system
                    function download-from-oracle($url, $output_filename) {
                            [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
                            $client = New-Object Net.WebClient
                            $client.Proxy = [System.Net.WebRequest]::DefaultWebProxy
                            $client.Headers.Add('Cookie', 'gpw_e24=http://www.oracle.com; oraclelicense=accept-securebackup-cookie')
                            $client.DownloadFile($url, "C:\$output_filename")
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

                    Start-Process $javaInstaller -ArgumentList "INSTALL_SILENT=1"
                }

                TestScript = {
                    Test-Path "C:\Program Files\Java\jdk1.8.0_25\bin\java.exe"
                }

                GetScript = {
                    return @{
                        JavaDirectory = "C:\Program Files\Java\jdk1.8.0_25\bin\java.exe"
                    }
                }

            }
            
            Enviroment SetJavaHome {
                Ensure = "Present"
                Name = "JAVA_HOME"
                Value = "c:\Program Files\Java\jdk1.8.0_25"

            
            }
            
        }
    }
    
}