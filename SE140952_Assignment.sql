USE [master]
GO
/****** Object:  Database [FlowerManagement]    Script Date: 26/04/2021 5:59:26 PM ******/
CREATE DATABASE [FlowerManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DataLabPRJ_1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DataLabPRJ_1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DataLabPRJ_1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DataLabPRJ_1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FlowerManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlowerManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlowerManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlowerManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlowerManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlowerManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlowerManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlowerManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlowerManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlowerManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlowerManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlowerManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlowerManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlowerManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlowerManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlowerManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlowerManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FlowerManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlowerManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlowerManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlowerManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlowerManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlowerManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlowerManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlowerManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FlowerManagement] SET  MULTI_USER 
GO
ALTER DATABASE [FlowerManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlowerManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlowerManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlowerManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FlowerManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlowerManagement] SET QUERY_STORE = OFF
GO
USE [FlowerManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 26/04/2021 5:59:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[ID] [varchar](10) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistory]    Script Date: 26/04/2021 5:59:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistory](
	[historyID] [int] IDENTITY(1,1) NOT NULL,
	[productID] [varchar](10) NOT NULL,
	[userID] [varchar](10) NULL,
	[updateDate] [date] NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_tblHistory] PRIMARY KEY CLUSTERED 
