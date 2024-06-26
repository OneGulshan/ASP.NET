USE [ASPVBDB]
GO
/****** Object:  Table [dbo].[ProductInfo_Tab]    Script Date: 6/11/2024 8:17:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInfo_Tab](
	[ProductID] [int] NOT NULL,
	[ItemName] [nvarchar](50) NULL,
	[Specification] [nvarchar](100) NULL,
	[Unit] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[InsertDate] [date] NULL,
	[Opening] [float] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
