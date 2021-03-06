USE [master]
GO
/****** Object:  Database [AspFinalNew]    Script Date: 1/11/2019 11:52:58 PM ******/
CREATE DATABASE [AspFinalNew]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AspFinalNew', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AspFinalNew.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AspFinalNew_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\AspFinalNew_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AspFinalNew] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AspFinalNew].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AspFinalNew] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AspFinalNew] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AspFinalNew] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AspFinalNew] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AspFinalNew] SET ARITHABORT OFF 
GO
ALTER DATABASE [AspFinalNew] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AspFinalNew] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [AspFinalNew] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AspFinalNew] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AspFinalNew] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AspFinalNew] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AspFinalNew] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AspFinalNew] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AspFinalNew] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AspFinalNew] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AspFinalNew] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AspFinalNew] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AspFinalNew] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AspFinalNew] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AspFinalNew] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AspFinalNew] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AspFinalNew] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AspFinalNew] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AspFinalNew] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AspFinalNew] SET  MULTI_USER 
GO
ALTER DATABASE [AspFinalNew] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AspFinalNew] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AspFinalNew] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AspFinalNew] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [AspFinalNew]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Blog]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Slogan] [nvarchar](250) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Text] [ntext] NOT NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Icon] [nvarchar](200) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryService]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL,
 CONSTRAINT [PK_CategoryService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[City]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Rating] [smallint] NOT NULL,
	[Text] [nvarchar](140) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CommentPhoto]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentPhoto](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [int] NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_CommentPhoto] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceId] [int] NOT NULL,
	[Image] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Place]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Place](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [bit] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Slogan] [nvarchar](100) NOT NULL,
	[Desc] [ntext] NOT NULL,
	[Phone] [nvarchar](100) NOT NULL,
	[Website] [nvarchar](100) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Place] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlaceService]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaceService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceId] [int] NOT NULL,
	[SeviceId] [int] NOT NULL,
 CONSTRAINT [PK_PlaceService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reaction]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Type] [bit] NOT NULL,
 CONSTRAINT [PK_Reaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WorkHour]    Script Date: 1/11/2019 11:52:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkHour](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceId] [int] NOT NULL,
	[Weekno] [int] NOT NULL,
	[OpenHour] [time](7) NOT NULL,
	[CloseHour] [time](7) NOT NULL,
 CONSTRAINT [PK_WorkHour] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([Id], [Photo], [Name], [Slogan], [Date], [Text]) VALUES (2, N'2019_01_DD_02_35_10article-img3.jpg', N'Culture', N'What culture says about your country?', CAST(0x0000A9D000F05F28 AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.  Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Enable pandemic paradigms via highly efficient relationships.  Someone famous in Source Title Corporate infomediaries after visionary convergence Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
INSERT [dbo].[Blog] ([Id], [Photo], [Name], [Slogan], [Date], [Text]) VALUES (3, N'2019_01_DD_02_37_22article-img2.jpg', N'Travelling', N'Traveling alone? Remember this 5 useful tips', CAST(0x0000A9D000F0FA39 AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.  Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Enable pandemic paradigms via highly efficient relationships.  Someone famous in Source Title Corporate infomediaries after visionary convergence Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
INSERT [dbo].[Blog] ([Id], [Photo], [Name], [Slogan], [Date], [Text]) VALUES (6, N'2019_01_DD_05_46_23article-img1.jpg', N'Restaurants', N'How to choose top-notch restaurants', CAST(0x0000A9D10124E46D AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.  Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Enable pandemic paradigms via highly efficient relationships.  Someone famous in Source Title Corporate infomediaries after visionary convergence Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
INSERT [dbo].[Blog] ([Id], [Photo], [Name], [Slogan], [Date], [Text]) VALUES (8, N'2019_01_DD_05_48_41article-img4.jpg', N'Event', N'World’s biggest hard-rock band visting Boston', CAST(0x0000A9D10125865B AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.  Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Enable pandemic paradigms via highly efficient relationships.  Someone famous in Source Title Corporate infomediaries after visionary convergence Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
INSERT [dbo].[Blog] ([Id], [Photo], [Name], [Slogan], [Date], [Text]) VALUES (9, N'2019_01_DD_05_49_23article-img3.jpg', N'Culture', N'What culture says about your country?', CAST(0x0000A9D10125B743 AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.  Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Enable pandemic paradigms via highly efficient relationships.  Someone famous in Source Title Corporate infomediaries after visionary convergence Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
INSERT [dbo].[Blog] ([Id], [Photo], [Name], [Slogan], [Date], [Text]) VALUES (14, N'2019_01_DD_12_51_35article-img4.jpg', N'Events', N'World’s biggest hard-rock band visting Boston', CAST(0x0000A9D200D3ECC2 AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.  Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Enable pandemic paradigms via highly efficient relationships.  Someone famous in Source Title Corporate infomediaries after visionary convergence Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
INSERT [dbo].[Blog] ([Id], [Photo], [Name], [Slogan], [Date], [Text]) VALUES (16, N'2019_01_DD_01_01_58article-img1.jpg', N'Restaurants', N'How to choose top-notch restaurants', CAST(0x0000A9D200D6C730 AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.  Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Enable pandemic paradigms via highly efficient relationships.  Someone famous in Source Title Corporate infomediaries after visionary convergence Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
INSERT [dbo].[Blog] ([Id], [Photo], [Name], [Slogan], [Date], [Text]) VALUES (17, N'2019_01_DD_01_02_46article-img2.jpg', N'Travveling', N'Traveling alone? Remember this 5 useful tips', CAST(0x0000A9D200D6FE5B AS DateTime), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.  Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Enable pandemic paradigms via highly efficient relationships.  Someone famous in Source Title Corporate infomediaries after visionary convergence Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (2, N'Restourant', N'fa fa-cutlery fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (3, N'Real Estate', N'fa fa-home fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (4, N'Health & Fitness', N'fa fa-heart fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (5, N'Hotels & Travel', N'fa fa-bed fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (6, N'Shopping', N'fa fa-shopping-cart fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (7, N'Sports', N'fa fa-futbol-o fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (8, N'Transport', N'fa fa-truck fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (9, N'Beauty & Spas', N'fa fa-smile-o fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (10, N'Automotive', N'fa fa-automobile fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (11, N'Education', N'fa fa-book fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (12, N'Event', N'fa fa-calendar fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (13, N'Entertainment', N'fa fa-music fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (14, N'Bar & Club', N'fa fa-glass fa-3x')
INSERT [dbo].[Category] ([Id], [Name], [Icon]) VALUES (15, N'Technology', N'fa fa-television fa-3x')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CategoryService] ON 

INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (1, 15, 1)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (2, 15, 4)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (3, 15, 7)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (4, 15, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (5, 11, 10)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (6, 11, 13)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (7, 11, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (8, 11, 4)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (9, 11, 5)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (10, 11, 8)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (11, 11, 11)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (12, 9, 1)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (13, 9, 4)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (14, 2, 5)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (15, 2, 14)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (16, 2, 16)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (17, 2, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (18, 2, 19)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (19, 2, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (20, 4, 8)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (21, 4, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (22, 4, 17)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (23, 4, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (24, 5, 5)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (25, 5, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (26, 5, 17)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (27, 5, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (28, 5, 19)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (29, 5, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (30, 2, 1)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (31, 2, 5)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (32, 2, 8)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (33, 2, 9)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (34, 2, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (35, 2, 14)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (36, 2, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (37, 2, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (38, 2, 19)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (39, 2, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (40, 5, 9)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (41, 5, 14)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (42, 5, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (43, 5, 16)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (44, 5, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (45, 5, 19)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (46, 5, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (47, 14, 5)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (48, 14, 8)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (49, 14, 9)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (50, 14, 14)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (51, 14, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (52, 14, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (53, 14, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (54, 2, 1)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (55, 2, 8)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (56, 2, 9)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (57, 2, 13)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (58, 2, 14)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (59, 2, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (60, 2, 16)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (61, 2, 17)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (62, 2, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (63, 2, 20)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (64, 2, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (65, 4, 9)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (66, 4, 14)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (67, 4, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (68, 4, 16)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (69, 4, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (70, 4, 19)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (71, 4, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (72, 14, 5)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (73, 14, 8)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (74, 14, 9)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (75, 14, 11)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (76, 14, 13)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (77, 14, 14)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (78, 14, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (79, 14, 16)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (80, 14, 17)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (81, 14, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (82, 14, 20)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (83, 14, 21)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (84, 14, 1)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (85, 14, 5)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (86, 14, 9)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (87, 14, 11)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (88, 14, 14)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (89, 14, 15)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (90, 14, 16)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (91, 14, 17)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (92, 14, 18)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (93, 14, 19)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (94, 14, 20)
INSERT [dbo].[CategoryService] ([Id], [CategoryId], [ServiceId]) VALUES (95, 14, 21)
SET IDENTITY_INSERT [dbo].[CategoryService] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([Id], [Name], [Photo]) VALUES (2, N'New York', N'2019_01_DD_06_08_59newyork.jpg')
INSERT [dbo].[City] ([Id], [Name], [Photo]) VALUES (3, N'Singapore', N'2019_01_DD_06_09_33singapore.jpg')
INSERT [dbo].[City] ([Id], [Name], [Photo]) VALUES (4, N'California', N'2019_01_DD_06_10_00california.jpg')
INSERT [dbo].[City] ([Id], [Name], [Photo]) VALUES (5, N'India', N'2019_01_DD_05_33_08india.jpg')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (24, 1015, N'2019_01_DD_12_23_00featured-img2.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (25, 1015, N'2019_01_DD_12_23_01featured-img1.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (26, 1015, N'2019_01_DD_12_23_01featured-img3.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (27, 1016, N'2019_01_DD_12_26_27featured-img3.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (28, 1016, N'2019_01_DD_12_26_27featured-img2.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (29, 1017, N'2019_01_DD_12_28_42featured-img1.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (30, 1017, N'2019_01_DD_12_28_42featured-img3.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (31, 1017, N'2019_01_DD_12_28_42featured-img2.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (32, 1018, N'2019_01_DD_01_17_48featured-img2.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (33, 1018, N'2019_01_DD_01_17_48featured-img3.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (34, 1018, N'2019_01_DD_01_17_48featured-img1.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (35, 1019, N'2019_01_DD_01_22_08featured-img3.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (36, 1019, N'2019_01_DD_01_22_08featured-img1.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (37, 1020, N'2019_01_DD_01_26_15featured-img1.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (38, 1020, N'2019_01_DD_01_26_15featured-img2.jpg')
INSERT [dbo].[Photo] ([Id], [PlaceId], [Image]) VALUES (39, 1020, N'2019_01_DD_01_26_15featured-img3.jpg')
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Place] ON 

INSERT [dbo].[Place] ([Id], [Status], [Name], [Slogan], [Desc], [Phone], [Website], [CategoryId], [CityId], [UserId]) VALUES (1015, 0, N'LeFesto Hotel', N'Innovative cooking, paired with fine wines in a modern setting.', N'Sed ut perspiciatis unde omnis iste gnos natus error sit vento volupt accusantium doloremque laudantium.', N'0554568978', N'sevilam@code.edu.az', 5, 4, 3)
INSERT [dbo].[Place] ([Id], [Status], [Name], [Slogan], [Desc], [Phone], [Website], [CategoryId], [CityId], [UserId]) VALUES (1016, 0, N'Golden Band', N'Innovative cooking, paired with fine wines in a modern setting.', N'Sed ut perspiciatis unde omnis iste gnos natus error sit vento volupt accusantium doloremque laudantium.', N'0774562325', N'avia-mexanik@mail.ru', 14, 2, 3)
INSERT [dbo].[Place] ([Id], [Status], [Name], [Slogan], [Desc], [Phone], [Website], [CategoryId], [CityId], [UserId]) VALUES (1017, 0, N'Coffee House', N'Innovative cooking, paired with fine wines in a modern setting.', N'Sed ut perspiciatis unde omnis iste gnos natus error sit vento volupt accusantium doloremque laudantium.', N'0507895623', N'sevilam@code.edu.az', 2, 3, 3)
INSERT [dbo].[Place] ([Id], [Status], [Name], [Slogan], [Desc], [Phone], [Website], [CategoryId], [CityId], [UserId]) VALUES (1018, 0, N'LeFesto Hotel', N'Innovative cooking, paired with fine wines in a modern setting.', N'Sed ut perspiciatis unde omnis iste gnos natus error sit vento volupt accusantium doloremque laudantium.', N'0554892356', N'sevilam@code.edu.az', 4, 2, 3)
INSERT [dbo].[Place] ([Id], [Status], [Name], [Slogan], [Desc], [Phone], [Website], [CategoryId], [CityId], [UserId]) VALUES (1019, 0, N'Golden Band', N'Innovative cooking, paired with fine wines in a modern setting.', N'Sed ut perspiciatis unde omnis iste gnos natus error sit vento volupt accusantium doloremque laudantium.', N'0504568978', N'avia-mexanik@mail.ru', 14, 2, 3)
INSERT [dbo].[Place] ([Id], [Status], [Name], [Slogan], [Desc], [Phone], [Website], [CategoryId], [CityId], [UserId]) VALUES (1020, 0, N'Coffee House', N'Innovative cooking, paired with fine wines in a modern setting.', N'Sed ut perspiciatis unde omnis iste gnos natus error sit vento volupt accusantium doloremque laudantium.', N'0554562385', N'avia-mexanik@mail.ru', 14, 3, 3)
SET IDENTITY_INSERT [dbo].[Place] OFF
SET IDENTITY_INSERT [dbo].[PlaceService] ON 

INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (46, 1015, 9)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (47, 1015, 14)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (48, 1015, 15)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (49, 1015, 16)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (50, 1015, 18)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (51, 1015, 19)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (52, 1015, 21)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (53, 1016, 5)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (54, 1016, 8)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (55, 1016, 9)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (56, 1016, 14)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (57, 1016, 15)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (58, 1016, 18)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (59, 1016, 21)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (60, 1017, 1)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (61, 1017, 8)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (62, 1017, 9)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (63, 1017, 13)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (64, 1017, 14)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (65, 1017, 15)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (66, 1017, 16)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (67, 1017, 17)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (68, 1017, 18)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (69, 1017, 20)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (70, 1017, 21)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (71, 1018, 9)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (72, 1018, 14)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (73, 1018, 15)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (74, 1018, 16)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (75, 1018, 18)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (76, 1018, 19)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (77, 1018, 21)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (78, 1019, 5)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (79, 1019, 8)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (80, 1019, 9)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (81, 1019, 11)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (82, 1019, 13)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (83, 1019, 14)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (84, 1019, 15)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (85, 1019, 16)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (86, 1019, 17)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (87, 1019, 18)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (88, 1019, 20)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (89, 1019, 21)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (90, 1020, 1)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (91, 1020, 5)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (92, 1020, 9)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (93, 1020, 11)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (94, 1020, 14)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (95, 1020, 15)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (96, 1020, 16)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (97, 1020, 17)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (98, 1020, 18)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (99, 1020, 19)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (100, 1020, 20)
INSERT [dbo].[PlaceService] ([Id], [PlaceId], [SeviceId]) VALUES (101, 1020, 21)
SET IDENTITY_INSERT [dbo].[PlaceService] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([Id], [Name]) VALUES (1, N'Alarm system')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (2, N'Depanneur in building')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (3, N'Onsite management')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (4, N'Janitor')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (5, N'Security cameras')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (6, N'Laundry room in building')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (7, N'Door attendant')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (8, N'Street parking')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (9, N' Intercom')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (10, N'Attached garage')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (11, N' Elevator')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (12, N'Wheelchair accessible')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (13, N'Heating')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (14, N'Hot water')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (15, N'Electricity')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (16, N'Bike Parking')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (17, N'Wireless Internet')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (18, N'Smoking Allowed')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (19, N'Street Parking')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (20, N'Special')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (21, N'Accepts Credit cards')
INSERT [dbo].[Service] ([Id], [Name]) VALUES (22, N'Full Personals')
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FullName], [Email], [Password]) VALUES (1, N'Yolcu Nesib', N'panah@mail.ru', N'dssssdsd')
INSERT [dbo].[Users] ([Id], [FullName], [Email], [Password]) VALUES (2, N'panah', N'sa@gmail.com', N'panah123')
INSERT [dbo].[Users] ([Id], [FullName], [Email], [Password]) VALUES (3, N'sevil', N'sevilam@code.edu.az', N'ABw7ZVgkU4bV6tP7AcJs0LMaxKbqt/LXZwTg/TTAE3QxRJcvEkuGOCXQ1k6gYw+zfA==')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[CategoryService]  WITH CHECK ADD  CONSTRAINT [FK_CategoryService_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[CategoryService] CHECK CONSTRAINT [FK_CategoryService_Service]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Users]
GO
ALTER TABLE [dbo].[CommentPhoto]  WITH CHECK ADD  CONSTRAINT [FK_CommentPhoto_Comment] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comment] ([Id])
GO
ALTER TABLE [dbo].[CommentPhoto] CHECK CONSTRAINT [FK_CommentPhoto_Comment]
GO
ALTER TABLE [dbo].[Place]  WITH CHECK ADD  CONSTRAINT [FK_Place_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Place] CHECK CONSTRAINT [FK_Place_Category]
GO
ALTER TABLE [dbo].[Place]  WITH CHECK ADD  CONSTRAINT [FK_Place_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
ALTER TABLE [dbo].[Place] CHECK CONSTRAINT [FK_Place_City]
GO
ALTER TABLE [dbo].[Place]  WITH CHECK ADD  CONSTRAINT [FK_Place_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Place] CHECK CONSTRAINT [FK_Place_Users]
GO
ALTER TABLE [dbo].[PlaceService]  WITH CHECK ADD  CONSTRAINT [FK_PlaceService_Place] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Place] ([Id])
GO
ALTER TABLE [dbo].[PlaceService] CHECK CONSTRAINT [FK_PlaceService_Place]
GO
ALTER TABLE [dbo].[PlaceService]  WITH CHECK ADD  CONSTRAINT [FK_PlaceService_Service] FOREIGN KEY([SeviceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[PlaceService] CHECK CONSTRAINT [FK_PlaceService_Service]
GO
ALTER TABLE [dbo].[Reaction]  WITH CHECK ADD  CONSTRAINT [FK_Reaction_Comment] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comment] ([Id])
GO
ALTER TABLE [dbo].[Reaction] CHECK CONSTRAINT [FK_Reaction_Comment]
GO
ALTER TABLE [dbo].[Reaction]  WITH CHECK ADD  CONSTRAINT [FK_Reaction_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Reaction] CHECK CONSTRAINT [FK_Reaction_Users]
GO
ALTER TABLE [dbo].[WorkHour]  WITH CHECK ADD  CONSTRAINT [FK_WorkHour_WorkHour] FOREIGN KEY([PlaceId])
REFERENCES [dbo].[Place] ([Id])
GO
ALTER TABLE [dbo].[WorkHour] CHECK CONSTRAINT [FK_WorkHour_WorkHour]
GO
USE [master]
GO
ALTER DATABASE [AspFinalNew] SET  READ_WRITE 
GO
