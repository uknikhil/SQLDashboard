

function SQLDashboard-Service{
    try{
    $SQLServers=get-content C:\Users\Nikhil\Desktop\SQLDashboard\SQLServers.txt
    foreach($SQLServer in $SQLServers){
        $services=Get-Service -Computer $SQLServer  | Where-Object{$_.DisplayName -like '*SQL Server*'} | select Name,Status
        foreach($service in $services){
             $ServiceName=$service.name
             $serviceStatus=$service.Status
            # $insertQuery="insert into SQLService(ServerName,ServiceName,ServiceStatus) values('$SQLServer','$ServiceName',' $serviceStatus')"

$insertQuery="
            If Exists(Select ServerName from SQLService where ServerName='$SQLServer' and ServiceName='$ServiceName' )
begin
update SQLService set ServiceStatus='$serviceStatus' , RefreshDate=GETDATE() where ServerName='$SQLServer' and ServiceName='$ServiceName' 
end
If not Exists(Select ServerName from SQLService where ServerName='$SQLServer' and ServiceName='$ServiceName')
begin
insert into SQLService(ServerName,ServiceName,ServiceStatus)
values('$SQLServer','$ServiceName',' $serviceStatus')
end"



             invoke-sqlcmd -Query $insertQuery -ServerInstance localhost -Database SQLDashboard
             }
        }
    }
    catch{
        "Error"
    }
}

SQLDashboard-Service