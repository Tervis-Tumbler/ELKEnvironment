Configuration ELKStackDSC {
   
    param (
        #[string[]]$ComputerName = $env:COMPUTERNAME + "." + $env:USERDNSDOMAIN
        [string[]] $ComputerName
    )

   Import-DscResource -ModuleName cChoco

   Node $ComputerName {
      
      LocalConfigurationManager {
        DebugMode = 'ForceModuleImport'
      }

      cChocoInstaller installChoco {
        InstallDir = "c:\choco"
      }

      <#

      cChocoPackageInstaller installNSSM {
        Name = "nssm"
        DependsOn = "[cChocoInstaller]installChoco"
        Version = "2.24.0"
      }

      cChocoPackageInstaller installJava {
        Name = "jdk8"
        DependsOn = "[cChocoInstaller]installChoco"
        Version = ""
      }

      #>

      cChocoPackageInstaller installElasticsearch {
        Name = "elasticsearch"
        #DependsOn = "[cChocoPackageInstaller]installJava"
        Version = "2.3.1"

      }

      cChocoPackageInstaller installLogstash {
        Name = "logstash"
        DependsOn = "[cChocoPackageInstaller]installElasticsearch"
        Version = "2.3.1"
      }
     
      cChocoPackageInstaller installKibana {
        Name = "kibana"
        Version = "4.5.0"
        DependsOn = "[cChocoPackageInstaller]installElasticsearch"
      }

      Script SetJavaHomeVariable {
        GetScript = {
            @{"JAVA_HOME"="$env:JAVA_HOME"}
        }

        SetScript = {
            $JavaInstallPath = Join-Path $env:ProgramFiles java
            $JavaVersion = Get-ChildItem -Path $JavaInstallPath -Name jdk* | Select-Object -Last 1
            & cmd.exe /c setx /M JAVA_HOME $(Join-Path $JavaInstallPath $JavaVersion)

        }

        TestScript = {
            if ($env:JAVA_HOME -ne $null) {
                return $true
            }
            else {
                return $false
            }
        }
      }

        Script InstallElasticsearchService {
        GetScript = {
            @{"Elastic Service Status"="$(Get-Service -Name elasticsearch-service-x64).Status"}
        }

        SetScript = {
            $JavaInstallPath = Join-Path $env:ProgramFiles Java            $JavaVersion = Get-ChildItem -Path $JavaInstallPath -Name jdk* | Select-Object -Last 1            $ServiceInstallCommand = "c:\choco\lib\elasticsearch\tools\elasticsearch-2.3.1\bin\service.bat install"            $InstallCommand = "set JAVA_HOME=$(Join-Path $JavaInstallPath $JavaVersion)&&$ServiceInstallCommand"            & cmd.exe /C $InstallCommand

        }

        TestScript = {
            $ElasticSearchService = Get-Service -Name elasticsearch-service* -ErrorAction SilentlyContinue
            if ($ElasticSearchService -ne $null) {
                return $true
            }
            else {
                return $false
            }
        }
      }
 
    }
}

ELKStackDSC -ComputerName $Node