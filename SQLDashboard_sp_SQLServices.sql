USE [SQLDashboard]
GO

/****** Object:  StoredProcedure [dbo].[sp_SQLServices]    Script Date: 12/19/2021 6:22:18 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

 
CREATE procedure [dbo].[sp_SQLServices]
@SQLServer nvarchar(100),
@ServiceName nvarchar(200),
@serviceStatus nvarchar(100)
AS
BEGIN
	If Exists(Select ServerName from SQLService where ServerName=@SQLServer and ServiceName=@ServiceName )
	begin
		update SQLService set ServiceStatus=@serviceStatus , RefreshDate=GETDATE() where ServerName=@SQLServer and ServiceName=@ServiceName
	end
	If not Exists(Select ServerName from SQLService where ServerName=@SQLServer and ServiceName=@ServiceName)
	begin
		insert into SQLService(ServerName,ServiceName,ServiceStatus)
		values(@SQLServer,@ServiceName, @serviceStatus)
	end

END
GO


