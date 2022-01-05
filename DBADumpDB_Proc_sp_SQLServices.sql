USE [DBADumpDB]
GO

CREATE PROCEDURE [dbo].[sp_SQLServices]
@SQLServer nvarchar(100),
@ServiceName nvarchar(200),
@serviceStatus nvarchar(100)
AS
BEGIN

	If Exists(Select ServerName from SQLServices where ServerName=@SQLServer and ServiceName=@ServiceName )
	begin
		update SQLServices set ServiceStatus=@serviceStatus , RefreshDate=GETDATE() where ServerName=@SQLServer and ServiceName=@ServiceName
	end
	If not Exists(Select ServerName from SQLServices where ServerName=@SQLServer and ServiceName=@ServiceName)
	begin
		insert into SQLServices(ServerName,ServiceName,ServiceStatus)
		values(@SQLServer,@ServiceName, @serviceStatus)
	end

END
GO


