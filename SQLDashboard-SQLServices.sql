USE [SQLDashboard]
GO

/****** Object:  Table [dbo].[SQLService]    Script Date: 17-12-2021 17:22:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SQLService](
	[RefreshDate] [datetime] NULL,
	[ServerName] [varchar](200) NULL,
	[ServiceName] [varchar](100) NULL,
	[ServiceStatus] [varchar](100) NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[SQLService] ADD  CONSTRAINT [DF_SQLService_RefreshDate]  DEFAULT (getdate()) FOR [RefreshDate]
GO