(
	[historyID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 26/04/2021 5:59:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [varchar](10) NULL,
	[address] [varchar](500) NULL,
	[userPhoneNumber] [varchar](20) NULL,
	[dateOrder] [date] NULL,
	[timeOrder] [time](7) NULL,
	[totalPrice] [float] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 26/04/2021 5:59:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [varchar](10) NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 26/04/2021 5:59:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ID] [varchar](10) NOT NULL,
	[nameProduct] [nvarchar](100) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[createDate] [date] NOT NULL,
	[lastUpdateDate] [date] NULL,
	[lastUpdateUser] [varchar](10) NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[productStatus] [nvarchar](50) NULL,
	[categoryID] [varchar](10) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 26/04/2021 5:59:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[ID] [varchar](10) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[name] [nvarchar](100) NULL,
	[isAdmin] [bit] NOT NULL,
	[email] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([ID], [name]) VALUES (N'D', N'Flower')
GO
INSERT [dbo].[tblCategory] ([ID], [name]) VALUES (N'F', N'Gifts')
GO
SET IDENTITY_INSERT [dbo].[tblHistory] ON 
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1, N'ss10', N'se1', CAST(N'2021-04-14' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (2, N'ss11', N'se1', CAST(N'2021-04-14' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (3, N'ss2', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (4, N'ss12', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (5, N'ss4', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (6, N'ss10', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (7, N'ss12', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (8, N'ss8', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (9, N'ss8', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (10, N'ss7', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (11, N'ss3', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (12, N'ss8', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (13, N'ss10', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (159, N'ss12', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (160, N'ss12', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (161, N'ss10', N'se1', CAST(N'2021-04-19' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (162, N'ss11', N'se1', CAST(N'2021-04-19' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (163, N'ss12', N'se1', CAST(N'2021-04-19' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (164, N'ss12', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (165, N'ss11', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (166, N'ss10', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (167, N'ss11', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (168, N'ss11', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (169, N'ss12', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (170, N'ss32', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (171, N'ss65', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (172, N'ss65', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (173, N'ss65', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (174, N'ss32', N'se1', CAST(N'2021-04-15' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (175, N'ss65', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (176, N'ss99', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (177, N'ss99', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (178, N'ss9', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (179, N'ss99', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (180, N'ss99', N'se1', CAST(N'2021-04-15' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (181, N'ss11', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (182, N'ss11', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (183, N'ss11', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (184, N'ss12', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (185, N'ss32', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (186, N'ss65', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (187, N'ss9', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (188, N'ss99', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (189, N'ss81', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (190, N'ss88', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (191, N'ss7', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (192, N'ss4', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (193, N'ss5', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (194, N'ss2', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (195, N'ss32', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (196, N'ss9', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (197, N'ss99', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (198, N'ss81', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (199, N'ss88', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (200, N'ss7', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (201, N'ss4', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (202, N'ss5', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (203, N'ss65', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (204, N'ss3', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (205, N'ss8', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (206, N'ss70', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (207, N'ss300', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (208, N'ss10', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (209, N'ss92', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (210, N'ss120', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (211, N'ss302', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (212, N'ss20', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (213, N'ss31', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (214, N'T1', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (215, N'ss65', N'se1', CAST(N'2021-04-19' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (216, N'ss65', N'se1', CAST(N'2021-04-19' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (217, N'ss7', N'se1', CAST(N'2021-04-19' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (218, N'ss32', N'se1', CAST(N'2021-04-20' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (219, N'ss32', N'se1', CAST(N'2021-04-20' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1181, N'ss32', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1182, N'ss32', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1183, N'ss12', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1184, N'ss11', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1185, N'ss11', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1186, N'ss11', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1187, N'ss11', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1188, N'ss12', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1189, N'ss12', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1190, N'ss11', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1191, N'ss9', N'se1', CAST(N'2021-04-22' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1192, N'ss9', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1193, N'ss9', N'se1', CAST(N'2021-04-22' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1194, N'ss9', N'se1', CAST(N'2021-04-22' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1195, N'ss12', N'se1', CAST(N'2021-04-23' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1196, N'ss65', N'se1', CAST(N'2021-04-23' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1197, N'ss300', N'se1', CAST(N'2021-04-26' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1198, N'ss300', N'se1', CAST(N'2021-04-26' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1199, N'ss70', N'se1', CAST(N'2021-04-26' AS Date), N'Delete')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1200, N'ss3', N'se1', CAST(N'2021-04-26' AS Date), N'Update')
GO
INSERT [dbo].[tblHistory] ([historyID], [productID], [userID], [updateDate], [description]) VALUES (1201, N'ss3', N'se1', CAST(N'2021-04-26' AS Date), N'Update')
GO
SET IDENTITY_INSERT [dbo].[tblHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (5, N'se2', N'27 D2', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'20:56:20.2200000' AS Time), 9110000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (6, N'se2', N'298 No Trang Long', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'20:56:47.5130000' AS Time), 9110000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (7, N'se2', N'16C Ton Duc Thang', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'20:58:37.9500000' AS Time), 9110000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (8, N'se2', N'214/41 Huynh Tan Phat', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'20:59:52.8770000' AS Time), 9110000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (9, N'se2', N'04 Phan Dinh Phung', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'22:16:29.0400000' AS Time), 120000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (10, N'se2', N'82 Hung Vuong', N'0946235300', CAST(N'2021-01-19' AS Date), CAST(N'22:43:41.1470000' AS Time), 10320000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (11, N'se3', N'01 Tran Phu', N'012315112', CAST(N'2021-01-20' AS Date), CAST(N'07:29:48.7100000' AS Time), 200000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (12, N'se2', N'04 Hai Thuong Lan Ong', N'0946235300', CAST(N'2021-01-20' AS Date), CAST(N'07:30:30.5400000' AS Time), 8000000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (13, N'se2', N'61 Dong Xoai', N'0946235300', CAST(N'2021-01-20' AS Date), CAST(N'07:31:44.4670000' AS Time), 1600000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (14, N'se3', N'08 Mai Hac De', N'09123123', CAST(N'2021-01-20' AS Date), CAST(N'07:32:16.5800000' AS Time), 1600000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (15, N'se2', N'15 Ly Bon', N'0946235300', CAST(N'2021-02-19' AS Date), CAST(N'15:58:30.1070000' AS Time), 800000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (16, N'se2', N'29/78 Dien Bien Phu', N'0123456', CAST(N'2021-04-15' AS Date), CAST(N'20:07:08.6770000' AS Time), 200000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (17, N'se2', N'281 30/4', N'0123456', CAST(N'2021-04-19' AS Date), CAST(N'14:24:56.9230000' AS Time), 6000000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (18, N'se2', N'45 Quang Trung', N'12345', CAST(N'2021-04-19' AS Date), CAST(N'14:59:36.2170000' AS Time), 50000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (19, N'se2', N'12 Le Lai', N'0123456', CAST(N'2021-04-20' AS Date), CAST(N'21:45:36.7170000' AS Time), 300000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (20, N'se2', N'66 Phan Dinh Phung', N'0123456', CAST(N'2021-04-20' AS Date), CAST(N'21:47:31.1570000' AS Time), 1500000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (1017, N'se2', N'258 Phan Ðang Luu', N'0123456', CAST(N'2021-04-22' AS Date), CAST(N'21:55:13.4030000' AS Time), 200000)
GO
INSERT [dbo].[tblOrder] ([ID], [userID], [address], [userPhoneNumber], [dateOrder], [timeOrder], [totalPrice]) VALUES (1018, N'se2', N'222 Phan Ðang Luu', N'095268459', CAST(N'2021-04-22' AS Date), CAST(N'22:16:00.8730000' AS Time), 4000000)
GO
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (5, 5, N'ss3', 1, 9110000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (6, 8, N'ss3', 1, 9110000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (7, 8, N'ss12', 30, 9110000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (8, 8, N'ss8', 1, 9110000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (9, 8, N'ss20', 1, 9110000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (10, 9, N'ss3', 2, 120000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (11, 9, N'ss2', 1, 120000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (12, 9, N'ss5', 1, 120000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (13, 10, N'ss2', 1, 10320000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (14, 10, N'ss12', 1, 10320000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (15, 10, N'ss11', 100, 10320000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (16, 11, N'T1', 1, 200000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (17, 12, N'T1', 40, 8000000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (18, 13, N'T1', 8, 1600000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (19, 14, N'T1', 8, 1600000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (20, 15, N'ss65', 4, 800000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (21, 15, N'ss32', 2, 800000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (22, 16, N'ss32', 1, 200000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (23, 17, N'ss32', 30, 6000000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (24, 18, N'ss9', 1, 50000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (25, 19, N'ss12', 1, 300000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (26, 20, N'ss12', 5, 1500000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (1023, 1017, N'ss32', 1, 200000)
GO
INSERT [dbo].[tblOrderDetails] ([orderDetailsID], [orderID], [productID], [quantity], [price]) VALUES (1024, 1018, N'ss12', 10, 4000000)
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss10', N'Be Happy', N'https://assets.flowerstore.ph/uploads/products/photos/RtkDXStdPDHCBhkXblNyRbbtF5w7lNQtLnhvIlVs.png', N'A modern & stylish bag of bright', CAST(N'2021-01-12' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 100, 25000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss11', N'Sunburst', N'https://assets.flowerstore.vn/uploads/products/photos/HLodeMXdaG8tt7BSYrgWFhlmcimmbC9BVOpBjFyu.jpeg', N'Perfect for Valentine''s day', CAST(N'2020-01-08' AS Date), CAST(N'2021-04-22' AS Date), N'se1', 5, 30000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss12', N'Pinky', N'https://assets.flowerstore.ph/uploads/products/photos/FP5zNoDBN0XTXWIeogLXm69YCPoL6BJLoWkVAVCg.png', N'This elegant bouquet of pink gerberas', CAST(N'2020-01-08' AS Date), CAST(N'2021-04-23' AS Date), N'se1', 15, 400000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss120', N'Amethyst', N'https://assets.flowerstore.ph/uploads/products/photos/FuRfpy02q9IJBZJZdaHNO4bNOvruaCJqNdMdcynL.png', N'Get it with FREE Same Day Delivery!', CAST(N'2021-01-13' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 44, 200000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss2', N'Mother''s Square Box', N'https://assets.flowerstore.ph/uploads/products/photos/xBFryVmde5aBSwT01cZnk7AdlW9EK9MuCMOQuoya.png', N'Give this box to someone special, today!', CAST(N'2020-12-12' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 198, 20000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss20', N'Romantic Letter Box', N'https://assets.flowerstore.ph/uploads/products/photos/XIrRXP6da78FWr0ooDhOe7JzymbvXRtrtXn72bQ8.jpeg', N'Get it with FREE Same Day Delivery!', CAST(N'2021-01-17' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 19, 50000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss3', N'Pinky Mom Bundle', N'https://assets.flowerstore.ph/uploads/products/photos/hXQg4nF4KUtn9bsWapxJWIOP0qruivwgNlzUoJ0a.png', N'Product Exclusive for Mother''s Week Only', CAST(N'2020-12-12' AS Date), CAST(N'2021-04-26' AS Date), N'se1', 10, 30000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss300', N'Sunny Days', N'https://assets.flowerstore.ph/uploads/products/photos/2jT25bnOY9cMMRxdpeDGwHnqnwyaIn4jMHJpbrHN.png', N'Get it with FREE Same Day Delivery', CAST(N'2021-01-11' AS Date), CAST(N'2021-04-26' AS Date), N'se1', 60, 300000, N'Inactive', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss302', N'Gold Jewelry Set', N'https://assets.flowerstore.ph/uploads/products/photos/hRh4OWgvOYvPJu5Qeb09CnjyK5w9AGQWafXdKDDO.png', N'Get it with FREE Same Day Delivery!', CAST(N'2021-01-14' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 20, 80000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss31', N'Pretty in Pink', N'https://assets.flowerstore.ph/uploads/products/photos/3mHVCkrQgCqAJ7LNKhkPXGr3o1Pn2iwN31CzsuYx.jpeg', N'Get it with FREE Same Day Delivery!', CAST(N'2021-01-18' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 30, 300000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss32', N'Blue Eternal Heart Box', N'https://assets.flowerstore.ph/uploads/products/photos/mH2fztsJEX4KUYEyenMLLSkKyZWkkdFqgKCCWpOz.png', N'Perfect for Valentine''s day', CAST(N'2020-01-08' AS Date), CAST(N'2021-04-22' AS Date), N'se1', 9, 200000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss4', N'My Darling', N'https://assets.flowerstore.ph/uploads/products/photos/5imzRl386sLt9uA3rMD1r3bImXZn0DbDzYNw2nIA.jpeg', N'Perfect for Valentine''s day', CAST(N'2020-12-12' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 20, 40000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss5', N'Pure Love', N'https://assets.flowerstore.ph/uploads/products/photos/VmeGdq7iOG5Q5BAoOZRHM0AJSbYlJgSMnUsYPkvT.jpeg', N'Perfect for Valentine''s day', CAST(N'2020-12-12' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 100, 40000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss65', N'Rose Jewelry Bundle', N'https://assets.flowerstore.ph/uploads/products/photos/HS2sbDAdrNQMs5wTrhjdkvLw1nvxSf01qvbBdmz9.png', N'Perfect for Valentine''s day', CAST(N'2020-01-08' AS Date), CAST(N'2021-04-23' AS Date), N'se1', 15, 100000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss7', N'Chocolate Love', N'https://assets.flowerstore.ph/uploads/products/photos/bMY0zQepLageIUcMqE8XgyD1ePgOIqZt2NxBrY3o.jpeg', N'Perfect for Valentine''s day', CAST(N'2020-12-12' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 100, 50000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss70', N'Romance Bundle', N'https://assets.flowerstore.ph/uploads/products/photos/7BC53y4Aps8jEfmD9B0DfcdM2OB6MZAHVfk3fLMn.jpeg', N'Get it with FREE Same Day Delivery!', CAST(N'2021-01-10' AS Date), CAST(N'2021-04-26' AS Date), N'se1', 90, 200000, N'Inactive', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss8', N'Mom''s Red Surprise Box', N'https://assets.flowerstore.ph/uploads/products/photos/f0VlrqTsJjhoByY7zegPIenOIvUfbYGCvPkSSyoN.png', N'Get it with FREE Same Day Delivery!', CAST(N'2020-12-13' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 10, 30000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss81', N'Mixed Eternal Love Box', N'https://assets.flowerstore.ph/uploads/products/photos/SbJebljdxLrTDf5WVY5otxHtUlsVRrZPXXXP2wAZ.png', N'Perfect for Valentine''s day', CAST(N'2020-01-09' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 25, 70000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss88', N'Purple Warmth', N'https://assets.flowerstore.ph/uploads/products/photos/wGVdt6ljlJhwbmHNsqHcHCZjFbi6F367YFw50pp2.jpeg', N'Perfect for Valentine''s day', CAST(N'2020-01-09' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 20, 50000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss9', N'Sunset Love', N'https://assets.flowerstore.ph/uploads/products/photos/vMNGxK96Qbs4yzuDsg4NiILMTsbrdr7leUf1oiZB.jpeg', N'Perfect for Valentine''s day', CAST(N'2020-01-08' AS Date), CAST(N'2021-04-22' AS Date), N'se1', 21, 50000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss92', N'Nightshade', N'https://assets.flowerstore.ph/uploads/products/photos/IDt4jpWT1ldkWcj5LaOZ6bl1YwY5TluGy98Chr6N.png', N'Get it with FREE Same Day Delivery!', CAST(N'2021-01-12' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 20, 120000, N'Active', N'F')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'ss99', N'Dark Red Eternal Love Box', N'https://assets.flowerstore.ph/uploads/products/photos/hYc1wPGhzE2JsbJdjR0YoG5qyAmuYXJLMpNWB3Uw.png', N'Perfect for Valentine''s day', CAST(N'2020-01-09' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 55, 30000, N'Active', N'D')
GO
INSERT [dbo].[tblProduct] ([ID], [nameProduct], [image], [description], [createDate], [lastUpdateDate], [lastUpdateUser], [quantity], [price], [productStatus], [categoryID]) VALUES (N'T1', N'Lovelle', N'https://assets.flowerstore.ph/uploads/products/photos/A5NhJuI3kjakekL3Vz1EazqXCK2GlLr35PuclNxR.png', N'Get it with FREE Same Day Delivery!', CAST(N'2021-01-20' AS Date), CAST(N'2021-04-19' AS Date), N'se1', 15, 20000, N'Active', N'F')
GO
INSERT [dbo].[tblUser] ([ID], [password], [name], [isAdmin], [email]) VALUES (N'se1', N'123', N'Cong Minh', 1, N'minh@gmail.com')
GO
INSERT [dbo].[tblUser] ([ID], [password], [name], [isAdmin], [email]) VALUES (N'se2', N'123', N'Nguyen Thi Phuong Uyen', 0, N'uyen@gmail.com')
GO
INSERT [dbo].[tblUser] ([ID], [password], [name], [isAdmin], [email]) VALUES (N'se3', N'123', N'Ly Phuong Man', 0, N'man@gmail.com')
GO
INSERT [dbo].[tblUser] ([ID], [password], [name], [isAdmin], [email]) VALUES (N'se5', N'123', N'Ly Minh Thien', 1, N'thien@gmail.com')
GO
ALTER TABLE [dbo].[tblHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblHistory_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([ID])
GO
ALTER TABLE [dbo].[tblHistory] CHECK CONSTRAINT [FK_tblHistory_tblProduct]
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD  CONSTRAINT [FK_tblOrder_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([ID])
GO
ALTER TABLE [dbo].[tblOrder] CHECK CONSTRAINT [FK_tblOrder_tblUser]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrder] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([ID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrder]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProduct] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([ID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblProduct]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblUser] FOREIGN KEY([lastUpdateUser])
REFERENCES [dbo].[tblUser] ([ID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblUser]
GO
USE [master]
GO
ALTER DATABASE [FlowerManagement] SET  READ_WRITE 
GO
