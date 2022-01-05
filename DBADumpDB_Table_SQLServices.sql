--Create Database DBADumpDB if not exist
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'DBADumpDB')
BEGIN
     CREATE DATABASE DBADumpDB
	END
	GO
	USE DBADumpDB
	 --Create SQLServices table to store Service status data
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SQLServices]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[SQLServices](
	[RefreshDate] [datetime] NULL,
	[ServerName] [varchar](200) NULL,
	[ServiceName] [varchar](100) NULL,
	[ServiceStatus] [varchar](100) NULL
) ON [PRIMARY]
ALTER TABLE [dbo].[SQLServices] ADD  CONSTRAINT [DF_SQLService_RefreshDate]  DEFAULT (getdate()) FOR [RefreshDate]
END


