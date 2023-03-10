USE [master]
GO
/****** Object:  Database [TaskEstimateManagementDb]    Script Date: 20/01/2023 3:03:17 pm ******/
CREATE DATABASE [TaskEstimateManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaskEstimateManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TaskEstimateManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TaskEstimateManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TaskEstimateManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TaskEstimateManagementDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskEstimateManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskEstimateManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaskEstimateManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TaskEstimateManagementDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TaskEstimateManagementDb] SET QUERY_STORE = OFF
GO
USE [TaskEstimateManagementDb]
GO
/****** Object:  User [jpm]    Script Date: 20/01/2023 3:03:18 pm ******/
CREATE USER [jpm] FOR LOGIN [jpm] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [jpm]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [jpm]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [jpm]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [jpm]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [jpm]
GO
ALTER ROLE [db_datareader] ADD MEMBER [jpm]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [jpm]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [jpm]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [jpm]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 20/01/2023 3:03:18 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](150) NULL,
 CONSTRAINT [PK_tblEmployee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployeeEstimate]    Script Date: 20/01/2023 3:03:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployeeEstimate](
	[TaskEstimateId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[EmployeeEstimate] [int] NOT NULL,
	[ActualHours] [int] NOT NULL,
 CONSTRAINT [PK_tblEmployeeEstimate] PRIMARY KEY CLUSTERED 
(
	[TaskEstimateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProject]    Script Date: 20/01/2023 3:03:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProject](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](100) NOT NULL,
	[ProjectDescription] [varchar](500) NULL,
 CONSTRAINT [PK_tblProject] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTask]    Script Date: 20/01/2023 3:03:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTask](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskDescription] [nvarchar](200) NULL,
	[TaskName] [nvarchar](50) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[TotalEstimate] [int] NULL,
 CONSTRAINT [PK_tblTask] PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblEmployee] ON 

INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [LastName], [UserName], [Password]) VALUES (1, N'Joseph', N'Malaluan', NULL, NULL)
INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [LastName], [UserName], [Password]) VALUES (2, N'Venjo', N'Llanes', NULL, NULL)
INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [LastName], [UserName], [Password]) VALUES (3, N'Shane', N'Cruz', NULL, NULL)
INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [LastName], [UserName], [Password]) VALUES (4, N'joey', N'emmm', NULL, NULL)
INSERT [dbo].[tblEmployee] ([EmployeeId], [FirstName], [LastName], [UserName], [Password]) VALUES (5, N'string', N'string', N'string', N'v+mspNjY9tKoq4mLnw8xYA==')
SET IDENTITY_INSERT [dbo].[tblEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[tblEmployeeEstimate] ON 

INSERT [dbo].[tblEmployeeEstimate] ([TaskEstimateId], [TaskId], [EmployeeId], [EmployeeEstimate], [ActualHours]) VALUES (10, 1, 1, 10, 11)
INSERT [dbo].[tblEmployeeEstimate] ([TaskEstimateId], [TaskId], [EmployeeId], [EmployeeEstimate], [ActualHours]) VALUES (11, 1, 1, 11, 14)
INSERT [dbo].[tblEmployeeEstimate] ([TaskEstimateId], [TaskId], [EmployeeId], [EmployeeEstimate], [ActualHours]) VALUES (12, 2, 2, 2, 2)
INSERT [dbo].[tblEmployeeEstimate] ([TaskEstimateId], [TaskId], [EmployeeId], [EmployeeEstimate], [ActualHours]) VALUES (13, 1, 1, 1, 1)
INSERT [dbo].[tblEmployeeEstimate] ([TaskEstimateId], [TaskId], [EmployeeId], [EmployeeEstimate], [ActualHours]) VALUES (14, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tblEmployeeEstimate] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProject] ON 

