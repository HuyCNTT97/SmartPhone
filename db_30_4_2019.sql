USE [master]
GO
/****** Object:  Database [SmartPhoneTestSomee]    Script Date: 4/30/2020 6:57:56 PM ******/
CREATE DATABASE [SmartPhoneTestSomee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartPhoneTestSomee', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SmartPhoneTestSomee.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SmartPhoneTestSomee_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SmartPhoneTestSomee_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SmartPhoneTestSomee] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartPhoneTestSomee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartPhoneTestSomee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET  MULTI_USER 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartPhoneTestSomee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SmartPhoneTestSomee] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SmartPhoneTestSomee]
GO
/****** Object:  Table [dbo].[ApplicationGroups]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.ApplicationGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationRoleGroups]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRoleGroups](
	[GroupId] [int] NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.ApplicationRoleGroups] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationRoles]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](250) NULL,
	[Discriminator] [nvarchar](128) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_dbo.ApplicationRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationUserClaims]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ApplicationUserClaims] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationUserGroups]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserGroups](
	[UserId] [nvarchar](128) NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.ApplicationUserGroups] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationUserLogins]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ApplicationUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationUserRoles]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[IdentityRole_Id] [nvarchar](128) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ApplicationUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ApplicationUsers]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FullName] [nvarchar](256) NULL,
	[Address] [nvarchar](256) NULL,
	[BirthDay] [datetime] NULL,
	[Email] [nvarchar](max) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ApplicationUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Phone] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Errors]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Errors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Errors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Footers]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Footers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.Footers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuGroups]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.MenuGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menus]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[URL] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NULL,
	[GroupID] [int] NOT NULL,
	[Target] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Menus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Promotion] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Shipping] [bit] NOT NULL,
	[Payment] [bit] NOT NULL,
	[WarrantyID] [int] NOT NULL,
	[Color] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC,
	[Color] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nvarchar](max) NULL,
	[NameShip] [nvarchar](250) NOT NULL,
	[AddressShip] [nvarchar](250) NOT NULL,
	[PhoneShip] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[GiaoDuHang] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL DEFAULT ('1900-01-01T00:00:00.000'),
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Content] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.Pages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Alias] [nvarchar](250) NOT NULL,
	[CreateBy] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[DisplayOrder] [int] NULL,
	[HomeFlag] [bit] NOT NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.PostCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PostCategoryID] [int] NOT NULL,
	[Alias] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreateBy] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[HomeFlag] [bit] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaKeyword] [nvarchar](150) NULL,
	[Name] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime] NULL,
	[ViewCount] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PostTags]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostTags](
	[PostID] [int] NOT NULL,
	[TagID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.PostTags] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PriceHistories]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceHistories](
	[ProductID] [int] NOT NULL,
	[UpdateBy] [nvarchar](100) NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Promotion] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.PriceHistories] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[UpdateBy] ASC,
	[UpdateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[Image] [nvarchar](max) NULL,
	[Alias] [nvarchar](250) NOT NULL,
	[CreateBy] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[DisplayOrder] [int] NULL,
	[HomeFlag] [bit] NOT NULL,
	[MetaDescription] [nvarchar](250) NULL,
	[MetaKeyword] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Status] [bit] NOT NULL,
	[UpdateBy] [nvarchar](250) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_dbo.ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[MoreImages] [xml] NULL,
	[HotFlag] [bit] NOT NULL,
	[Specifications] [nvarchar](250) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Promotion] [decimal](18, 2) NOT NULL,
	[Alias] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreateBy] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DisplayOrder] [int] NULL,
	[HomeFlag] [bit] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[MetaKeyword] [nvarchar](150) NULL,
	[Name] [nvarchar](250) NULL,
	[Status] [bit] NOT NULL,
	[UpdateBy] [nvarchar](max) NULL,
	[UpdatedDate] [datetime] NULL,
	[ViewCount] [int] NOT NULL,
	[OriginalQuantity] [int] NOT NULL DEFAULT ((0)),
	[OriginalPrice] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTags](
	[ProductID] [int] NOT NULL,
	[TagID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.ProductTags] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Slides]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slides](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
	[Image] [nvarchar](max) NULL,
	[URL] [nvarchar](250) NULL,
	[DisplayOrder] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Slides] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SuppostOnlines]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuppostOnlines](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Department] [nvarchar](50) NULL,
	[Skype] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[DisplayOrder] [int] NULL,
 CONSTRAINT [PK_dbo.SuppostOnlines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SystemConfigs]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SystemConfigs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[ValueString] [nvarchar](50) NULL,
	[ValueInt] [int] NULL,
 CONSTRAINT [PK_dbo.SystemConfigs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Type] [varchar](100) NOT NULL,
 CONSTRAINT [PK_dbo.Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VisitorStatistics]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisitorStatistics](
	[ID] [uniqueidentifier] NOT NULL,
	[VisitedDate] [datetime] NOT NULL,
	[IPAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.VisitorStatistics] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warranties]    Script Date: 4/30/2020 6:57:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warranties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[WarrantyOld] [nvarchar](150) NULL,
	[WarrantyNew] [nvarchar](150) NULL,
	[TimeInnovation] [nvarchar](150) NULL,
	[FixTime] [nvarchar](150) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Warranties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ApplicationGroups] ON 

INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (2, N'nhóm quản lí', NULL)
INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (3, N'nhóm bán hàng, thu ngân', NULL)
INSERT [dbo].[ApplicationGroups] ([ID], [Name], [Description]) VALUES (4, N'Khách hàng', NULL)
SET IDENTITY_INSERT [dbo].[ApplicationGroups] OFF
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId]) VALUES (3, N'54d8f89e-91c3-4a27-8a5b-e69b1920fe38')
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId]) VALUES (4, N'a0f40557-42d2-4ac0-855d-45330802cf77')
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId]) VALUES (2, N'fb6ace83-56b3-4463-a381-c2298f2798d5')
INSERT [dbo].[ApplicationRoleGroups] ([GroupId], [RoleId]) VALUES (3, N'fb6ace83-56b3-4463-a381-c2298f2798d5')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'2b2060cd-c76f-49d7-bec2-e82a22d10c2a', N'User', NULL, N'')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'54d8f89e-91c3-4a27-8a5b-e69b1920fe38', N'bán hàng', N'các quyền bán hàng', N'ApplicationRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'9101a3d6-adbf-4826-aebe-15ddb22f67eb', N'Employee', NULL, N'')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'9210e023-df3d-492e-9f41-715e18ab978a', N'Admin', NULL, N'IdentityRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'a0f40557-42d2-4ac0-855d-45330802cf77', N'Khách hàng', N'quyền của khách hàng', N'ApplicationRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'e1cd34d0-6f1b-4275-ab2a-98fed323288f', N'Employee', NULL, N'IdentityRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'ec4543d0-9f32-469b-8d61-43d0192a8ae4', N'Admin', NULL, N'')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'fb6ace83-56b3-4463-a381-c2298f2798d5', N'quản lí', N'được thao tác tất cả công việc', N'ApplicationRole')
INSERT [dbo].[ApplicationRoles] ([Id], [Name], [Description], [Discriminator]) VALUES (N'fc7997ac-550d-47c2-9039-1b9864477c0c', N'User', NULL, N'IdentityRole')
INSERT [dbo].[ApplicationUserGroups] ([UserId], [GroupId]) VALUES (N'4f9e011c-678c-4844-a91b-33aa83122d22', 2)
INSERT [dbo].[ApplicationUserLogins] ([UserId], [LoginProvider], [ProviderKey], [ApplicationUser_Id]) VALUES (N'09a7c63c-d5f7-445c-a0e9-2227e72bd91a', N'Google', N'113781083966074973255', NULL)
INSERT [dbo].[ApplicationUserLogins] ([UserId], [LoginProvider], [ProviderKey], [ApplicationUser_Id]) VALUES (N'45aa8e63-aa9e-4b6e-849a-b52343fb334f', N'Google', N'105116595227029857496', NULL)
INSERT [dbo].[ApplicationUserLogins] ([UserId], [LoginProvider], [ProviderKey], [ApplicationUser_Id]) VALUES (N'4b72d365-a891-44fb-96ed-a6e2e6e6ce54', N'Facebook', N'2207420062707238', NULL)
INSERT [dbo].[ApplicationUserLogins] ([UserId], [LoginProvider], [ProviderKey], [ApplicationUser_Id]) VALUES (N'6ba38adc-599d-4543-bfa0-35860416c8e1', N'Google', N'105116595227029857496', NULL)
INSERT [dbo].[ApplicationUserLogins] ([UserId], [LoginProvider], [ProviderKey], [ApplicationUser_Id]) VALUES (N'983b3356-4afa-49bf-b861-2c681b706aab', N'Google', N'112145792162415896753', NULL)
INSERT [dbo].[ApplicationUserLogins] ([UserId], [LoginProvider], [ProviderKey], [ApplicationUser_Id]) VALUES (N'f4902e4e-fe2b-4ef6-9889-b3ca53dece89', N'Google', N'113781083966074973255', NULL)
INSERT [dbo].[ApplicationUserLogins] ([UserId], [LoginProvider], [ProviderKey], [ApplicationUser_Id]) VALUES (N'fe6c9de6-bb0f-4305-a530-fcb29e587935', N'Google', N'100013880347793218869', NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0613dfe8-aa4b-4a75-8c4a-b5327ece5178', N'54d8f89e-91c3-4a27-8a5b-e69b1920fe38', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0613dfe8-aa4b-4a75-8c4a-b5327ece5178', N'9101a3d6-adbf-4826-aebe-15ddb22f67eb', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0613dfe8-aa4b-4a75-8c4a-b5327ece5178', N'9210e023-df3d-492e-9f41-715e18ab978a', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0613dfe8-aa4b-4a75-8c4a-b5327ece5178', N'e1cd34d0-6f1b-4275-ab2a-98fed323288f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0613dfe8-aa4b-4a75-8c4a-b5327ece5178', N'ec4543d0-9f32-469b-8d61-43d0192a8ae4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0613dfe8-aa4b-4a75-8c4a-b5327ece5178', N'fb6ace83-56b3-4463-a381-c2298f2798d5', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0ae9c56a-f0ae-4c83-8868-47c0d832ccdc', N'fb6ace83-56b3-4463-a381-c2298f2798d5', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'0ae9c56a-f0ae-4c83-8868-47c0d832ccdc', N'fc7997ac-550d-47c2-9039-1b9864477c0c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'10372ed1-af08-4c97-a318-be5dd12f894a', N'a0f40557-42d2-4ac0-855d-45330802cf77', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'3fe43657-c1fe-4bc9-b6a4-61c92fa318ea', N'2b2060cd-c76f-49d7-bec2-e82a22d10c2a', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'42f6a255-fdb2-46f4-bfd7-c5d9d8e829ac', N'fc7997ac-550d-47c2-9039-1b9864477c0c', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'4f9e011c-678c-4844-a91b-33aa83122d22', N'fb6ace83-56b3-4463-a381-c2298f2798d5', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'5a4aac0d-91be-427f-b9b5-d30911f3e9cb', N'fb6ace83-56b3-4463-a381-c2298f2798d5', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'5f7f23b9-8d81-43ef-a76d-d1f6092ce9a5', N'2b2060cd-c76f-49d7-bec2-e82a22d10c2a', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'6cce3638-2b6f-4601-a903-cf044af3da5a', N'9101a3d6-adbf-4826-aebe-15ddb22f67eb', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'6cce3638-2b6f-4601-a903-cf044af3da5a', N'9210e023-df3d-492e-9f41-715e18ab978a', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'6cce3638-2b6f-4601-a903-cf044af3da5a', N'e1cd34d0-6f1b-4275-ab2a-98fed323288f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'6cce3638-2b6f-4601-a903-cf044af3da5a', N'ec4543d0-9f32-469b-8d61-43d0192a8ae4', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b06d64ce-1473-493f-bacb-a68f6e0a810f', N'9101a3d6-adbf-4826-aebe-15ddb22f67eb', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'b06d64ce-1473-493f-bacb-a68f6e0a810f', N'e1cd34d0-6f1b-4275-ab2a-98fed323288f', NULL, NULL)
INSERT [dbo].[ApplicationUserRoles] ([UserId], [RoleId], [IdentityRole_Id], [ApplicationUser_Id]) VALUES (N'c7085de0-ae70-4cd2-a4ac-30b2fe58ca35', N'fb6ace83-56b3-4463-a381-c2298f2798d5', NULL, NULL)
INSERT [dbo].[ApplicationUsers] ([Id], [FullName], [Address], [BirthDay], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1b722a30-4f9d-4a23-a47d-88655a38cbdb', N'hoang huy', N'377 đinh bộ lĩnh', NULL, N'hoanghuy97cntt@gmail.com', 1, N'ACMq2lDKpg83lMnhgAQyVpqUP4mr7dI66ynWfw8oWGX7hcrXuMXTMPVXXc13ziX4GA==', N'5d24e2f6-842d-41fd-9342-9fff4c97ebe2', N'+16068879944', 1, 0, NULL, 1, 0, N'hoanghuy97cntt@gmail.com')
INSERT [dbo].[ApplicationUsers] ([Id], [FullName], [Address], [BirthDay], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4f9e011c-678c-4844-a91b-33aa83122d22', N'Hoang huy', NULL, CAST(N'1996-02-03 17:00:00.000' AS DateTime), N'admin@hoanghuy97cntt.somee.com', 0, N'ABXWnIvHcrku2pOyuNYPMQl1stlDKYBE2jm0+9UlwcBqFha4Qxm2na950c/+eNBzUg==', N'a123dd1f-cd64-4c3f-81d0-c735745e43e6', N'093213212', 0, 0, NULL, 0, 0, N'Admin')
SET IDENTITY_INSERT [dbo].[Errors] ON 

INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (1, N'Error mapping types.

Mapping types:
IEnumerable`1 -> IEnumerable`1
System.Collections.Generic.IEnumerable`1[[SmartPhoneShop.Model.Model.ApplicationUser, SmartPhoneShop.Model, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]] -> System.Collections.Generic.IEnumerable`1[[SmartPhoneShop.Web.Models.ApplicationUserViewModel, SmartPhoneShop.Web, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]', N'   at lambda_method(Closure , IEnumerable`1 , IEnumerable`1 , ResolutionContext )
   at SmartPhoneShop.Web.Api.ApplicationUserController.<>c__DisplayClass4_0.<GetListPaging>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Controllers\ApplicationUserController.cs:line 49
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-04-21 23:23:53.740' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (2, N'Error mapping types.

Mapping types:
IEnumerable`1 -> IEnumerable`1
System.Collections.Generic.IEnumerable`1[[SmartPhoneShop.Model.Model.ApplicationUser, SmartPhoneShop.Model, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]] -> System.Collections.Generic.IEnumerable`1[[SmartPhoneShop.Web.Models.ApplicationUserViewModel, SmartPhoneShop.Web, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]', N'   at lambda_method(Closure , IEnumerable`1 , IEnumerable`1 , ResolutionContext )
   at SmartPhoneShop.Web.Api.ApplicationUserController.<>c__DisplayClass4_0.<GetListPaging>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Controllers\ApplicationUserController.cs:line 49
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-04-21 23:24:20.903' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (3, N'Error mapping types.

Mapping types:
IEnumerable`1 -> IEnumerable`1
System.Collections.Generic.IEnumerable`1[[SmartPhoneShop.Model.Model.ApplicationUser, SmartPhoneShop.Model, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]] -> System.Collections.Generic.IEnumerable`1[[SmartPhoneShop.Web.Models.ApplicationUserViewModel, SmartPhoneShop.Web, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]', N'   at lambda_method(Closure , IEnumerable`1 , IEnumerable`1 , ResolutionContext )
   at SmartPhoneShop.Web.Api.ApplicationUserController.<>c__DisplayClass4_0.<GetListPaging>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Controllers\ApplicationUserController.cs:line 49
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-04-21 23:30:43.087' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (4, N'Error mapping types.

Mapping types:
DbQuery`1 -> List`1
System.Data.Entity.Infrastructure.DbQuery`1[[SmartPhoneShop.Model.Model.Order, SmartPhoneShop.Model, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]] -> System.Collections.Generic.List`1[[SmartPhoneShop.Web.Models.OrderViewModel, SmartPhoneShop.Web, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]]', N'   at lambda_method(Closure , Object , Object , ResolutionContext )
   at SmartPhoneShop.Web.API.OrderController.<>c__DisplayClass2_0.<Get>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\OrderController.cs:line 34
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-04-22 18:15:45.497' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (5, N'LINQ to Entities does not recognize the method ''System.String ToShortDateString()'' method, and this method cannot be translated into a store expression.', N'   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.EqualsTranslator.TypedTranslate(ExpressionConverter parent, BinaryExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input, DbExpressionBinding& binding)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.GroupByTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-07 00:07:00.843' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (6, N'LINQ to Entities does not recognize the method ''System.String ToShortDateString()'' method, and this method cannot be translated into a store expression.', N'   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.EqualsTranslator.TypedTranslate(ExpressionConverter parent, BinaryExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input, DbExpressionBinding& binding)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.GroupByTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(Int32 type) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 29
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(Int32 typeFilter) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-07 00:16:44.603' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (7, N'LINQ to Entities does not recognize the method ''System.String ToShortDateString()'' method, and this method cannot be translated into a store expression.', N'   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.EqualsTranslator.TypedTranslate(ExpressionConverter parent, BinaryExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input, DbExpressionBinding& binding)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.GroupByTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(Int32 type) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 29
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(Int32 typeFilter) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-07 00:17:11.697' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (8, N'LINQ to Entities does not recognize the method ''System.String ToShortDateString()'' method, and this method cannot be translated into a store expression.', N'   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.EqualsTranslator.TypedTranslate(ExpressionConverter parent, BinaryExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input, DbExpressionBinding& binding)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.GroupByTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultIfEmptyTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-07 00:19:54.897' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (9, N'LINQ to Entities does not recognize the method ''System.String ToShortDateString()'' method, and this method cannot be translated into a store expression.', N'   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.NewTranslator.TypedTranslate(ExpressionConverter parent, NewExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input, DbExpressionBinding& binding)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(Int32 type) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 29
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(Int32 typeFilter) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-07 21:21:00.797' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (10, N'LINQ to Entities does not recognize the method ''System.String ToShortDateString()'' method, and this method cannot be translated into a store expression.', N'   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.DefaultTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.NewTranslator.TypedTranslate(ExpressionConverter parent, NewExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input, DbExpressionBinding& binding)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(Int32 type) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 29
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(Int32 typeFilter) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-07 21:22:39.477' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (11, N'The specified type member ''Date'' is not supported in LINQ to Entities. Only initializers, entity members, and entity navigation properties are supported.', N'   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MemberAccessTranslator.TypedTranslate(ExpressionConverter parent, MemberExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.NewTranslator.TypedTranslate(ExpressionConverter parent, NewExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateLambda(LambdaExpression lambda, DbExpression input, DbExpressionBinding& binding)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.OneLambdaTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, DbExpression& source, DbExpressionBinding& sourceBinding, DbExpression& lambda)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SelectTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Entity.Core.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Entity.Core.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__6()
   at System.Data.Entity.Core.Objects.ObjectContext.ExecuteInTransaction[T](Func`1 func, IDbExecutionStrategy executionStrategy, Boolean startLocalTransaction, Boolean releaseConnectionOnSuccess)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<>c__DisplayClass7.<GetResults>b__5()
   at System.Data.Entity.SqlServer.DefaultSqlExecutionStrategy.Execute[TResult](Func`1 operation)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Entity.Core.Objects.ObjectQuery`1.<System.Collections.Generic.IEnumerable<T>.GetEnumerator>b__0()
   at System.Data.Entity.Internal.LazyEnumerator`1.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(Int32 type) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 29
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(Int32 typeFilter) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-07 21:32:46.143' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (12, N'String was not recognized as a valid DateTime.', N'   at System.DateTimeParse.Parse(String s, DateTimeFormatInfo dtfi, DateTimeStyles styles)
   at System.DateTime.Parse(String s)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 40
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-08 15:00:08.520' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (13, N'String was not recognized as a valid DateTime.', N'   at System.DateTimeParse.Parse(String s, DateTimeFormatInfo dtfi, DateTimeStyles styles)
   at System.DateTime.Parse(String s)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 41
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-31 21:59:35.057' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (14, N'String was not recognized as a valid DateTime.', N'   at System.DateTimeParse.Parse(String s, DateTimeFormatInfo dtfi, DateTimeStyles styles)
   at System.DateTime.Parse(String s)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 41
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-31 21:59:36.837' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (15, N'String was not recognized as a valid DateTime.', N'   at System.DateTimeParse.Parse(String s, DateTimeFormatInfo dtfi, DateTimeStyles styles)
   at System.DateTime.Parse(String s)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 41
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-31 21:59:53.123' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (16, N'String was not recognized as a valid DateTime.', N'   at System.DateTimeParse.Parse(String s, DateTimeFormatInfo dtfi, DateTimeStyles styles)
   at System.DateTime.Parse(String s)
   at SmartPhoneShop.Data.Repositories.OrderRepository.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Data\Repositories\OrderRepository.cs:line 41
   at SmartPhoneShop.Service.OrderService.GetStatisticDates(String fromDate, String toDate) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\OrdersService.cs:line 92
   at SmartPhoneShop.Web.API.StatisticController.<>c__DisplayClass2_0.<GetRevenuesStatistic>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\StatisticController.cs:line 27
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-05-31 22:05:49.427' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (17, N'Object reference not set to an instance of an object.', N'   at SmartPhoneShop.Service.CustomerService.GetName(String id) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Service\CustomerService.cs:line 89
   at SmartPhoneShop.Web.API.OrderController.<>c__DisplayClass4_0.<GetAll>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\OrderController.cs:line 58
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-07-08 01:00:13.360' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (18, N'Object reference not set to an instance of an object.', N'   at SmartPhoneShop.Web.API.OrderController.<>c__DisplayClass4_0.<GetAll>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\OrderController.cs:line 59
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-07-08 01:15:10.353' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (19, N'Object reference not set to an instance of an object.', N'   at SmartPhoneShop.Web.API.OrderController.<>c__DisplayClass4_0.<GetAll>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\OrderController.cs:line 59
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-07-08 01:19:04.690' AS DateTime))
INSERT [dbo].[Errors] ([ID], [Message], [StackTrace], [CreatedDate]) VALUES (20, N'Object reference not set to an instance of an object.', N'   at SmartPhoneShop.Web.API.OrderController.<>c__DisplayClass4_0.<GetAll>b__0() in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\API\OrderController.cs:line 59
   at SmartPhoneShop.Web.Infrasture.Core.ApiControllerBase.CreateHttpResponse(HttpRequestMessage message, Func`1 func) in D:\Github Huy\SmartPhoneShop\SmartPhoneShop.Web\Infrasture\Core\ApiControllerBase.cs:line 29', CAST(N'2019-07-08 01:20:08.187' AS DateTime))
SET IDENTITY_INSERT [dbo].[Errors] OFF
SET IDENTITY_INSERT [dbo].[MenuGroups] ON 

INSERT [dbo].[MenuGroups] ([ID], [Name]) VALUES (1, N'MENU NGANG')
SET IDENTITY_INSERT [dbo].[MenuGroups] OFF
SET IDENTITY_INSERT [dbo].[Menus] ON 

INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [GroupID], [Target], [Status]) VALUES (1, N'TRANG CHỦ', N'/', 1, 1, N'_seft', 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [GroupID], [Target], [Status]) VALUES (2, N'ĐIỆN THOẠI', N'/dien-thoai-1', 1, 1, N'_seft', 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [GroupID], [Target], [Status]) VALUES (3, N'IPHONE', N'/iphone-2
', 1, 1, N'_seft', 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [GroupID], [Target], [Status]) VALUES (4, N'SAMSUNG', N'/samsung-8
', 1, 1, N'_seft', 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [GroupID], [Target], [Status]) VALUES (5, N'XIAOMI', N'/xiaomi-11
', 1, 1, N'_seft', 1)
INSERT [dbo].[Menus] ([ID], [Name], [URL], [DisplayOrder], [GroupID], [Target], [Status]) VALUES (6, N'CAMERA', N'/camera-12', 1, 1, N'_seft', 1)
SET IDENTITY_INSERT [dbo].[Menus] OFF
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (2, 20, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (2, 21, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 2, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (2, 27, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (3, 21, CAST(14999000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (4, 19, CAST(15690000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 8, 0, 0, 1, N'đen')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (4, 19, CAST(15490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (4, 21, CAST(15490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (4, 29, CAST(15490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (12, 31, CAST(8990000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (18, 13, CAST(4490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (31, 21, CAST(23490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (32, 12, CAST(8990000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 3, 0, 0, 1, N'vàngđất')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (32, 28, CAST(8990000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (38, 13, CAST(4990000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, 0, 0, 1, N'đỏ')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (38, 13, CAST(4490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (38, 15, CAST(4490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (39, 17, CAST(12990000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (101, 26, CAST(15390000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (102, 8, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (102, 8, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, 0, 0, 1, N'vàngđất')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (102, 9, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (102, 9, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, 0, 0, 1, N'vàngđất')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (102, 18, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (102, 25, CAST(20909000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (103, 9, CAST(14999000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (103, 10, CAST(14999000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, 0, 0, 1, N'vàngđất')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (103, 11, CAST(14999000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, 0, 0, 1, N'vàngđất')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (103, 12, CAST(14999000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (103, 18, CAST(14999000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (103, 24, CAST(14999000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (104, 10, CAST(15490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (104, 11, CAST(15490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (104, 14, CAST(15490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (121, 22, CAST(15390000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (121, 23, CAST(15390000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (121, 30, CAST(15390000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (231, 33, CAST(23490000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (232, 16, CAST(8990000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 4, 0, 0, 1, N'vàngđất')
INSERT [dbo].[OrderDetails] ([ProductID], [OrderID], [Price], [Promotion], [Quantity], [Shipping], [Payment], [WarrantyID], [Color]) VALUES (232, 32, CAST(8990000.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 1, 0, 0, 1, N'trắng')
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (8, N'aae36ce4-fd40-41cf-9315-420de424c704', N'Huy', N'123', N'123', CAST(N'2019-04-22 16:03:51.630' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (9, N'aae36ce4-fd40-41cf-9315-420de424c704', N'Huy', N'123', N'123', CAST(N'2019-04-22 19:27:20.043' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (10, N'0613dfe8-aa4b-4a75-8c4a-b5327ece5178', N'Nguyen Le Hoang Huy', N'DH giao thong van tai', N'123456', CAST(N'2019-04-28 22:55:19.580' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (11, N'50fb35c8-1e9d-4960-a37b-b6af124ad05a', N'hoang huy', N'123', N'123', CAST(N'2019-04-28 23:08:30.100' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (12, N'50fb35c8-1e9d-4960-a37b-b6af124ad05a', N'hoang huy', N'123', N'123', CAST(N'2019-04-30 15:29:55.973' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (13, N'50fb35c8-1e9d-4960-a37b-b6af124ad05a', N'hoang huy', N'123', N'123', CAST(N'2019-04-30 15:35:04.097' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (14, N'50fb35c8-1e9d-4960-a37b-b6af124ad05a', N'hoang huy', N'123', N'123', CAST(N'2019-04-30 15:41:11.677' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (15, N'50fb35c8-1e9d-4960-a37b-b6af124ad05a', N'hoang huy', N'123', N'123', CAST(N'2019-04-30 16:03:06.757' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (16, N'42f6a255-fdb2-46f4-bfd7-c5d9d8e829ac', N'Phuong lan', N'123', N'123', CAST(N'2019-04-30 16:08:26.463' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (17, N'ee9b3c9f-31ae-410f-a7d8-beb8fbf78733', N'Phuong lan', N'123', N'123', CAST(N'2019-04-30 16:13:02.103' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (18, N'ee9b3c9f-31ae-410f-a7d8-beb8fbf78733', N'Phuong lan', N'123', N'123', CAST(N'2019-04-30 18:58:09.787' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (19, N'50fb35c8-1e9d-4960-a37b-b6af124ad05a', N'hoang huy', N'123', N'123', CAST(N'2019-05-01 00:16:12.737' AS DateTime), 0, CAST(N'2019-05-07 21:12:49.117' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (20, N'50fb35c8-1e9d-4960-a37b-b6af124ad05a', N'hoang huy', N'123', N'123', CAST(N'2019-05-08 15:52:39.277' AS DateTime), 0, CAST(N'2019-05-08 15:52:39.277' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (21, N'10372ed1-af08-4c97-a318-be5dd12f894a', N'Hoàng Huy', N'hyht', N'978962224', CAST(N'2019-07-10 18:57:19.993' AS DateTime), 0, CAST(N'2019-05-09 22:08:07.363' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (22, N'6ba38adc-599d-4543-bfa0-35860416c8e1', N'sdasd', N'sadasdasda', N'12321', CAST(N'2019-06-12 17:09:36.387' AS DateTime), 0, CAST(N'2019-06-12 17:09:36.387' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (23, N'6ba38adc-599d-4543-bfa0-35860416c8e1', N'sdasd', N'sadasdasda', N'12321', CAST(N'2019-06-12 17:11:17.630' AS DateTime), 0, CAST(N'2019-06-12 17:11:17.630' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (24, N'6ba38adc-599d-4543-bfa0-35860416c8e1', N'ádsadsadsad', N'sadsadsadas', N'1233', CAST(N'2019-06-12 17:16:19.407' AS DateTime), 0, CAST(N'2019-06-12 17:16:18.893' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (25, N'fe6c9de6-bb0f-4305-a530-fcb29e587935', N'ddsa', N'ewqew', N'1000000000', CAST(N'2019-06-12 18:47:20.383' AS DateTime), 0, CAST(N'2019-06-12 18:47:20.383' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (26, N'fe6c9de6-bb0f-4305-a530-fcb29e587935', N'Phuong lan', N'34e432', N'2132132132321', CAST(N'2019-06-12 19:15:33.040' AS DateTime), 0, CAST(N'2019-06-12 19:15:33.040' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (27, N'10372ed1-af08-4c97-a318-be5dd12f894a', N'Hoàng Huy', N'33 to ky', N'0978962224', CAST(N'2019-06-13 00:36:00.817' AS DateTime), 0, CAST(N'2019-06-13 00:36:00.817' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (28, N'fe6c9de6-bb0f-4305-a530-fcb29e587935', N'Phuong lan', N'huy 4324', N'0965553323', CAST(N'2019-06-13 00:49:30.383' AS DateTime), 0, CAST(N'2019-06-13 00:49:30.383' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (29, N'fe6c9de6-bb0f-4305-a530-fcb29e587935', N'23 321', N'Phuong lan', N'0965464444', CAST(N'2019-06-13 00:58:23.850' AS DateTime), 0, CAST(N'2019-06-13 00:58:23.850' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (30, N'1b722a30-4f9d-4a23-a47d-88655a38cbdb', N'Phuong lan', N'377 dinh bo linh', N'+16068879944', CAST(N'2019-06-21 21:35:32.673' AS DateTime), 0, CAST(N'2019-06-21 21:35:32.673' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (31, N'1b722a30-4f9d-4a23-a47d-88655a38cbdb', N'phuong lan', N'377 dinh bo linh', N'+16068879944', CAST(N'2019-06-21 21:48:45.640' AS DateTime), 0, CAST(N'2019-06-21 21:48:45.640' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (32, N'1b722a30-4f9d-4a23-a47d-88655a38cbdb', N'Phuong lan', N'377 dinh bo linh', N'+16068879944', CAST(N'2019-06-21 21:55:17.497' AS DateTime), 0, CAST(N'2019-06-21 21:55:17.497' AS DateTime))
INSERT [dbo].[Orders] ([ID], [CustomerID], [NameShip], [AddressShip], [PhoneShip], [OrderDate], [GiaoDuHang], [CreateDate]) VALUES (33, N'1b722a30-4f9d-4a23-a47d-88655a38cbdb', N'phuong lan', N'377 dinh bo linh', N'+16068879944', CAST(N'2019-06-21 22:00:40.750' AS DateTime), 0, CAST(N'2019-06-21 22:00:40.750' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (1, NULL, N'/UploadedFiles/images/noimage.jpg', N'dien-thoai', N'Huy', CAST(N'2019-04-14 05:27:15.360' AS DateTime), 1, 0, NULL, NULL, N'ĐIÊN THOẠI', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (2, 1, N'/UploadedFiles/images/noimage.jpg', N'iphone', N'Huy', CAST(N'2019-04-14 05:27:58.750' AS DateTime), 1, 0, NULL, NULL, N'IPHONE', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (3, 2, N'/UploadedFiles/images/noimage.jpg', N'iphone-x', N'Huy', CAST(N'2019-04-14 05:28:28.957' AS DateTime), 1, 0, NULL, NULL, N'IPHONE X', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (4, 2, N'/UploadedFiles/images/noimage.jpg', N'iphone-8', N'Huy', CAST(N'2019-04-14 05:30:13.237' AS DateTime), 1, 0, NULL, NULL, N'IPHONE 8', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (5, 2, N'/UploadedFiles/images/noimage.jpg', N'iphone-7', N'Huy', CAST(N'2019-04-14 05:30:40.973' AS DateTime), 1, 0, NULL, N'', N'IPHONE 7', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (6, 2, N'/UploadedFiles/images/noimage.jpg', N'iphone-khac', N'Huy', CAST(N'2019-04-14 05:31:50.703' AS DateTime), 1, 0, NULL, NULL, N'IPHONE KHÁC', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (7, 8, N'/UploadedFiles/images/noimage.jpg', N'samsung-galaxy-note', N'Huy', CAST(N'2019-04-14 07:10:21.390' AS DateTime), 1, 0, NULL, NULL, N'Samsung Galaxy Note', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (8, 1, N'/UploadedFiles/images/noimage.jpg', N'samsung', N'Huy', CAST(N'2019-04-14 07:11:21.793' AS DateTime), 1, 0, NULL, NULL, N'Samsung', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (9, 8, N'/UploadedFiles/images/noimage.jpg', N'samsung-galaxy-s', N'Huy', CAST(N'2019-04-14 07:11:54.233' AS DateTime), 1, 0, NULL, NULL, N'Samsung Galaxy S', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (10, 8, N'/UploadedFiles/images/noimage.jpg', N'samsung-galaxy-a', N'Huy', CAST(N'2019-04-14 07:25:47.540' AS DateTime), 1, 0, NULL, NULL, N'Samsung Galaxy A', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (11, 1, N'/UploadedFiles/images/noimage.jpg', N'xiaomi', N'Huy', CAST(N'2019-04-14 07:30:36.333' AS DateTime), 1, 0, NULL, NULL, N'Xiaomi', 1, NULL, NULL)
INSERT [dbo].[ProductCategories] ([ID], [ParentID], [Image], [Alias], [CreateBy], [CreatedDate], [DisplayOrder], [HomeFlag], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate]) VALUES (12, NULL, N'/UploadedFiles/images/noimage.jpg', N'camera', N'Huy', CAST(N'2019-04-14 07:41:38.127' AS DateTime), NULL, 0, NULL, NULL, N'Camera', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (1, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 1, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (2, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 15, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (3, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 16, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (4, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 9, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (5, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (6, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (7, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (8, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (9, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (10, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (11, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (12, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (13, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (14, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (15, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (16, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (17, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (18, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (19, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (20, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (21, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (22, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (23, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (24, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (25, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (26, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (27, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (28, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (29, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (30, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (31, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (32, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 16, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (33, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (34, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (35, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (36, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (37, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (38, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 14, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (39, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (40, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (41, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (42, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (43, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (44, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (45, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (46, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (47, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (48, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (49, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (50, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 1, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (51, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (52, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (53, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (54, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (55, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (56, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (57, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (58, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (59, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (60, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (61, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (62, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (63, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (64, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (65, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (66, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (67, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (68, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (69, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (70, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (71, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (72, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (73, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (74, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (75, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (76, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (77, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (78, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (79, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (80, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (81, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (82, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (83, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (84, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (85, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (86, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (87, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (88, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (89, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (90, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (91, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (92, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (93, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (94, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (95, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (96, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (97, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (98, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (99, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
GO
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (100, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 1, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (101, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (102, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 5, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (103, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 7, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (104, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 14, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (105, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (106, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (107, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 1, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (108, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (109, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (110, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (111, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (112, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (113, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (114, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (115, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (116, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (117, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (118, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (119, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (120, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (121, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 17, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (122, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (123, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (124, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (125, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 1, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (126, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (127, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (128, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (129, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (130, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (131, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (132, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (133, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (134, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (135, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (136, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (137, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (138, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (139, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (140, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (141, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (142, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (143, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (144, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (145, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (146, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (147, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (148, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (149, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (150, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (151, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (152, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (153, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (154, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (155, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (156, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (157, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (158, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (159, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (160, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (161, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (162, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (163, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (164, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (165, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (166, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (167, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (168, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (169, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (170, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (171, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (172, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (173, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (174, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (175, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (176, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (177, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (178, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (179, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (180, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (181, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (182, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (183, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (184, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (185, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (186, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (187, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (188, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (189, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (190, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (191, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (192, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (193, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (194, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (195, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (196, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (197, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (198, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (199, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
GO
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (200, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (201, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (202, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (203, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (204, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (205, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (206, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (207, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (208, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (209, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (210, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (211, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (212, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (213, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (214, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (215, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (216, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (217, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (218, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (219, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (220, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (221, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (222, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (223, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (224, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (225, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (226, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (227, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (228, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (229, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (230, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (231, 7, N'["/UploadedFiles/images/galaxy%20note/Note-9.png","/UploadedFiles/images/galaxy%20note/Note-8-%C4%91en.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 19, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-9-512gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/single-sim-nano-sim-or-hybrid-dual-sim-nano-sim-dual-stand-by">Single SIM (Nano-SIM) or Hybrid Dual SIM (Nano-SIM, dual stand-by)</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp18">Mali-G72 MP18</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9810-octa">Exynos 9810 Octa</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/512-gb">512 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-rear-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (rear-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8gb">8GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-mp-f-1-7-25mm-1-3-6-1-22%c2%b5m-af">8 MP, f/1.7, 25mm, 1/3.6&quot;, 1.22&micro;m, AF</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-5-2-4-26mm-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-1-3-6-1%c2%b5m-af-ois-2x-optical-zoom">Dual : 12 MP, f/1.5-2.4, 26mm, 1/2.55&quot;, 1.4&micro;m, dual pixel PDAF, OIS 12 MP, f/2.4, 52mm, 1/3.6&quot;, 1&micro;m, AF, OIS, 2x optical zoom</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/4000-mah">4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-4-inches">Super AMOLED, 6.4 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang-dong">V&agrave;ng đồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:12:38.810' AS DateTime), N'Quyền năng mới, đậm dấu ấn', 0, 0, N'/UploadedFiles/images/galaxy%20note/Note-9.png', NULL, NULL, N'Samsung Galaxy Note 9 512Gb Chính Hãng', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (232, 7, N'["/UploadedFiles/images/galaxy%20note/note-8-tim.png","/UploadedFiles/images/galaxy%20note/note-8-xanh.png"]', 0, NULL, CAST(8990000.00 AS Decimal(18, 2)), 14, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-note-8-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g71-mp20">Mali-G71 MP20</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/mong-matvan-tayaccelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">mống mắt,v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-1-1-nougat-upgradable-to-android-9-0-pie">Android 7.1.1 (Nougat), upgradable to Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-3-quad-hd-2k">Super AMOLED, 6.3&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3300-mah">Li-Ion 3300 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:14:09.460' AS DateTime), N'Đã kích hoạt', 0, 0, N'/UploadedFiles/images/galaxy%20note/note-8-tim.png', NULL, NULL, N'Samsung Galaxy Note 8 chính hãng', 1, NULL, NULL, 0, 50, 8690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (233, 9, N'["/UploadedFiles/images/galaxy%20s/S10.png","/UploadedFiles/images/galaxy%20s/s10-xanh.png","/UploadedFiles/images/galaxy%20s/s10-trang.png"]', 0, NULL, CAST(22990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s10-128gb-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g76-mp12-or-adreno-640">Mali-G76 MP12 or Adreno 640</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9820">Exynos 9820</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/8-gb">8 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Fingerprint (under display), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-12-mp-f-1-5-2-4-26mm-wide-1-2-55-1-4%c2%b5m-dual-pixel-pdaf-ois-12-mp-f-2-4-52mm-telephoto-1-3-6-1-0%c2%b5m-af-ois-2x-optical-zoom-third-unannounced-camera">Triple: 12 MP, f/1.5-2.4, 26mm (wide), 1/2.55&quot;, 1.4&micro;m, Dual Pixel PDAF, OIS 12 MP, f/2.4, 52mm (telephoto), 1/3.6&quot;, 1.0&micro;m, AF, OIS, 2x optical zoom Third unannounced camera</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-inches">6.4 inches</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-luc-bao">Xanh Lục Bảo</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:15:18.473' AS DateTime), N'Vân tay siêu âm trên màn hình, thiết kế độc nhất', 0, 0, N'/UploadedFiles/images/galaxy%20s/S10.png', NULL, NULL, N'Samsung Galaxy S10+ 128Gb Chính Hãng', 1, NULL, NULL, 0, 50, 22690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (234, 9, N'["/UploadedFiles/images/galaxy%20s/s8-bac.png","/UploadedFiles/images/galaxy%20s/s8-do.png","/UploadedFiles/images/galaxy%20s/s8-hong.png"]', 0, NULL, CAST(7090000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-s8-plus-4gb64gb-cu-99', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-540">Adreno 540</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-8895">Exynos 8895</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a>,&nbsp;<a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/iris-scanner-fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer-heart-rate-spo2">Iris scanner, fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer, heart rate, SpO2</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-7-0">Android 7.0</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/3500-mah">3500 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-nano-sim">2 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/tim">T&iacute;m</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>C&ocirc;ng nghệ sạc pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/cong-nghe-sac-pin/sac-pin-nhanh">Sạc pin nhanh</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a>,&nbsp;<a href="https://didongthongminh.vn/bao-mat-nang-cao/quet-mong-mat">Qu&eacute;t mống mắt</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:18:32.477' AS DateTime), N'Đẹp như mới, nguyên áp suất', 0, 0, N'/UploadedFiles/images/galaxy%20s/s8-bac.png', NULL, NULL, N'Samsung Galaxy S8 Plus 4Gb/64Gb cũ 99%', 1, NULL, NULL, 0, 50, 6790000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (235, 10, N'["/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(6790000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a50-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/exynos-9610">Exynos 9610</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/mali-g72-mp3">Mali-G72 MP3</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-9-0-pie">Android 9.0 (Pie)</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-512-gb">MicroSD, hỗ trợ tối đa 512 Gb</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-4-fhd-infinity-u-display">6.4 FHD+ Infinity-U display</a>,&nbsp;<a href="https://didongthongminh.vn/man-hinh/super-amoled">Super AMOLED</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/25mpf2-0">25MP(F2.0)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/triple-25mp-f1-7-5mpf2-2-8mp-ultra-wide">Triple: 25MP (F1.7) + 5MP(F2.2) + 8MP (Ultra-Wide)</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/fast-battery-charging-15w">Fast battery charging 15W</a>,&nbsp;<a href="https://didongthongminh.vn/pin/li-ion-4000-mah">Li-Ion 4000 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-under-display-accelerometer-gyro-proximity-compass">Fingerprint (under display), accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/trang">Trắng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:26:17.397' AS DateTime), N'Vân tay trên màn hình, pin khủng', 0, 0, N'/UploadedFiles/images/samsung%20a/a50-den.png', NULL, NULL, N'Samsung Galaxy A50 Chính Hãng', 1, NULL, NULL, 0, 50, 6490000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (236, 10, N'["/UploadedFiles/images/samsung%20a/a50-trang.png","/UploadedFiles/images/samsung%20a/a50-den.png","/UploadedFiles/images/samsung%20a/a50-xanh.png"]', 0, NULL, CAST(5489000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'samsung-galaxy-a6-2018-chinh-hang', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-506">Adreno 506</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/cam-bien-van-tayaccelerometer-gyro-proximity-compass-barometer">Cảm biến v&acirc;n tay,accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/super-amoled-6-2-quad-hd-2k">Super AMOLED, 6.2&quot;, Quad HD (2K)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/24-mp-f-1-9-led-flash">24 MP (f/1.9), LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-16-mp-f-1-7-5-mp-f-1-9-phase-detection-autofocus-led-flash">Dual: 16 MP (f/1.7) + 5 MP (f/1.9), phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-3500-mah-battery">Non-removable Li-Ion 3500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-0-oreo">Android 8.0 ( Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/gold">Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm450-snapdragon-450">Qualcomm SDM450 Snapdragon 450</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:27:48.137' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/samsung%20a/a50-trang.png', NULL, NULL, N'Samsung Galaxy A6+ 2018 chính hãng', 1, NULL, NULL, 0, 50, 5189000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (237, 11, N'["/UploadedFiles/images/redmi/redmi-7-den.png","/UploadedFiles/images/mi%208/mi8se_do.png"]', 0, NULL, CAST(4366000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-8-se-nhap-khau-64gb-ram-6gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-hspa-lte">GSM / HSPA / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-88-inches-87-6-cm2-81-3-screen-to-body-ratio">5.88 inches, 87.6 cm2 (~81.3% screen-to-body ratio)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/20-mp-f-2-0-2-0%c2%b5m-1080p">20 MP (f/2.0, 2.0&micro;m), 1080p</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-9-1-4%c2%b5m-dual-pixel-pdaf-gyro-eis-5-mp-f-2-0-1-12%c2%b5m-dual-pixel-phase-detection-autofocus-led-flash">Dual: 12 MP (f/1.9, 1.4&micro;m, dual-pixel PDAF, gyro-EIS) + 5 MP (f/2.0, 1.12&micro;m), dual pixel phase detection autofocus, LED flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/6-gb">6 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm710-snapdragon-710">Qualcomm SDM710 Snapdragon 710</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-616">Adreno 616</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-po-3120-mah-battery">Non-removable Li-Po 3120 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/2-sim-nano">2 Sim Nano</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:29:22.537' AS DateTime), N'Camera AI, Chụp xoá phông chuyên nghiệp', 0, 0, N'/UploadedFiles/images/redmi/xiaomi-redmi5plus-black.png', NULL, NULL, N'Xiaomi Mi 8 SE Nhập khẩu 64Gb Ram 6Gb', 1, NULL, NULL, 0, 50, 4066000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (238, 11, N'["/UploadedFiles/images/mi%208/mi8se_do.png","/UploadedFiles/images/mi%208/mi8_se_den.png","/UploadedFiles/images/mi%208/mi8se_vang.png"]', 0, NULL, CAST(4490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'xiaomi-mi-max-3-nhap-khau-ram-4gb-64gb', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/gsm-cdma-hspa-evdo-lte">GSM / CDMA / HSPA / EVDO / LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-6-9-inches">IPS LCD , 6.9 inches</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/qualcomm-sdm636-snapdragon-636">Qualcomm SDM636 Snapdragon 636</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/adreno-509">Adreno 509</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Thẻ nhớ</th>
			<td>
			<p><a href="https://didongthongminh.vn/the-nho/microsd-ho-tro-toi-da-256-gb">MicroSD, hỗ trợ tối đa 256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/android-8-1-oreo">Android 8.1 (Oreo)</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/8-0-mp">8.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-5-mp">Dual 12 MP + 5 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-5500-mah-battery">Non-removable Li-Ion 5500 mAh battery</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xanh-duong">Xanh Dương</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:33:20.390' AS DateTime), N'Màn hình lớn, pin siêu trâu', 0, 0, N'/UploadedFiles/images/mi%208/mi8se_do.png', NULL, NULL, N'Xiaomi Mi Max 3 Nhập Khẩu Ram 4GB / 64GB', 1, NULL, NULL, 0, 50, 4190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (239, 12, N'["/UploadedFiles/images/camera/1%20(1).jpg"]', 0, NULL, CAST(12990000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-750d-ong-kinh-18-55-mm', N'<p><img alt="MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10022276_MAYANH_CANON_EOS-750D-ONGKINH-18-55-MM.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 750D / 18-55 IS STM</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>24.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 6</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>H&igrave;nh ảnh chất lượng cao</h3>

<p><a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep-canon/" target="_blank">M&aacute;y ảnh Canon</a>&nbsp;mang đến h&igrave;nh ảnh ưu việt với độ ph&acirc;n giải l&ecirc;n đến 24.2MP, vượt trội hơn c&aacute;c d&ograve;ng&nbsp;<a href="https://www.nguyenkim.com/may-anh-chuyen-nghiep/" target="_blank">m&aacute;y ảnh</a>&nbsp;trước đ&oacute; d&agrave;nh cho người mới sử dụng.</p>

<p><img alt="Máy ảnh chuyên nghiệp Canon EOS 750D cho hình ảnh chất lượng cao" src="https://adm.nguyenkim.com/images/companies/_1/Content/giai-tri/may-anh/canon/may-anh-chuyen-nghiep-canon-eos-750d-ong-kinh-roi-18-55-is-stm-111.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:39:05.987' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/1%20(1).jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 750D ỐNG KÍNH 18-55 MM', 1, NULL, NULL, 0, 50, 12690000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (240, 12, N'["/UploadedFiles/images/camera/may%20anh.jpg"]', 0, NULL, CAST(12329000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'may-anh-canon-eos-6d-mark-ii-than-may', N'<ul>
	<li>T&Iacute;NH NĂNG/TH&Ocirc;NG SỐ KỸ THUẬT</li>
	<li>M&Ocirc; TẢ</li>
	<li>HỎI Đ&Aacute;P</li>
	<li>Đ&Aacute;NH GI&Aacute;</li>
</ul>

<p><img alt="Máy ảnh Canon EOS 6D MARK II (Thân máy) giá ưu đãi tại Nguyễn Kim" src="https://cdn.nguyenkimmall.com/images/thumbnails/55/55/detailed/269/10033768-01.jpg" style="height:55px; width:55px" /></p>

<h2>M&Aacute;Y ẢNH CANON EOS 6D MARK II (TH&Acirc;N M&Aacute;Y)</h2>

<p>Gi&aacute; ni&ecirc;m yết:</p>

<p>Gi&aacute; b&aacute;n:</p>

<p>51.800.000đ-45%</p>

<p>28.490.000đ</p>

<p><img alt="" src="https://test.nguyenkimonline.com/images/companies/_1/Data_Price/Pic_Tags/tap-tragop0dong.png" /></p>

<p>MUA NGAYGiao h&agrave;ng tận nơi</p>

<p>MUA TRẢ G&Oacute;PChỉ c&oacute; 4.748.333đ/th&aacute;ng (6 th&aacute;ng)</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)" src="https://cdn.nguyenkimmall.com/images/thumbnails/800/600/companies/_1/Hoai_Khanh/MAY_ANH/CANON/10033768_MAYANH_CANON_EOS-6D-MARK-II-BODY.jpg" style="height:600px" /></p>

<table>
	<caption>Th&ocirc;ng số kỹ thuật</caption>
	<tbody>
		<tr>
			<td>Model:</td>
			<td>EOS 6D MARK II</td>
		</tr>
		<tr>
			<td>M&agrave;u sắc:</td>
			<td>Đen</td>
		</tr>
		<tr>
			<td>Nh&agrave; sản xuất:</td>
			<td>Canon</td>
		</tr>
		<tr>
			<td>Xuất xứ:</td>
			<td>Nhật Bản</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh:</td>
			<td>24 th&aacute;ng</td>
		</tr>
		<tr>
			<td>Địa điểm bảo h&agrave;nh:</td>
			<td>Nguyễn Kim</td>
		</tr>
		<tr>
			<td>Loại m&aacute;y ảnh:</td>
			<td>Chuy&ecirc;n nghiệp</td>
		</tr>
		<tr>
			<td>Độ ph&acirc;n giải m&aacute;y ảnh:</td>
			<td>26.2 megapixels</td>
		</tr>
		<tr>
			<td>Bộ xử l&yacute; h&igrave;nh ảnh:</td>
			<td>DIGIC 7</td>
		</tr>
		<tr>
			<td>Cảm biến h&igrave;nh ảnh:</td>
			<td>CMOS full-frame</td>
		</tr>
	</tbody>
</table>

<p><a href="javascript:void(0)">Xem th&ecirc;m th&ocirc;ng số kỹ thuật&nbsp;</a></p>

<h3>Thiết kế gọn nhẹ, sang trọng&nbsp;</h3>

<p>M&aacute;y ảnh Canon EOS 6D MARK II (Th&acirc;n m&aacute;y) c&oacute; thiết kế gọn nhẹ với m&agrave;u đen sang trọng, lịch l&atilde;m, dễ d&agrave;ng di chuyển, mang theo b&ecirc;n m&igrave;nh, cho bạn lắp r&aacute;p v&agrave; t&aacute;c nghiệp nhanh ch&oacute;ng nhất.</p>

<p><img alt="MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY) - Thiết kế gọn nhẹ, sang trọng" src="https://cdn.nguyenkimmall.com/images/companies/_1/Content/KA/Content/271.jpg" /></p>
', N'Huy', CAST(N'2019-04-14 07:42:22.083' AS DateTime), NULL, 0, 0, N'/UploadedFiles/images/camera/may%20anh.jpg', NULL, NULL, N'MÁY ẢNH CANON EOS 6D MARK II (THÂN MÁY)', 1, NULL, NULL, 0, 50, 12029000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (241, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(15390000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-moi-tran-da-kich-hoat', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 05:48:20.780' AS DateTime), N'còn bảo hành dài, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Mới trần, đã kích hoạt', 1, NULL, NULL, 0, 50, 15090000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (242, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20909000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xs-max-64gb-lock-moi-nhap-khau', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:01:17.230' AS DateTime), N'chưa kích hoạt, nguyên seal, phụ kiện zin', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iPhone Xs Max 64Gb Lock Mới Nhập Khẩu', 1, NULL, NULL, 0, 50, 20609000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (243, 3, N'["/UploadedFiles/images/iphone%20x/hinh%203.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png"]', 0, NULL, CAST(14999000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:02:31.950' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%203.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 14699000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (244, 3, N'["/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png","/UploadedFiles/images/iphone%20x/iphoneX-space-gray.png"]', 0, NULL, CAST(15490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table class="table table-bordered table-striped table-responsive table-hover">
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:57:24.197' AS DateTime), N'Đẹp như mới, kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%20x/iphoneX-silver-300x400(1).png', NULL, NULL, N'iPhone X 64GB Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 15190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (245, 4, N'["/UploadedFiles/images/iphone8/8_256gb-300x399.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/iphone8-space-gray.png"]', 0, NULL, CAST(12180000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-64gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 06:59:34.640' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone8/8_256gb-300x399.png', NULL, NULL, N'iPhone 8 Plus 64Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 11880000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (246, 4, N'["/UploadedFiles/images/iphone8/iphone8-space-gray.png","/UploadedFiles/images/iphone8/iphone8-gold-300x400.png","/UploadedFiles/images/iphone8/8_256gb-300x399.png"]', 0, NULL, CAST(23490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-8-plus-256gb-mau-do-moi', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-front-mounted-accelerometer-gyro-proximity-compass-barometer">Fingerprint (front-mounted), accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a11-bionic">Apple A11 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/256-gb">256 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp-f-1-8-28mm-ois-12-mp-f-2-8-57mm-phase-detection-autofocus-2x-optical-zoom-quad-led-dual-tone-flash">Dual: 12 MP (f/1.8, 28mm, OIS) + 12 MP (f/2.8, 57mm), phase detection autofocus, 2x optical zoom, quad-LED dual-tone flash</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2691-mah">Li-Ion 2691 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/5-5-inches-ips-lcd-full-hd">5.5 inches, IPS LCD Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:02:30.127' AS DateTime), N'Chưa Kích Hoạt Đủ Bảo Hành (Mỹ, Sing, Châu Âu', 0, 0, N'/UploadedFiles/images/iphone8/iphone8-space-gray.png', NULL, NULL, N'iPhone 8 Plus 256GB Màu Đỏ Mới', 1, NULL, NULL, 0, 50, 23190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (247, 5, N'["/UploadedFiles/images/iphone%207/iphone7-black.png","/UploadedFiles/images/iphone%207/iphone7-gold.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png"]', 0, NULL, CAST(8690000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-32gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/32-gb">32 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Hệ điều h&agrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/he-dieu-hanh/ios-10-0-1-upgradable-to-ios-11-4-1">iOS 10.0.1, upgradable to iOS 11.4.1</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-mp-f-2-2-32mm">7 MP, f/2.2, 32mm</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/non-removable-li-ion-2900-mah-battery-11-1-wh">Non-removable Li-Ion 2900 mAh battery (11.1 Wh)</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:04:43.257' AS DateTime), N'Đẹp như mới, tặng kèm sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-black.png', NULL, NULL, N'iPhone 7 Plus 32Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 8390000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (248, 5, N'["/UploadedFiles/images/iphone%207/iphone7-sliver.png","/UploadedFiles/images/iphone%207/iphone7-rosegold.png","/UploadedFiles/images/iphone%207/iphone7-black.png"]', 0, NULL, CAST(11490000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-7-plus-128gb-trai-nghiem-fullbox', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/den">Đen</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/do">Đỏ</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/jet-black">Jet Black</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/fingerprint-accelerometer-gyro-proximity-compass">Fingerprint, accelerometer, gyro, proximity, compass</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a10-fusion">Apple A10 Fusion</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/128-gb">128 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-2900-mah">Li-Ion 2900 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/3-gb">3 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-series7xt-plus-six-core-graphics">PowerVR Series7XT Plus (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:05:48.640' AS DateTime), N'Nguyên hộp sạc, cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%207/iphone7-sliver.png', NULL, NULL, N'iPhone 7 Plus 128GB Trải Nghiệm Fullbox', 1, NULL, NULL, 0, 50, 11190000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (249, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png"]', 0, NULL, CAST(5890000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-16gb-cu-nguyen-ban', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/16-gb">16 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-fullhd">IPS LCD, 5.5&quot;, Full HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/rose-gold">Rose Gold</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/cu">Cũ</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:07:27.977' AS DateTime), N'Đẹp như mới', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png', NULL, NULL, N'iPhone 6S Plus 16Gb Cũ Nguyên Bản', 1, NULL, NULL, 0, 50, 5590000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (250, 6, N'["/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png","/UploadedFiles/images/iphone%206/iphone6s-plus-64gb.png","/UploadedFiles/images/iphone%206/iphone6s-plus-rosegold.png"]', 0, NULL, CAST(7680000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-6s-plus-64gb-troi-bao-hanh-may-tran', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>Chip đồ họa ( GPU )</th>
			<td>
			<p><a href="https://didongthongminh.vn/chip-do-hoa-gpu/powervr-gt7600-six-core-graphics">PowerVR GT7600 (six-core graphics)</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a9">Apple A9</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/mo-khoa-bang-van-tay">Mở kh&oacute;a bằng v&acirc;n tay</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/2-gb">2 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/accelerometer-gyro-proximity-compass-barometer">Accelerometer, gyro, proximity, compass, barometer</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-po-2750-mah">Li-Po 2750 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/ips-lcd-5-5-retina-hd">IPS LCD, 5.5&quot;, Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/5-0-mp">5.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/12-mp">12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/1-nano-sim">1 Nano SIM</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/hong">Hồng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-04-14 07:09:15.747' AS DateTime), N'Đã kích hoạt, bản CH/A, kèm sạc cable chính hãng', 0, 0, N'/UploadedFiles/images/iphone%206/iphone6s-plus-gold.png', NULL, NULL, N'iPhone 6S Plus 64GB Trôi Bảo Hành Máy Trần', 1, NULL, NULL, 0, 50, 7380000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (8612, 3, N'["/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(20000000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-xr-64gb-cu-nguyen-bankhong-phu-kien', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-05-06 16:52:59.023' AS DateTime), N'iphone xr cũ, ko phụ kiện', 0, 0, N'/UploadedFiles/images/iphone%20x/hinh%201.png', NULL, NULL, N'iPhone XR 64Gb Cũ Nguyên Bản,không phụ kiện', 1, NULL, NULL, 0, 50, 16000000)
INSERT [dbo].[Products] ([ID], [ProductCategoryID], [MoreImages], [HotFlag], [Specifications], [Price], [Quantity], [Promotion], [Alias], [Content], [CreateBy], [CreatedDate], [Description], [DisplayOrder], [HomeFlag], [Image], [MetaDescription], [MetaKeyword], [Name], [Status], [UpdateBy], [UpdatedDate], [ViewCount], [OriginalQuantity], [OriginalPrice]) VALUES (8613, 3, N'["/UploadedFiles/images/iphone%20x/hinh%2020.png","/UploadedFiles/images/iphone%20x/hinh%201.png","/UploadedFiles/images/iphone%20x/hinh%203.png"]', 0, NULL, CAST(22000000.00 AS Decimal(18, 2)), 20, CAST(0.00 AS Decimal(18, 2)), N'iphone-x', N'<h2>TH&Ocirc;NG SỐ KỸ THUẬT</h2>

<table>
	<tbody>
		<tr>
			<th>Băng tần - Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/bang-tan-sim/2g3g">2G/3G</a>,&nbsp;<a href="https://didongthongminh.vn/bang-tan-sim/lte">LTE</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;n h&igrave;nh</th>
			<td>
			<p><a href="https://didongthongminh.vn/man-hinh/6-5-super-retina-hd">6.5&quot; Super Retina HD</a></p>
			</td>
		</tr>
		<tr>
			<th>CPU</th>
			<td>
			<p><a href="https://didongthongminh.vn/cpu/apple-a12-bionic">Apple A12 Bionic</a></p>
			</td>
		</tr>
		<tr>
			<th>RAM</th>
			<td>
			<p><a href="https://didongthongminh.vn/ram/4-gb">4 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Bộ nhớ trong</th>
			<td>
			<p><a href="https://didongthongminh.vn/bo-nho-trong/64-gb">64 GB</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera sau</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-sau/dual-12-mp">Dual 12 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Camera trước</th>
			<td>
			<p><a href="https://didongthongminh.vn/camera-truoc/7-0-mp">7.0 MP</a></p>
			</td>
		</tr>
		<tr>
			<th>Sim</th>
			<td>
			<p><a href="https://didongthongminh.vn/sim/dual-sim-nano-sim-and-esim">Dual SIM (nano-SIM and eSIM)</a></p>
			</td>
		</tr>
		<tr>
			<th>Cảm biến</th>
			<td>
			<p><a href="https://didongthongminh.vn/cam-bien/face-id-barometer-three%e2%80%91axis-gyro-accelerometer-proximity-sensor-ambient-light-sensor">Face ID, Barometer, Three‑axis gyro, Accelerometer, Proximity sensor, Ambient light sensor</a></p>
			</td>
		</tr>
		<tr>
			<th>Bảo mật n&acirc;ng cao</th>
			<td>
			<p><a href="https://didongthongminh.vn/bao-mat-nang-cao/faceid">FaceID</a></p>
			</td>
		</tr>
		<tr>
			<th>Pin</th>
			<td>
			<p><a href="https://didongthongminh.vn/pin/li-ion-3174-mah">Li-Ion 3174 mAh</a></p>
			</td>
		</tr>
		<tr>
			<th>M&agrave;u sắc</th>
			<td>
			<p><a href="https://didongthongminh.vn/mau-sac/bac">Bạc</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/vang">V&agrave;ng</a>,&nbsp;<a href="https://didongthongminh.vn/mau-sac/xam">X&aacute;m</a></p>
			</td>
		</tr>
		<tr>
			<th>T&igrave;nh trạng sản phẩm</th>
			<td>
			<p><a href="https://didongthongminh.vn/tinh-trang-san-pham/moi">Mới</a></p>
			</td>
		</tr>
	</tbody>
</table>
', N'Huy', CAST(N'2019-07-07 16:33:04.070' AS DateTime), N'iphone xr mới, ko phụ kiện', 1, 0, N'/UploadedFiles/images/iphone%20x/hinh%2020.png', NULL, NULL, N'iphone x', 1, NULL, NULL, 0, 20, 20000000)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Slides] ON 

INSERT [dbo].[Slides] ([ID], [Name], [Description], [Image], [URL], [DisplayOrder], [Status]) VALUES (1, N'home', N'1', N'/UploadedFiles/images/slide/iphone-se-12-4-1.jpg', N'#', 0, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Image], [URL], [DisplayOrder], [Status]) VALUES (2, N'home', N'home', N'/UploadedFiles/images/slide/oppof11pro_3.png', N'#', 1, 1)
INSERT [dbo].[Slides] ([ID], [Name], [Description], [Image], [URL], [DisplayOrder], [Status]) VALUES (3, N'home', N'home', N'/UploadedFiles/images/slide/thang-vang-apple.jpg', N'#', 0, 1)
SET IDENTITY_INSERT [dbo].[Slides] OFF
SET IDENTITY_INSERT [dbo].[Warranties] ON 

INSERT [dbo].[Warranties] ([ID], [Name], [Description], [WarrantyOld], [WarrantyNew], [TimeInnovation], [FixTime], [Status]) VALUES (1, N'dCare (Gói Mặc Định)', N'Bảo hành phần cứng mặc định, không bao gồm nguồn, màn hình, vân tay, rơi móp, vào nước', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Warranties] OFF
/****** Object:  Index [IX_GroupId]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_GroupId] ON [dbo].[ApplicationRoleGroups]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[ApplicationRoleGroups]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApplicationUser_Id]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_Id] ON [dbo].[ApplicationUserClaims]
(
	[ApplicationUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GroupId]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_GroupId] ON [dbo].[ApplicationUserGroups]
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[ApplicationUserGroups]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApplicationUser_Id]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_Id] ON [dbo].[ApplicationUserLogins]
(
	[ApplicationUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApplicationUser_Id]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_Id] ON [dbo].[ApplicationUserRoles]
(
	[ApplicationUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IdentityRole_Id]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_IdentityRole_Id] ON [dbo].[ApplicationUserRoles]
(
	[IdentityRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GroupID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_GroupID] ON [dbo].[Menus]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderID] ON [dbo].[OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WarrantyID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_WarrantyID] ON [dbo].[OrderDetails]
(
	[WarrantyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostCategoryID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostCategoryID] ON [dbo].[Posts]
(
	[PostCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_PostID] ON [dbo].[PostTags]
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TagID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_TagID] ON [dbo].[PostTags]
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[PriceHistories]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductCategoryID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductCategoryID] ON [dbo].[Products]
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[ProductTags]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TagID]    Script Date: 4/30/2020 6:57:57 PM ******/
CREATE NONCLUSTERED INDEX [IX_TagID] ON [dbo].[ProductTags]
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ApplicationRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationGroups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ApplicationGroups] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationRoleGroups] CHECK CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationGroups_GroupId]
GO
ALTER TABLE [dbo].[ApplicationRoleGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[ApplicationRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationRoleGroups] CHECK CONSTRAINT [FK_dbo.ApplicationRoleGroups_dbo.ApplicationRoles_RoleId]
GO
ALTER TABLE [dbo].[ApplicationUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserClaims_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserClaims] CHECK CONSTRAINT [FK_dbo.IdentityUserClaims_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[ApplicationUserGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationGroups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ApplicationGroups] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserGroups] CHECK CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationGroups_GroupId]
GO
ALTER TABLE [dbo].[ApplicationUserGroups]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[ApplicationUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ApplicationUserGroups] CHECK CONSTRAINT [FK_dbo.ApplicationUserGroups_dbo.ApplicationUsers_UserId]
GO
ALTER TABLE [dbo].[ApplicationUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserLogins_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserLogins] CHECK CONSTRAINT [FK_dbo.IdentityUserLogins_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[ApplicationUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserRoles] CHECK CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[ApplicationUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.IdentityRoles_IdentityRole_Id] FOREIGN KEY([IdentityRole_Id])
REFERENCES [dbo].[ApplicationRoles] ([Id])
GO
ALTER TABLE [dbo].[ApplicationUserRoles] CHECK CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.IdentityRoles_IdentityRole_Id]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Menus_dbo.MenuGroups_GroupID] FOREIGN KEY([GroupID])
REFERENCES [dbo].[MenuGroups] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_dbo.Menus_dbo.MenuGroups_GroupID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderID] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Orders_OrderID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.OrderDetails_dbo.Warranties_WarrantyID] FOREIGN KEY([WarrantyID])
REFERENCES [dbo].[Warranties] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_dbo.OrderDetails_dbo.Warranties_WarrantyID]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Posts_dbo.PostCategories_PostCategoryID] FOREIGN KEY([PostCategoryID])
REFERENCES [dbo].[PostCategories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_dbo.Posts_dbo.PostCategories_PostCategoryID]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PostTags_dbo.Posts_PostID] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_dbo.PostTags_dbo.Posts_PostID]
GO
ALTER TABLE [dbo].[PostTags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PostTags_dbo.Tags_TagID] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PostTags] CHECK CONSTRAINT [FK_dbo.PostTags_dbo.Tags_TagID]
GO
ALTER TABLE [dbo].[PriceHistories]  WITH CHECK ADD  CONSTRAINT [FK_dbo.PriceHistories_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PriceHistories] CHECK CONSTRAINT [FK_dbo.PriceHistories_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.ProductCategories_ProductCategoryID] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.ProductCategories_ProductCategoryID]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductTags_dbo.Products_ProductID] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_dbo.ProductTags_dbo.Products_ProductID]
GO
ALTER TABLE [dbo].[ProductTags]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductTags_dbo.Tags_TagID] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductTags] CHECK CONSTRAINT [FK_dbo.ProductTags_dbo.Tags_TagID]
GO
/****** Object:  StoredProcedure [dbo].[CountOrderDetailPayment]    Script Date: 4/30/2020 6:57:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CountOrderDetailPayment]
@OrderID int
as
begin
	declare @countOrderDetail int,@countOrderDetailPayment int
	set @countOrderDetail=(select count(*) from OrderDetails where orderID=@OrderID)
	set @countOrderDetailPayment=(select count(*) from orderDetails where payment=1
	 and orderID=@OrderID)
	 if(@countOrderDetail=@countOrderDetailPayment)
	 begin
	 update Orders
	 set GiaoDuHang=1,OrderDate=GETDATE()
	 where ID=@OrderID
	 end
end
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 4/30/2020 6:57:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertProduct]
as
begin
--Khai báo biến @id, @title để lưu nội dung đọc
declare 
@ProductCategoryID	int					,
@MoreImages	xml							,
@HotFlag	bit							,
@Specifications	nvarchar(250)			,
@Price	decimal(18, 2)					,
@Quantity	int							,
@Promotion	decimal(18, 2)				,
@Alias	nvarchar(250)					,
@Content	nvarchar(MAX)				,
@CreateBy	nvarchar(250)				,
@CreatedDate	datetime				,
@Description	nvarchar(MAX)			,
@DisplayOrder	int						,
@HomeFlag	bit							,
@Image	nvarchar(MAX)					,
@MetaDescription	nvarchar(MAX)		,
@MetaKeyword	nvarchar(150)			,
@Name	nvarchar(250)					,
@Status	bit								,
@UpdateBy	nvarchar(MAX)				,
@UpdatedDate	datetime				,
@ViewCount	int
	


DECLARE cursorProduct CURSOR FOR  -- khai báo con trỏ cursorProduct
select 
ProductCategoryID	,
MoreImages			,
HotFlag				,
Specifications		,
Price				,
Quantity			,
Promotion			,
Alias				,
[Content]			,
CreateBy			,
CreatedDate			,
Description			,
DisplayOrder		,
HomeFlag			,
Image				,
MetaDescription		,
MetaKeyword			,
Name				,
Status				,
UpdateBy			,
UpdatedDate			,
ViewCount
from Products

OPEN cursorProduct                -- Mở con trỏ

FETCH NEXT FROM cursorProduct     -- Đọc dòng đầu tiên
      INTO

@ProductCategoryID		,
@MoreImages				,
@HotFlag				,
@Specifications			,
@Price					,
@Quantity				,
@Promotion				,
@Alias					,
@Content				,
@CreateBy				,
@CreatedDate			,
@Description			,
@DisplayOrder			,
@HomeFlag				,
@Image					,
@MetaDescription		,
@MetaKeyword			,
@Name					,
@Status					,
@UpdateBy				,
@UpdatedDate			,
@ViewCount


WHILE @@FETCH_STATUS = 0          --vòng lặp WHILE khi đọc Cursor thành công
BEGIN
    insert into Products(
ProductCategoryID	,
MoreImages			,
HotFlag				,
Specifications		,
Price				,
Quantity			,
Promotion			,
Alias				,
[Content]			,
CreateBy			,
CreatedDate			,
Description			,
DisplayOrder		,
HomeFlag			,
Image				,
MetaDescription		,
MetaKeyword			,
Name				,
Status				,
UpdateBy			,
UpdatedDate			,
ViewCount

	)
	values(
	@ProductCategoryID		,
@MoreImages				,
@HotFlag				,
@Specifications			,
@Price					,
@Quantity				,
@Promotion				,
@Alias					,
@Content				,
@CreateBy				,
@CreatedDate			,
@Description			,
@DisplayOrder			,
@HomeFlag				,
@Image					,
@MetaDescription		,
@MetaKeyword			,
@Name					,
@Status					,
@UpdateBy				,
@UpdatedDate			,
@ViewCount
	)

    FETCH NEXT FROM cursorProduct -- Đọc dòng tiếp
          INTO @ProductCategoryID		,
@MoreImages				,
@HotFlag				,
@Specifications			,
@Price					,
@Quantity				,
@Promotion				,
@Alias					,
@Content				,
@CreateBy				,
@CreatedDate			,
@Description			,
@DisplayOrder			,
@HomeFlag				,
@Image					,
@MetaDescription		,
@MetaKeyword			,
@Name					,
@Status					,
@UpdateBy				,
@UpdatedDate			,
@ViewCount

END

CLOSE cursorProduct              -- Đóng Cursor
DEALLOCATE cursorProduct         -- Giải phóng tài nguyên
end


GO
/****** Object:  Trigger [dbo].[UpdateGiaoDuHangOrders]    Script Date: 4/30/2020 6:57:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[UpdateGiaoDuHangOrders]
on [dbo].[OrderDetails]
after update
as
begin
	if update(payment)
	begin
	declare @orderID int,@payment bit
	select @orderID=OrderID,@payment=Payment  from inserted
	if(@payment=1)
		begin
		exec CountOrderDetailPayment @orderID
		end 
	else
		begin
		update Orders
		set GiaoDuHang=0
		where id=@orderID
		end
	end
end
GO
USE [master]
GO
ALTER DATABASE [SmartPhoneTestSomee] SET  READ_WRITE 
GO
