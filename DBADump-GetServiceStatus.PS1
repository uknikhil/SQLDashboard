function DBADump-GetServiceStatus{
	
	Param(
	$ServerList,
	$DBADumpServer,
	$DBADumpDB
	)
    $SQLServers=get-content $serverlist
    foreach($SQLServer in $SQLServers){
	$services=@()
        $services=Get-Service -Computer $SQLServer  | Where-Object{$_.DisplayName -like '*SQL Server*' -and $_.StartType -ne 'Disabled'} | select Name,Status
        foreach($service in $services){
             $ServiceName=$service.name
             $serviceStatus=$service.Status
            
$insertQuery="sp_SQLServices '$SQLServer','$ServiceName','$serviceStatus'"

  try{
             invoke-sqlcmd -Query $insertQuery -ServerInstance $DBADumpServer -Database $DBADumpDB
 }
    catch{
        "Error"
             }
        }
  } 

}

DBADump-GetServiceStatus -ServerList 'C:\SQLDashboard\SQLServers.txt' -DBADumpServer localhost -DBADumpDB DBADumpDB
