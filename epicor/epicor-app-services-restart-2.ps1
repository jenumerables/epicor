Write-Output "Stopping Task Agent ...."
& 'C:\Program Files (x86)\Common Files\Epicor Software\Application Server Manager Extensions\3.2.300\TaskAgentConfiguration\TaskAgentServiceConfiguration.exe' /Action="stopagent" /agentname="TaskAgentServiceConfiguration.exe" /SiteName="EpicorERPTest" /configfile="C:\Users\[USERNAME]\Desktop\Epicor-Restart-App-Serverice-Program\app-config.xml" /createnewlog="NO" /loglevel="W"
Start-Sleep -s 10

$applicationPoolName = 'EpicorERPTest'

if((Get-WebAppPoolState -Name $applicationPoolName).Value -ne 'Stopped'){
    Write-Output ('Stopping Application Pool: {0}' -f $applicationPoolName)
    Stop-WebAppPool -Name $applicationPoolName
}
elseif((Get-WebAppPoolState -Name $applicationPoolName).Value -ne 'Started'){
    Write-Output ('Starting Application Pool: {0}' -f $applicationPoolName)
    Stop-WebAppPool -Name $applicationPoolName
}

Start-Sleep -s 30

Write-Output "Starting Application Pool ..."
Start-WebAppPool -Name "EpicorERPTest"

Start-Sleep -s 30

Write-Output "Starting Task Agent ...."
& 'C:\Program Files (x86)\Common Files\Epicor Software\Application Server Manager Extensions\3.2.300\TaskAgentConfiguration\TaskAgentServiceConfiguration.exe' /Action="startagent" /agentname="TaskAgentServiceConfiguration.exe" /SiteName="EpicorERPTest" /configfile="C:\Users\[USERNAME]\Desktop\Epicor-Restart-App-Serverice-Program\app-config.xml" /createnewlog="NO" /loglevel="W"
