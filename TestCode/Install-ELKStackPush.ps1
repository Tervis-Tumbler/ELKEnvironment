$Node = Read-Host "Enter node's FQDN: "

Configuration ELKStackDSC
{
    
    param (
        [string[]]$ComputerName = 'localhost'
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
      }
      cChocoPackageInstaller installLogstash
      {
        Name = "logstash"
        DependsOn = "[cChocoPackageInstaller]installElasticsearch"
      }
      <#
      cChocoPackageInstaller installKibana
      {
        Name = "kibana"
        DependsOn = "[cChocoPackageInstaller]installElasticsearch"
      }
      #>
    }
}

ELKStackDSC -ComputerName $Node

# Use the following for adding the configuration to the pull server:

<#

$guid = [guid]::NewGuid()
$srcDir = "c:\ELKStackDSC\"
$srcMOF = "$Node.mof"
$destDir = "$env:ProgramFiles\windowspowershell\dscservice\configuration\"
$destMOF = "$guid.mof"
copy $srcDir+$srcMOF $destDir+$destMOF
New-DscChecksum $destDir+$destMOF
#>

Start-DscConfiguration -ComputerName $Node -Wait -Verbose -Path ELKStackDSC\ -Force