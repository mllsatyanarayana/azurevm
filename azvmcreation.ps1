$AppId=$ENV:AZURE_CLIENT_ID
$TenantId=$ENV:AZURE_TENANT_ID
$clientsecret=$ENV:AZURE_CLIENT_SECRET
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $AppId,$clientsecret  
Connect-AzAccount -ServicePrincipal  -Tenant $TenantId -Credential 
  
start-sleep 10 -verbose 
  

$username="satya"
$paswords= ConvertTo-SecureString 'Welcome$9' -AsPlainText -Force 
$vmcred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username,$paswords

  $vmParams = @{
  ResourceGroupName = 'RG1'
  Name = "jumpbox2"
  Location = 'eastus'
  ImageName = 'Win2016Datacenter'
  PublicIpAddressName = 'JumPublicIp'
  Credential = $vmcred
  OpenPorts = 3389
  Size = 'Standard_D2s_v3'
}
$newVM1 = New-AzVM @vmParams -Verbose
