

Configuration ELKStackDSC
{
   
    param (
        #[string[]]$ComputerName = $env:COMPUTERNAME + "." + $env:USERDNSDOMAIN
        [string[]] $ComputerName
    )

   Import-DscResource -ModuleName cChoco

   Node $ComputerName
   {
      LocalConfigurationManager
      {
        DebugMode = 'ForceModuleImport'
      }
      cChocoInstaller installChoco
      {
        InstallDir = "c:\choco"
      }
      cChocoPackageInstaller installNSSM
      {
        Name = "nssm"
        DependsOn = "[cChocoInstaller]installChoco"
        Version = "2.24.0"
      }
      cChocoPackageInstaller installJava
      {
        Name = "jdk8"
        DependsOn = "[cChocoInstaller]installChoco"
      }
      cChocoPackageInstaller installElasticsearch
      {
        Name = "elasticsearch"
        DependsOn = "[cChocoPackageInstaller]installJava"
        Version = "2.3.1"

      }
      cChocoPackageInstaller installLogstash
      {
        Name = "logstash"
        DependsOn = "[cChocoPackageInstaller]installElasticsearch"
        Version = "2.3.1"
      }
     
      cChocoPackageInstaller installKibana
      {
        Name = "kibana"
        Version = "4.5.0"
        DependsOn = "[cChocoPackageInstaller]installElasticsearch"
      }
 
    }
}

ELKStackDSC -ComputerName $Node
