$guid = Read-Host "Enter GUID: "
$Node = Read-Host "Enter node's FQDN: "
$PullServer = Read-Host "Enter pull server's FQDN: "

Configuration SetPullMode
{
    param(
    [string]$guid,
    [string]$Node,
    [string]$PullServer
    )
    Node $Node
    {
        LocalConfigurationManager
        {
            ConfigurationMode = 'ApplyOnly'
            ConfigurationID = $guid
            RefreshMode = 'Pull'
            DownloadManagerName = 'WebDownloadManager'
            DownloadManagerCustomData = @{
                ServerUrl = "http://$PullServer`:8080/PSDSCPullServer.svc";
                AllowUnsecureConnection = 'true' }
        }
    }
}

SetPullMode -guid $guid -Node $Node -PullServer $PullServer
Set-DSCLocalConfigurationManager -Computer $Node -Path ./SetPullMode -Verbose