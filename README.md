# ELKEnvironment
Assets to reproducibly setup Elasticsearch Logstash and Kibana

Process:

	1. Get specific ELK components online (nu-get)
		1. elasticsearch-2.1.0
			1. http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-2.1.0.zip

		2. kibana-4.3.0-windows
			1. http://download.elasticsearch.org/kibana/kibana/kibana-4.3.0-windows.zip

		3. logstash-2.1.1
			1. http://download.elasticsearch.org/logstash/logstash/logstash-2.1.1.zip

		4. nssm-2.24
			1. http://nssm.cc/download/nssm-2.24.zip
			2. \nssm-2.24\win64\nssm.exe

		5. jdk-8u25-windows-x64

	2. Set up Java Development Kit 8 update 25
		1. $jdk-package install-silent=1

	3. Set JAVA_HOME environmental variable.
		1. C:\Program Files\Java\jdk1.8.0_25
		2. Set through registry edit

	4. Install Elasticsearch service through .bat file (service install)
	5. Install Logstash with NSSM (nssm install Logstash)
		1. Create run.bat
			1. logstash.bat agent -f logstash.conf

		2. Add logstash.conf file

	6. Install Kibana with NSSM (nssm install Kibana)
	7. Create Firewall rule for Kibana (Port 5601)



$url="http://download.elasticsearch.org/logstash/logstash/logstash-2.1.1.zip"
$package_name = 'logstash'
$service_name = "Logstash"
$package_dir="c:\${package_name}"


Java Download URL
$build = '15'
$jdk_version = '7u79'
$arch = 'x64' 
$filename = "jdk-$jdk_version-windows- $arch.exe"
$url = "http://download.oracle.com/otn-pub/java/jdk/ $jdk_version-b$build /$filename"


Registry Values:

Enviroment Variable:
HKLM\SYSTEM\ControlSet001\Control\Session Manager\Environment\JAVA_HOME: "c:\Program Files\Java\jdk1.8.0_25"
HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment\JAVA_HOME: "c:\Program Files\Java\jdk1.8.0_25"



ElasticSearch Service:
----------------------------------
Keys added:12
----------------------------------
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Java
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Log
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Start
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Stop
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\Parameters
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\Parameters

----------------------------------
Values added:36
----------------------------------
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Stop\Class: "org.elasticsearch.bootstrap.Elasticsearch"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Stop\Method: "close"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Stop\Mode: "jvm"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Stop\Timeout: 0x00000000
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Start\WorkingPath: "C:\ELK\elasticsearch-2.1.0"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Start\Class: "org.elasticsearch.bootstrap.Elasticsearch"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Start\Params: 'start'
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Start\Method: "main"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Start\Mode: "jvm"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Log\Path: "C:\ELK\elasticsearch-2.1.0\logs"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Log\Prefix: "elasticsearch-service-x64"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Log\StdError: "auto"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Log\StdOutput: "auto"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Log\PidFile: "elasticsearch-service-x64.pid"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Java\Jvm: "c:\Program Files\Java\jdk1.8.0_25\jre\bin\server\jvm.dll"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Java\Options: '-XX:+UseParNewGC -Xms256m -Xmx1g -Djava.awt.headless=true -XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError -XX:+DisableExplicitGC -Dfile.encoding=UTF-8 -Djna.nosys=true -Delasticsearch -Des.path.home=C:\ELK\elasticsearch-2.1.0 -Des.default.path.home=C:\ELK\elasticsearch-2.1.0 -Des.default.path.logs=C:\ELK\elasticsearch-2.1.0\logs -Des.default.path.data=C:\ELK\elasticsearch-2.1.0\data -Des.default.path.conf=C:\ELK\elasticsearch-2.1.0\config'
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Java\Classpath: "C:\ELK\elasticsearch-2.1.0/lib/elasticsearch-2.1.0.jar;C:\ELK\elasticsearch-2.1.0/lib/*"
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Java\JvmMs: 0x00000100
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Java\JvmMx: 0x00000400
HKLM\SOFTWARE\Wow6432Node\Apache Software Foundation\Procrun 2.0\elasticsearch-service-x64\Parameters\Java\JvmSs: 0x00000100
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\Type: 0x00000010
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\Start: 0x00000003
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\ErrorControl: 0x00000001
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\ImagePath: "C:\ELK\elasticsearch-2.1.0\bin\elasticsearch-service-x64.exe //RS//elasticsearch-service-x64"
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\DisplayName: "Elasticsearch 2.1.0 (elasticsearch-service-x64)"
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\DependOnService: 'Tcpip Afd'
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\ObjectName: "LocalSystem"
HKLM\SYSTEM\ControlSet001\Services\elasticsearch-service-x64\Description: "Elasticsearch 2.1.0 Windows Service - http://elasticsearch.org"
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\Type: 0x00000010
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\Start: 0x00000003
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\ErrorControl: 0x00000001
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\ImagePath: "C:\ELK\elasticsearch-2.1.0\bin\elasticsearch-service-x64.exe //RS//elasticsearch-service-x64"
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\DisplayName: "Elasticsearch 2.1.0 (elasticsearch-service-x64)"
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\DependOnService: 'Tcpip Afd'
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\ObjectName: "LocalSystem"
HKLM\SYSTEM\CurrentControlSet\Services\elasticsearch-service-x64\Description: "Elasticsearch 2.1.0 Windows Service - http://elasticsearch.org"