INSERT [dbo].[tblProject] ([ProjectId], [ProjectName], [ProjectDescription]) VALUES (1, N'RegistrationEMS', N'Registration Software')
INSERT [dbo].[tblProject] ([ProjectId], [ProjectName], [ProjectDescription]) VALUES (2, N'HRMS', N'Human Resource Software')
INSERT [dbo].[tblProject] ([ProjectId], [ProjectName], [ProjectDescription]) VALUES (3, N'GMS', N'Guidance Management')
INSERT [dbo].[tblProject] ([ProjectId], [ProjectName], [ProjectDescription]) VALUES (4, N'HRMSD-34', N'34th Project')
SET IDENTITY_INSERT [dbo].[tblProject] OFF
GO
SET IDENTITY_INSERT [dbo].[tblTask] ON 

INSERT [dbo].[tblTask] ([TaskId], [TaskDescription], [TaskName], [ProjectId], [TotalEstimate]) VALUES (1, N'CRUD task', N'CRUD Task', 1, 10)
INSERT [dbo].[tblTask] ([TaskId], [TaskDescription], [TaskName], [ProjectId], [TotalEstimate]) VALUES (2, N'Bug Fixing for formatting', N'Formatting Issue', 2, 20)
INSERT [dbo].[tblTask] ([TaskId], [TaskDescription], [TaskName], [ProjectId], [TotalEstimate]) VALUES (3, N'New Added Pages for Testing', N'Testing Page', 2, 20)
SET IDENTITY_INSERT [dbo].[tblTask] OFF
GO
ALTER TABLE [dbo].[tblEmployeeEstimate] ADD  CONSTRAINT [DF_tblEmployeeEstimate_ActualHours]  DEFAULT ((0)) FOR [ActualHours]
GO
ALTER TABLE [dbo].[tblEmployeeEstimate]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeEstimate_tblEmployee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployee] ([EmployeeId])
GO
ALTER TABLE [dbo].[tblEmployeeEstimate] CHECK CONSTRAINT [FK_tblEmployeeEstimate_tblEmployee]
GO
ALTER TABLE [dbo].[tblEmployeeEstimate]  WITH CHECK ADD  CONSTRAINT [FK_tblEmployeeEstimate_tblTask] FOREIGN KEY([TaskId])
REFERENCES [dbo].[tblTask] ([TaskId])
GO
ALTER TABLE [dbo].[tblEmployeeEstimate] CHECK CONSTRAINT [FK_tblEmployeeEstimate_tblTask]
GO
ALTER TABLE [dbo].[tblTask]  WITH CHECK ADD  CONSTRAINT [FK_tblTask_tblProject] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[tblProject] ([ProjectId])
GO
ALTER TABLE [dbo].[tblTask] CHECK CONSTRAINT [FK_tblTask_tblProject]
GO
/****** Object:  StoredProcedure [dbo].[Get_Employee_ById]    Script Date: 20/01/2023 3:03:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Get_Employee_ById]
@id int
AS
BEGIN
	SET NOCOUNT ON;
	Select * from tblEmployee where EmployeeId=@id;
END
GO
/****** Object:  StoredProcedure [dbo].[Get_Employees]    Script Date: 20/01/2023 3:03:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Get_Employees]
AS
BEGIN
	SET NOCOUNT ON;
	Select * from tblEmployee;
END
GO
/****** Object:  StoredProcedure [dbo].[Insert_New_Employee]    Script Date: 20/01/2023 3:03:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Insert_New_Employee]
@firstName varchar(100),
@lastName varchar(100),
@userName varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	INSERT into tblEmployee (FirstName,LastName,UserName)Values(@firstName,@lastName,@userName);

END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 20/01/2023 3:03:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Login]
	@UserName varchar(100),
	@Password varchar(150)
AS
BEGIN
	SET NOCOUNT ON;
	Select * from tblEmployee where UserName = @UserName and Password=@Password
END
GO
/****** Object:  StoredProcedure [dbo].[Update_Employee_ById]    Script Date: 20/01/2023 3:03:19 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[Update_Employee_ById]
@id int,
@firstName varchar(100),
@lastName varchar(100),
@userName varchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	Select * from tblEmployee where EmployeeId=@id;
	Update tblEmployee
	Set FirstName = @firstName,
	LastName = @lastName,
	UserName = @userName
	Where 
	EmployeeId = @id

END
GO
USE [master]
GO
ALTER DATABASE [TaskEstimateManagementDb] SET  READ_WRITE 
GO
