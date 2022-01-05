# SQLDashboard

The SSRS Reports will help DBA to monitor the SQL Servers

**Reports Hosted So Far:**

**SQL Server Service Status** - Status of all the services contain the keyword "sql" running on Servers that is being collected and stored in a centralised database. 
SSRS Report fetch the data from cetralised SQL Server. Report is being refreshed in every 5 seconds. Service status is being updated according to the Powershell script scheduled in Windows Task Scheduler.

**Pre-requisits:**

SQL Server

SSRS

**How to Install:**

•	Download the Zip

•	Extract Zip file

•	Open SQLServers.txt file and enter server names. One server name per line.

•	Install table /proc on centralised SQL Server 

      DBADumpDB_Table_SQLServices.sql 

      DBADumpDB_Proc_sp_SQLServices.sql

•	Open DBADump-GetServiceStatus.PS1

•	Update Parameters at the end of the file.

DBADump-GetServiceStatus -ServerList 'C:\SQLDashboard\SQLServers.txt' -DBADumpServer localhost -DBADumpDB DBADumpDB

      ServerList - Where all the servers are listed in your environment here.

      DBADumpServer - The centralised server to store the data

      DBADumpServer - The centralised database to store data.

•	Schedule DBADump-GetServiceStatus.PS1 to run in Windows Task Scheduler.

                  
              Action : Start a program
              Program/Script : Powershell.exe
              Add Arguments : -ExecutionPolicy Bypass -File C:\Users\Name\Desktop\Dashboard\SQLDashboard-main\SQLDashboard-main\DBADump-GetServiceStatus.PS1
                  
•	It is recommended to run it in every 1 min.

•	Open SSRS Report server (Eg:  http://localhost/Reports)

•	Upload SQL Service Status.rdl file
•	Open the Report and monitor the service status