Logstash Service:
----------------------------------
Keys added:6
----------------------------------
HKLM\SYSTEM\ControlSet001\Services\logstash
HKLM\SYSTEM\ControlSet001\Services\logstash\Parameters
HKLM\SYSTEM\ControlSet001\Services\logstash\Parameters\AppExit
HKLM\SYSTEM\CurrentControlSet\Services\logstash
HKLM\SYSTEM\CurrentControlSet\Services\logstash\Parameters
HKLM\SYSTEM\CurrentControlSet\Services\logstash\Parameters\AppExit

----------------------------------
Values added:26
----------------------------------
HKLM\SYSTEM\ControlSet001\Services\logstash\Parameters\AppExit\: "Restart"
HKLM\SYSTEM\ControlSet001\Services\logstash\Parameters\Application: "C:\ELK\logstash-2.1.1\bin\run.bat"
HKLM\SYSTEM\ControlSet001\Services\logstash\Parameters\AppParameters: ""
HKLM\SYSTEM\ControlSet001\Services\logstash\Parameters\AppDirectory: "C:\ELK\logstash-2.1.1\bin"
HKLM\SYSTEM\ControlSet001\Services\logstash\Type: 0x00000010
HKLM\SYSTEM\ControlSet001\Services\logstash\Start: 0x00000002
HKLM\SYSTEM\ControlSet001\Services\logstash\ErrorControl: 0x00000001
HKLM\SYSTEM\ControlSet001\Services\logstash\ImagePath: "C:\nssm.exe"
HKLM\SYSTEM\ControlSet001\Services\logstash\DisplayName: "Logstash"
HKLM\SYSTEM\ControlSet001\Services\logstash\ObjectName: "LocalSystem"
HKLM\SYSTEM\ControlSet001\Services\logstash\DependOnService: 'elasticsearch-service-x64'
HKLM\SYSTEM\ControlSet001\Services\logstash\DelayedAutostart: 0x00000000
HKLM\SYSTEM\ControlSet001\Services\logstash\FailureActionsOnNonCrashFailures: 0x00000001
HKLM\SYSTEM\CurrentControlSet\Services\logstash\Parameters\AppExit\: "Restart"
HKLM\SYSTEM\CurrentControlSet\Services\logstash\Parameters\Application: "C:\ELK\logstash-2.1.1\bin\run.bat"
HKLM\SYSTEM\CurrentControlSet\Services\logstash\Parameters\AppParameters: ""
HKLM\SYSTEM\CurrentControlSet\Services\logstash\Parameters\AppDirectory: "C:\ELK\logstash-2.1.1\bin"
HKLM\SYSTEM\CurrentControlSet\Services\logstash\Type: 0x00000010
HKLM\SYSTEM\CurrentControlSet\Services\logstash\Start: 0x00000002
HKLM\SYSTEM\CurrentControlSet\Services\logstash\ErrorControl: 0x00000001
HKLM\SYSTEM\CurrentControlSet\Services\logstash\ImagePath: "C:\nssm.exe"
HKLM\SYSTEM\CurrentControlSet\Services\logstash\DisplayName: "Logstash"
HKLM\SYSTEM\CurrentControlSet\Services\logstash\ObjectName: "LocalSystem"
HKLM\SYSTEM\CurrentControlSet\Services\logstash\DependOnService: 'elasticsearch-service-x64'
HKLM\SYSTEM\CurrentControlSet\Services\logstash\DelayedAutostart: 0x00000000
HKLM\SYSTEM\CurrentControlSet\Services\logstash\FailureActionsOnNonCrashFailures: 0x00000001



