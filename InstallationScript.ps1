Install-Module -Name AWS.Tools.Lightsail 

#create a new windows lightsail instances
New-LSInstance -InstanceName 'webserver1' -AvailabilityZone 'us-east-1a' -BlueprintId 'windows_server_2019' -BundleId 'medium_win_2_0' -UserData '
<powershell>
Install-WindowsFeature Web-Server
Install-WindowsFeature Web-Mgmt-Tools
Install-WindowsFeature Web-Asp-NET45
</powershell>'

New-LSInstance -InstanceName 'dbserver' -AvailabilityZone 'us-east-1a' -BlueprintId 'windows_server_2016_sql_2016_express' -BundleId 'medium_win_2_0'

while((Get-LSInstanceState -InstanceName 'webserver1' -Select 'State.Code') -ne 16)
{
  Write-Host 'wait for instances to run'
  Start-Sleep -Seconds 1
}

while((Get-LSInstanceState -InstanceName 'dbserver' -Select 'State.Code') -ne 16)
{
  Write-Host 'wait for instances to run'
  Start-Sleep -Seconds 1
}

Write-Host 'instances are running'

Get-LSInstance -InstanceName 'webserver1'
Get-LSInstance -InstanceName 'dbserver'