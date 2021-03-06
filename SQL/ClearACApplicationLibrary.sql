DROP TABLE [UPCCommon].[dbo].ApplicationUpdater
DROP TABLE [UPCCommon].[dbo].ApplicationFile_To_Endpoint
DROP TABLE [UPCCommon].[dbo].ApplicationFile_To_FileAttribute
DROP TABLE [UPCCommon].[dbo].ApplicationFile_To_FileCertificate
DROP TABLE [UPCCommon].[dbo].ApplicationFile_To_Job
DROP TABLE [UPCCommon].[dbo].ApplicationFileAttribute
DROP TABLE [UPCCommon].[dbo].ApplicationFileDetail
DROP TABLE [UPCCommon].[dbo].ApplicationFileRankingSummary
DROP TABLE [UPCCommon].[dbo].ApplicationFileCompany
DROP TABLE [UPCCommon].[dbo].ApplicationFileDescription
DROP TABLE [UPCCommon].[dbo].ApplicationFileIntegrity
DROP TABLE [UPCCommon].[dbo].ApplicationFileName
DROP TABLE [UPCCommon].[dbo].ApplicationFilePath
DROP TABLE [UPCCommon].[dbo].ApplicationFileProduct
DROP TABLE [UPCCommon].[dbo].ApplicationFileSource
DROP TABLE [UPCCommon].[dbo].ApplicationFileType
DROP TABLE [UPCCommon].[dbo].ApplicationFileVersion
DROP TABLE [UPCCommon].[dbo].HashList_To_File
DROP TABLE [UPCCommon].[dbo].ApplicationGroup_To_Application
DROP TABLE [UPCCommon].[dbo].EndPointModulePolicy_To_Application
DROP TABLE [UPCCommon].[dbo].Application
DROP TABLE [UPCCommon].[dbo].ApplicationProduct_To_ApplicationFile
DROP TABLE [UPCCommon].[dbo].ApplicationFile
DROP TABLE [UPCCommon].[dbo].EndPointModulePolicy_To_ApplicationPublisher
DROP TABLE [UPCCommon].[dbo].ApplicationPublisher
ALTER TABLE [UPCCommon].[dbo].EndPointModulePolicy DROP CONSTRAINT FK_EndPointModulePolicy_HashListID
DROP TABLE [UPCCommon].[dbo].ApplicationGroup_To_Product
DROP TABLE [UPCCommon].[dbo].EndPointModulePolicy_To_ApplicationGroup
DROP TABLE [UPCCommon].[dbo].ApplicationGroup
DROP TABLE [UPCCommon].[dbo].Hashlist



USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationUpdater]    Script Date: 11/15/2019 8:55:23 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationUpdater](
	[ApplicationUpdaterID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationUpdaterName] [nvarchar](250) NOT NULL,
	[Hash] [varbinary](32) NULL,
	[HashType] [nvarchar](24) NOT NULL,
	[Publisher] [nvarchar](256) NOT NULL,
	[Version] [nvarchar](24) NOT NULL,
	[SHA256] [binary](32) NULL,
 CONSTRAINT [PK_ApplicationUpdater] PRIMARY KEY CLUSTERED 
(
	[ApplicationUpdaterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFile_To_Endpoint]    Script Date: 11/15/2019 8:55:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFile_To_Endpoint](
	[FileID] [bigint] NOT NULL,
	[EPID] [int] NOT NULL,
	[AssignedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_ApplicationFile_To_EndPoint] PRIMARY KEY CLUSTERED 
(
	[EPID] ASC,
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFile_To_FileAttribute]    Script Date: 11/15/2019 8:56:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFile_To_FileAttribute](
	[FileAttributeID] [int] NOT NULL,
	[FileID] [bigint] NOT NULL,
	[Value] [nvarchar](100) NULL,
 CONSTRAINT [PK_ApplicationFile_To_FileAttribute] PRIMARY KEY CLUSTERED 
(
	[FileAttributeID] ASC,
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFile_To_FileCertificate]    Script Date: 11/15/2019 8:56:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFile_To_FileCertificate](
	[FileID] [bigint] NOT NULL,
	[CertificateID] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationFile_To_FileCertificate] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC,
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFile_To_Job]    Script Date: 11/15/2019 8:56:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFile_To_Job](
	[FileID] [bigint] NOT NULL,
	[JobGUID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ApplicationFile_To_Job] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC,
	[JobGUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileAttribute]    Script Date: 11/15/2019 8:57:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileAttribute](
	[FileAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[FileAttribute] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ApplicationFileAttribute] PRIMARY KEY CLUSTERED 
(
	[FileAttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileCompany]    Script Date: 11/15/2019 8:57:19 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileCompany](
	[FileCompanyID] [int] IDENTITY(1,1) NOT NULL,
	[FileCompany] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ApplicationFileCompany] PRIMARY KEY CLUSTERED 
(
	[FileCompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileDescription]    Script Date: 11/15/2019 8:57:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileDescription](
	[FileDescriptionID] [bigint] IDENTITY(1,1) NOT NULL,
	[FileDescription] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_ApplicationFileDescription] PRIMARY KEY CLUSTERED 
(
	[FileDescriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileDetail]    Script Date: 11/15/2019 8:57:39 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileDetail](
	[FileID] [bigint] NOT NULL,
	[SHA1] [binary](20) NULL,
	[MD5] [binary](16) NULL,
	[FileSize] [bigint] NOT NULL,
	[CreationDate] [datetime] NULL,
	[FileNameID] [bigint] NOT NULL,
	[FileDescriptionID] [bigint] NOT NULL,
	[FilePathID] [bigint] NOT NULL,
	[FileCompanyID] [int] NOT NULL,
	[FileProductID] [int] NOT NULL,
	[FileVersionID] [int] NOT NULL,
	[FileTypeID] [int] NOT NULL,
	[AttributeChecksum] [int] NOT NULL,
	[RecordDate] [datetime] NOT NULL,
	[FileSourceID] [int] NOT NULL,
	[EISFileGUID] [uniqueidentifier] NULL,
	[FileIntegrityID] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationFileDetail] PRIMARY KEY CLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileIntegrity]    Script Date: 11/15/2019 8:57:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileIntegrity](
	[FileIntegrityID] [int] NOT NULL,
	[FileIntegrityRating] [nvarchar](100) NOT NULL,
	[Ranking] [int] NOT NULL,
	[RankingValue] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ApplicationFileIntegrity] PRIMARY KEY CLUSTERED 
(
	[FileIntegrityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileName]    Script Date: 11/15/2019 8:59:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileName](
	[FileNameID] [bigint] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_ApplicationFileName] PRIMARY KEY CLUSTERED 
(
	[FileNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFilePath]    Script Date: 11/15/2019 8:59:30 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFilePath](
	[FilePathID] [bigint] IDENTITY(1,1) NOT NULL,
	[FilePath] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_ApplicationFilePath] PRIMARY KEY CLUSTERED 