Kibana Service:
----------------------------------
Keys added:6
----------------------------------
HKLM\SYSTEM\ControlSet001\Services\kibana
HKLM\SYSTEM\ControlSet001\Services\kibana\Parameters
HKLM\SYSTEM\ControlSet001\Services\kibana\Parameters\AppExit
HKLM\SYSTEM\CurrentControlSet\Services\kibana
HKLM\SYSTEM\CurrentControlSet\Services\kibana\Parameters
HKLM\SYSTEM\CurrentControlSet\Services\kibana\Parameters\AppExit

----------------------------------
Values added:26
----------------------------------
HKLM\SYSTEM\ControlSet001\Services\kibana\Parameters\AppExit\: "Restart"
HKLM\SYSTEM\ControlSet001\Services\kibana\Parameters\Application: "C:\ELK\kibana-4.3.0-windows\bin\kibana.bat"
HKLM\SYSTEM\ControlSet001\Services\kibana\Parameters\AppParameters: ""
HKLM\SYSTEM\ControlSet001\Services\kibana\Parameters\AppDirectory: "C:\ELK\kibana-4.3.0-windows\bin"
HKLM\SYSTEM\ControlSet001\Services\kibana\Type: 0x00000010
HKLM\SYSTEM\ControlSet001\Services\kibana\Start: 0x00000002
HKLM\SYSTEM\ControlSet001\Services\kibana\ErrorControl: 0x00000001
HKLM\SYSTEM\ControlSet001\Services\kibana\ImagePath: "C:\nssm.exe"
HKLM\SYSTEM\ControlSet001\Services\kibana\DisplayName: "Kibana"
HKLM\SYSTEM\ControlSet001\Services\kibana\ObjectName: "LocalSystem"
HKLM\SYSTEM\ControlSet001\Services\kibana\DependOnService: 'elasticsearch-service-x64 logstash'
HKLM\SYSTEM\ControlSet001\Services\kibana\DelayedAutostart: 0x00000000
HKLM\SYSTEM\ControlSet001\Services\kibana\FailureActionsOnNonCrashFailures: 0x00000001
HKLM\SYSTEM\CurrentControlSet\Services\kibana\Parameters\AppExit\: "Restart"
HKLM\SYSTEM\CurrentControlSet\Services\kibana\Parameters\Application: "C:\ELK\kibana-4.3.0-windows\bin\kibana.bat"
HKLM\SYSTEM\CurrentControlSet\Services\kibana\Parameters\AppParameters: ""
HKLM\SYSTEM\CurrentControlSet\Services\kibana\Parameters\AppDirectory: "C:\ELK\kibana-4.3.0-windows\bin"
HKLM\SYSTEM\CurrentControlSet\Services\kibana\Type: 0x00000010
HKLM\SYSTEM\CurrentControlSet\Services\kibana\Start: 0x00000002
HKLM\SYSTEM\CurrentControlSet\Services\kibana\ErrorControl: 0x00000001
HKLM\SYSTEM\CurrentControlSet\Services\kibana\ImagePath: "C:\nssm.exe"
HKLM\SYSTEM\CurrentControlSet\Services\kibana\DisplayName: "Kibana"
HKLM\SYSTEM\CurrentControlSet\Services\kibana\ObjectName: "LocalSystem"
HKLM\SYSTEM\CurrentControlSet\Services\kibana\DependOnService: 'elasticsearch-service-x64 logstash'
HKLM\SYSTEM\CurrentControlSet\Services\kibana\DelayedAutostart: 0x00000000
HKLM\SYSTEM\CurrentControlSet\Services\kibana\FailureActionsOnNonCrashFailures: 0x00000001

https://www.ulyaoth.net/resources/tutorial-install-logstash-and-kibana-on-a-windows-server.34/
