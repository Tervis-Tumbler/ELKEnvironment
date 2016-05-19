<#

Services did not run batch files successfully 

New-Service -Name "ELK_Logstash" -BinaryPathName "C:\ELK\logstash-2.1.1\bin\logstash.bat agent -f logstash.conf" -Description "The Logstash component of the ELK Stack." -DisplayName "ELK Stack: Logstash" -StartupType Automatic
New-Service -Name "ELK_Elasticsearch" -BinaryPathName "C:\ELK\elasticsearch-2.1.0\bin\elasticsearch.bat" -Description "The Elasticsearch component of the ELK Stack." -DisplayName "ELK Stack: Elasticsearch" -StartupType Automatic -DependsOn "ELK_Logstash"
New-Service -Name "ELK_Kibana" -BinaryPathName "C:\ELK\kibana-4.3.0-windows\bin\kibana.bat" -Description "The Kibana component of the ELK Stack." -DisplayName "ELK Stack: Kibana" -StartupType Automatic -DependsOn "ELK_Elasticsearch"

#>

<# 

Scheduled task example

$A = New-ScheduledTaskAction -Execute "Taskmgr.exe"
$T = New-ScheduledTaskTrigger -AtLogon
$P = "Contoso\Administrator"
$S = New-ScheduledTaskSettingsSet
$D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
Register-ScheduledTask T1 -InputObject $D

#>

<#

Notes:

C:\ELK\elasticsearch-2.1.0\bin\logstash.bat
C:\ELK\logstash-2.1.1\bin\elasticsearch.bat
C:\ELK\kibana-4.3.0-windows\bin\kibana.bat

#>

E_Dir


function Add-Numbers {
    
    $A = New-ScheduledTaskAction -Execute "$args[0]" 
    $T = New-ScheduledTaskTrigger -AtLogon
    $P = "Contoso\Administrator"
    $S = New-ScheduledTaskSettingsSet
    $D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
    Register-ScheduledTask T1 -InputObject $D

}

New-Service -Name "ELK_Logstash" -BinaryPathName "C:\ELK\logstash-2.1.1\bin\run.bat" -Description "The Logstash component of the ELK Stack." -DisplayName "ELK Stack: Logstash" -StartupType Automatic