function SQLDashboard-Service{
  
    $SQLServers=get-content C:\SQLDashboard\SQLServers.txt
    foreach($SQLServer in $SQLServers){
	$services=@()
        $services=Get-Service -Computer $SQLServer  | Where-Object{$_.DisplayName -like '*SQL Server*'} | select Name,Status
        foreach($service in $services){
             $ServiceName=$service.name
             $serviceStatus=$service.Status
            
$insertQuery="sp_SQLServices '$SQLServer','$ServiceName','$serviceStatus'"

  try{
             invoke-sqlcmd -Query $insertQuery -ServerInstance localhost -Database SQLDashboard
 }
    catch{
        "Error"
             }
        }
   
    }
}

SQLDashboard-Service