(
	[FilePathID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileProduct]    Script Date: 11/15/2019 8:59:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileProduct](
	[FileProductID] [int] IDENTITY(1,1) NOT NULL,
	[FileProduct] [nvarchar](100) NOT NULL,
	[FileProductVersion] [nvarchar](100) NULL,
 CONSTRAINT [PK_ApplicationFileProduct] PRIMARY KEY CLUSTERED 
(
	[FileProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileRankingSummary]    Script Date: 11/15/2019 8:59:50 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileRankingSummary](
	[AFRID] [int] IDENTITY(1,1) NOT NULL,
	[BatchGroupId] [int] NOT NULL,
	[FileIntegrityID] [int] NOT NULL,
	[RankingTotal] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationFileRankingSummary] PRIMARY KEY CLUSTERED 
(
	[BatchGroupId] ASC,
	[FileIntegrityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileSource]    Script Date: 11/15/2019 9:00:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileSource](
	[FileSourceID] [int] IDENTITY(1,1) NOT NULL,
	[FileSource] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ApplicationFileSource] PRIMARY KEY CLUSTERED 
(
	[FileSourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileType]    Script Date: 11/15/2019 9:00:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileType](
	[FileTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FileType] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ApplicationFileType] PRIMARY KEY CLUSTERED 
(
	[FileTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFileVersion]    Script Date: 11/15/2019 9:00:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFileVersion](
	[FileVersionID] [int] IDENTITY(1,1) NOT NULL,
	[FileVersion] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ApplicationFileVersion] PRIMARY KEY CLUSTERED 
(
	[FileVersionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[HashList_To_File]    Script Date: 11/15/2019 9:00:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HashList_To_File](
	[HashListID] [int] NOT NULL,
	[FileID] [bigint] NOT NULL,
 CONSTRAINT [PK_HashList_To_File] PRIMARY KEY CLUSTERED 
(
	[HashListID] ASC,
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationGroup_To_Application]    Script Date: 11/15/2019 9:01:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationGroup_To_Application](
	[ApplicationGroupID] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
 CONSTRAINT [PK2_ApplicationGroup_To_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationGroupID] ASC,
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[EndPointModulePolicy_To_Application]    Script Date: 11/15/2019 9:01:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EndPointModulePolicy_To_Application](
	[EPMPolicyID] [int] NOT NULL,
	[ApplicationID] [int] NOT NULL,
 CONSTRAINT [PK_EndPointModulePolicy_To_Application] PRIMARY KEY CLUSTERED 
(
	[EPMPolicyID] ASC,
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[Application]    Script Date: 11/15/2019 9:01:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Application](
	[ApplicationID] [int] IDENTITY(1,1) NOT NULL,
	[ParentApplicationID] [int] NULL,
	[ApplicationName] [nvarchar](100) NOT NULL,
	[ApplicationVersion] [nvarchar](100) NOT NULL,
	[ApplicationCompany] [nvarchar](100) NOT NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[HashListID] [int] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[ApplicationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationProduct_To_ApplicationFile]    Script Date: 11/15/2019 9:02:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationProduct_To_ApplicationFile](
	[ProductID] [int] NOT NULL,
	[FileID] [bigint] NOT NULL,
 CONSTRAINT [PK_ApplicationProduct_To_ApplicationFile] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationFile]    Script Date: 11/15/2019 9:02:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationFile](
	[FileID] [bigint] IDENTITY(1,1) NOT NULL,
	[SHA256] [binary](32) NULL,
 CONSTRAINT [PK_ApplicationFile] PRIMARY KEY NONCLUSTERED 
(
	[FileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[EndPointModulePolicy_To_ApplicationPublisher]    Script Date: 11/15/2019 9:02:51 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EndPointModulePolicy_To_ApplicationPublisher](
	[EPMPolicyID] [int] NOT NULL,
	[PublisherID] [int] NOT NULL,
 CONSTRAINT [PK_EndPointModulePolicy_To_ApplicationPublisher] PRIMARY KEY CLUSTERED 
(
	[EPMPolicyID] ASC,
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationPublisher]    Script Date: 11/15/2019 9:03:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationPublisher](
	[PublisherID] [int] IDENTITY(1,1) NOT NULL,
	[PublisherName] [nvarchar](250) NOT NULL,
	[Issuer] [nvarchar](2000) NOT NULL,
	[Version] [int] NULL,
	[SerialNumber] [varbinary](100) NULL,
	[ValidFrom] [datetime] NULL,
	[ValidTo] [datetime] NULL,
	[Subject] [varchar](120) NULL,
	[Thumbprint] [varbinary](100) NOT NULL,
	[CreatedBy] [nvarchar](256) NULL,
	[CreatedDate] [datetime] NULL,
	[CertificateBinary] [varbinary](max) NULL,
	[CertificateFormat] [varchar](50) NULL,
 CONSTRAINT [PK_ApplicationPublisher] PRIMARY KEY CLUSTERED 
(
	[PublisherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UX_ApplicationPublisher_Thumbprint] UNIQUE NONCLUSTERED 
(
	[Thumbprint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationGroup_To_Product]    Script Date: 11/15/2019 9:04:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationGroup_To_Product](
	[ApplicationGroupID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationGroup_To_Product] PRIMARY KEY CLUSTERED 
(
	[ApplicationGroupID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[EndPointModulePolicy_To_ApplicationGroup]    Script Date: 11/15/2019 9:05:09 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EndPointModulePolicy_To_ApplicationGroup](
	[EPMPolicyID] [int] NOT NULL,
	[ApplicationGroupID] [int] NOT NULL,
 CONSTRAINT [PK_EndPointModulePolicy_To_ApplicationGroup] PRIMARY KEY CLUSTERED 
(
	[EPMPolicyID] ASC,
	[ApplicationGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[ApplicationGroup]    Script Date: 11/15/2019 9:05:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ApplicationGroup](
	[ApplicationGroupID] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationGroupName] [nvarchar](100) NOT NULL,
	[ApplicationGroupDescription] [nvarchar](400) NOT NULL,
	[ParentGroupID] [int] NULL,
	[CreatedBy] [nvarchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[HashListID] [int] NULL,
 CONSTRAINT [PK_ApplicationGroup] PRIMARY KEY CLUSTERED 
(
	[ApplicationGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [UPCCommon]
GO

/****** Object:  Table [dbo].[HashList]    Script Date: 11/15/2019 9:05:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[HashList](
	[HashListID] [int] IDENTITY(1,1) NOT NULL,
	[HashListGUID] [uniqueidentifier] NOT NULL,
	[HashListVersion] [int] NOT NULL,
 CONSTRAINT [PK_HashList] PRIMARY KEY CLUSTERED 
(
	[HashListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ApplicationFile_To_Endpoint] ADD  CONSTRAINT [DF_ApplicationFile_To_EndPoint_AssignedDate]  DEFAULT (getutcdate()) FOR [AssignedDate]
GO

ALTER TABLE [dbo].[ApplicationFile_To_Endpoint]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFile_To_EndPoint_To_ApplicationFile] FOREIGN KEY([FileID])
REFERENCES [dbo].[ApplicationFile] ([FileID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFile_To_Endpoint] CHECK CONSTRAINT [FK_ApplicationFile_To_EndPoint_To_ApplicationFile]
GO

ALTER TABLE [dbo].[ApplicationFile_To_Endpoint]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFile_To_EndPoint_To_EndPoint] FOREIGN KEY([EPID])
REFERENCES [dbo].[EndPoint] ([EPID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFile_To_Endpoint] CHECK CONSTRAINT [FK_ApplicationFile_To_EndPoint_To_EndPoint]
GO

ALTER TABLE [dbo].[ApplicationFile_To_FileAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFile_To_FileAttribute_To_ApplicationFile] FOREIGN KEY([FileID])
REFERENCES [dbo].[ApplicationFile] ([FileID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFile_To_FileAttribute] CHECK CONSTRAINT [FK_ApplicationFile_To_FileAttribute_To_ApplicationFile]
GO

ALTER TABLE [dbo].[ApplicationFile_To_FileAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFile_To_FileAttribute_To_ApplicationFileAttribute] FOREIGN KEY([FileAttributeID])
REFERENCES [dbo].[ApplicationFileAttribute] ([FileAttributeID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFile_To_FileAttribute] CHECK CONSTRAINT [FK_ApplicationFile_To_FileAttribute_To_ApplicationFileAttribute]
GO

ALTER TABLE [dbo].[ApplicationFile_To_FileCertificate]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFile_To_FileCertificate_To_ApplicationFile] FOREIGN KEY([FileID])
REFERENCES [dbo].[ApplicationFile] ([FileID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFile_To_FileCertificate] CHECK CONSTRAINT [FK_ApplicationFile_To_FileCertificate_To_ApplicationFile]
GO

ALTER TABLE [dbo].[ApplicationFile_To_FileCertificate]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFile_To_FileCertificate_To_FileCertificate] FOREIGN KEY([CertificateID])
REFERENCES [dbo].[ApplicationPublisher] ([PublisherID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFile_To_FileCertificate] CHECK CONSTRAINT [FK_ApplicationFile_To_FileCertificate_To_FileCertificate]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFile] FOREIGN KEY([FileID])
REFERENCES [dbo].[ApplicationFile] ([FileID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFile]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileCompany] FOREIGN KEY([FileCompanyID])
REFERENCES [dbo].[ApplicationFileCompany] ([FileCompanyID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileCompany]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileDescription] FOREIGN KEY([FileDescriptionID])
REFERENCES [dbo].[ApplicationFileDescription] ([FileDescriptionID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileDescription]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileIntegrity] FOREIGN KEY([FileIntegrityID])
REFERENCES [dbo].[ApplicationFileIntegrity] ([FileIntegrityID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileIntegrity]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileName] FOREIGN KEY([FileNameID])
REFERENCES [dbo].[ApplicationFileName] ([FileNameID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileName]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFilePath] FOREIGN KEY([FilePathID])
REFERENCES [dbo].[ApplicationFilePath] ([FilePathID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFilePath]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileProduct] FOREIGN KEY([FileProductID])
REFERENCES [dbo].[ApplicationFileProduct] ([FileProductID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileProduct]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileSource] FOREIGN KEY([FileSourceID])
REFERENCES [dbo].[ApplicationFileSource] ([FileSourceID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileSource]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileType] FOREIGN KEY([FileTypeID])
REFERENCES [dbo].[ApplicationFileType] ([FileTypeID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileType]
GO

ALTER TABLE [dbo].[ApplicationFileDetail]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileVersion] FOREIGN KEY([FileVersionID])
REFERENCES [dbo].[ApplicationFileVersion] ([FileVersionID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileDetail] CHECK CONSTRAINT [FK_ApplicationFileDetail_To_ApplicationFileVersion]
GO

ALTER TABLE [dbo].[ApplicationFileRankingSummary]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationFileIntegrity_ApplicationFileRankingSummary] FOREIGN KEY([FileIntegrityID])
REFERENCES [dbo].[ApplicationFileIntegrity] ([FileIntegrityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationFileRankingSummary] CHECK CONSTRAINT [FK_ApplicationFileIntegrity_ApplicationFileRankingSummary]
GO

ALTER TABLE [dbo].[ApplicationFileRankingSummary]  WITH CHECK ADD  CONSTRAINT [FK_BatchGroup_ApplicationFileRankingSummary] FOREIGN KEY([BatchGroupId])
REFERENCES [dbo].[BatchGroup] ([BatchGroupId])
GO

ALTER TABLE [dbo].[ApplicationFileRankingSummary] CHECK CONSTRAINT [FK_BatchGroup_ApplicationFileRankingSummary]
GO

ALTER TABLE [dbo].[HashList_To_File]  WITH CHECK ADD  CONSTRAINT [FK_HashList_To_File_To_File] FOREIGN KEY([FileID])
REFERENCES [dbo].[ApplicationFile] ([FileID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HashList_To_File] CHECK CONSTRAINT [FK_HashList_To_File_To_File]
GO

ALTER TABLE [dbo].[HashList_To_File]  WITH CHECK ADD  CONSTRAINT [FK_HashList_To_File_To_HashList] FOREIGN KEY([HashListID])
REFERENCES [dbo].[HashList] ([HashListID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HashList_To_File] CHECK CONSTRAINT [FK_HashList_To_File_To_HashList]
GO

ALTER TABLE [dbo].[ApplicationGroup_To_Application]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationGroup_To_Application_To_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Application] ([ApplicationID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationGroup_To_Application] CHECK CONSTRAINT [FK_ApplicationGroup_To_Application_To_Application]
GO

ALTER TABLE [dbo].[ApplicationGroup_To_Application]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationGroup_To_Application_To_ApplicationGroup] FOREIGN KEY([ApplicationGroupID])
REFERENCES [dbo].[ApplicationGroup] ([ApplicationGroupID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationGroup_To_Application] CHECK CONSTRAINT [FK_ApplicationGroup_To_Application_To_ApplicationGroup]
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_Application]  WITH CHECK ADD  CONSTRAINT [FK_EndPointModulePolicy_To_Application_To_Application] FOREIGN KEY([ApplicationID])
REFERENCES [dbo].[Application] ([ApplicationID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_Application] CHECK CONSTRAINT [FK_EndPointModulePolicy_To_Application_To_Application]
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_Application]  WITH CHECK ADD  CONSTRAINT [FK_EndPointModulePolicy_To_Application_To_EndPointModulePolicy] FOREIGN KEY([EPMPolicyID])
REFERENCES [dbo].[EndPointModulePolicy] ([EPMPolicyID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_Application] CHECK CONSTRAINT [FK_EndPointModulePolicy_To_Application_To_EndPointModulePolicy]
GO

ALTER TABLE [dbo].[Application] ADD  CONSTRAINT [DF_Application_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_HashListID] FOREIGN KEY([HashListID])
REFERENCES [dbo].[HashList] ([HashListID])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_HashListID]
GO

ALTER TABLE [dbo].[ApplicationProduct_To_ApplicationFile]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationProduct_To_ApplicationFile_To_ApplicationFile] FOREIGN KEY([FileID])
REFERENCES [dbo].[ApplicationFile] ([FileID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationProduct_To_ApplicationFile] CHECK CONSTRAINT [FK_ApplicationProduct_To_ApplicationFile_To_ApplicationFile]
GO

ALTER TABLE [dbo].[ApplicationProduct_To_ApplicationFile]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationProduct_To_ApplicationFile_To_ApplicationProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ApplicationProduct] ([ProductID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationProduct_To_ApplicationFile] CHECK CONSTRAINT [FK_ApplicationProduct_To_ApplicationFile_To_ApplicationProduct]
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_ApplicationPublisher]  WITH CHECK ADD  CONSTRAINT [FK_EndPointModulePolicy_To_ApplicationPublisher_To_ApplicationPublisher] FOREIGN KEY([PublisherID])
REFERENCES [dbo].[ApplicationPublisher] ([PublisherID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_ApplicationPublisher] CHECK CONSTRAINT [FK_EndPointModulePolicy_To_ApplicationPublisher_To_ApplicationPublisher]
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_ApplicationPublisher]  WITH CHECK ADD  CONSTRAINT [FK_EndPointModulePolicy_To_ApplicationPublisher_To_EndPointModulePolicy] FOREIGN KEY([EPMPolicyID])
REFERENCES [dbo].[EndPointModulePolicy] ([EPMPolicyID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_ApplicationPublisher] CHECK CONSTRAINT [FK_EndPointModulePolicy_To_ApplicationPublisher_To_EndPointModulePolicy]
GO

ALTER TABLE [dbo].[ApplicationPublisher] ADD  CONSTRAINT [DF_ApplicationPublisher_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO

USE [UPCCommon]
GO

ALTER TABLE [dbo].[EndPointModulePolicy]  WITH CHECK ADD  CONSTRAINT [FK_EndPointModulePolicy_HashListID] FOREIGN KEY([HashListID])
REFERENCES [dbo].[HashList] ([HashListID])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[EndPointModulePolicy] CHECK CONSTRAINT [FK_EndPointModulePolicy_HashListID]
GO

ALTER TABLE [dbo].[ApplicationGroup_To_Product]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationGroup_To_Product_To_ApplicationGroup] FOREIGN KEY([ApplicationGroupID])
REFERENCES [dbo].[ApplicationGroup] ([ApplicationGroupID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationGroup_To_Product] CHECK CONSTRAINT [FK_ApplicationGroup_To_Product_To_ApplicationGroup]
GO

ALTER TABLE [dbo].[ApplicationGroup_To_Product]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationGroup_To_Product_To_ApplicationProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[ApplicationProduct] ([ProductID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[ApplicationGroup_To_Product] CHECK CONSTRAINT [FK_ApplicationGroup_To_Product_To_ApplicationProduct]
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_ApplicationGroup]  WITH CHECK ADD  CONSTRAINT [FK_EndPointModulePolicy_To_ApplicationGroup_To_ApplicationGroup] FOREIGN KEY([ApplicationGroupID])
REFERENCES [dbo].[ApplicationGroup] ([ApplicationGroupID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_ApplicationGroup] CHECK CONSTRAINT [FK_EndPointModulePolicy_To_ApplicationGroup_To_ApplicationGroup]
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_ApplicationGroup]  WITH CHECK ADD  CONSTRAINT [FK_EndPointModulePolicy_To_ApplicationGroup_To_EndPointModulePolicy] FOREIGN KEY([EPMPolicyID])
REFERENCES [dbo].[EndPointModulePolicy] ([EPMPolicyID])
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[EndPointModulePolicy_To_ApplicationGroup] CHECK CONSTRAINT [FK_EndPointModulePolicy_To_ApplicationGroup_To_EndPointModulePolicy]
GO

ALTER TABLE [dbo].[ApplicationGroup] ADD  CONSTRAINT [DF_ApplicationGroup_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO

ALTER TABLE [dbo].[ApplicationGroup]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationGroup_HashListID] FOREIGN KEY([HashListID])
REFERENCES [dbo].[HashList] ([HashListID])
ON DELETE SET NULL
GO

ALTER TABLE [dbo].[ApplicationGroup] CHECK CONSTRAINT [FK_ApplicationGroup_HashListID]
GO

ALTER TABLE [dbo].[HashList] ADD  CONSTRAINT [DF_HasList_HashListVersion]  DEFAULT ('1') FOR [HashListVersion]
GO

INSERT INTO [UPCCommon].[dbo].[ApplicationFileAttribute] VALUES ('LegalCopyright')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileCompany] VALUES ('')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileDescription] VALUES ('')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (0, 'Not Assessed', 0, 'Not Assessed')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (1, 'Malware', 1, 'TBD – Malware')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (2, '(No/P < 1%)', 2, 'Low – Not found or < 1 % prevalence in user network')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (3, '(1% <= P <= 15%)', 3, 'Low – Match found in user network (low prevalence)')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (4, '(P > 15%)', 4, 'Medium – Match found in user network (high prevalence)')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (5, '(NSRL)', 5, 'Medium – Match found in National Software Reference Library (NSRL)')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (6, 'High – Lumension verified', 6, 'High – Lumension verified')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (7, 'High – Lumension verified', 6, 'High – Lumension verified')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (8, 'High – Lumension verified and signed', 7, 'High – Lumension verified and signed')
Insert INTO [UPCCommon].[dbo].[ApplicationFileIntegrity] VALUES (9, 'High – Lumension verified and signed', 7, 'High – Lumension verified and signed')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileName] VALUES ('')
INSERT INTO [UPCCommon].[dbo].[ApplicationFilePath] VALUES ('')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileProduct] VALUES ('','')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileSource] VALUES ('')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileSource] VALUES ('Application Discovery')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileSource] VALUES ('Event Log')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileType] VALUES ('')
INSERT INTO [UPCCommon].[dbo].[ApplicationFileVersion] VALUES ('')

