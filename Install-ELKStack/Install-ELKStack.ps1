 function Test-PowershellVersion {
    if ($(Get-Host ).Version.Major -lt 5) {
        Write-Host "Install Windows Management Framework 5"
        exit
    }
}

function Install-cChoco {
    if (![ bool]($( Get-Module | Select-Object -Property Name ) -match "cChoco")) {
        Write-Host "Installing cChoco module."
		Install-PackageProvider -Name NuGet -Force
		Find-Module -Name cChoco
        Install-Module cChoco -Force
        Import-Module cChoco
        Write-Host "cChoco module installed."
    }
    else {
        Write-Host "cChoco module already installed."
    }
}

function Install-Carbon {
    if (![ bool]($( Get-Module | Select-Object -Property Name ) -match "carbon")) {
        Write-Host "Installing Carbon module."
		Install-PackageProvider -Name NuGet -Force
		Find-Module -Name Carbon
        Install-Module Carbon -Force
        Import-Module Carbon
        Write-Host "Carbon module installed."
    }
    else {
        Write-Host "Carbon module already installed."
    }
}

function Set-WSManResponsePacketSize {
    $CurrentResponsePacketSize = [int ]$(Get-Item WSMan:\localhost\MaxEnvelopeSizekb ).Value
    $RequiredResponsePacketSize = 2048

    if ($CurrentResponsePacketSize -lt $RequiredResponsePacketSize) {
        Set-Item WSMan:\localhost\MaxEnvelopeSizekb $RequiredResponsePacketSize
    }
}

Test-PowershellVersion

Install-cChoco

Set-WSManResponsePacketSize

$Node = $env:COMPUTERNAME + "." + $env:USERDNSDOMAIN

Invoke-Expression $(Join-Path $PSScriptRoot Set-ELKDSCConfiguration.ps1)

Start-DscConfiguration -ComputerName $Node -Wait -Verbose -Path $(Join-Path $pwd ELKStackDSC\) -Force

ForEach ($ELKService In $(Get-Service -Name elastic*,logstash*,kibana*).Name) {
    Grant-ServiceControlPermission -ServiceName $ELKService -Identity "Domain Users"
}