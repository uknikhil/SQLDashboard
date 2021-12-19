function SQLDashboard-Service{
    try{
    $SQLServers=get-content C:\SQLDashboard\SQLServers.txt
    foreach($SQLServer in $SQLServers){
        $services=Get-Service -Computer $SQLServer  | Where-Object{$_.DisplayName -like '*SQL Server*'} | select Name,Status
        foreach($service in $services){
             $ServiceName=$service.name
             $serviceStatus=$service.Status
            
$insertQuery="sp_SQLServices '$SQLServer','$ServiceName','$serviceStatus'"


             invoke-sqlcmd -Query $insertQuery -ServerInstance localhost -Database SQLDashboard
             }
        }
    }
    catch{
        "Error"
    }
}

SQLDashboard-Service
