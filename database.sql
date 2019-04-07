USE [master]
GO
/****** Object:  Database [SmartPhoneShopConnection]    Script Date: 07/04/2019 17:57:32 ******/
CREATE DATABASE [SmartPhoneShopConnection]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SmartPhoneShopConnection', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SmartPhoneShopConnection.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SmartPhoneShopConnection_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SmartPhoneShopConnection_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SmartPhoneShopConnection] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SmartPhoneShopConnection].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SmartPhoneShopConnection] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET ARITHABORT OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET  MULTI_USER 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SmartPhoneShopConnection] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SmartPhoneShopConnection] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SmartPhoneShopConnection]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 07/04/2019 17:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ApplicationUsers]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Errors]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Footers]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[IdentityRoles]    Script Date: 07/04/2019 17:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.IdentityRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdentityUserClaims]    Script Date: 07/04/2019 17:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.IdentityUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdentityUserLogins]    Script Date: 07/04/2019 17:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](max) NULL,
	[ProviderKey] [nvarchar](max) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.IdentityUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IdentityUserRoles]    Script Date: 07/04/2019 17:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdentityUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[IdentityRole_Id] [nvarchar](128) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.IdentityUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuGroups]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Menus]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 07/04/2019 17:57:32 ******/
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
 CONSTRAINT [PK_dbo.OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/04/2019 17:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[NameShip] [nvarchar](250) NOT NULL,
	[AddressShip] [nvarchar](250) NOT NULL,
	[PhoneShip] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[GiaoDuHang] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pages]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[PostCategories]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Posts]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[PostTags]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[PriceHistories]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 07/04/2019 17:57:32 ******/
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
	[Quantity] [int] NOT NULL,
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
	[Price] [decimal](18, 2) NOT NULL DEFAULT ((0)),
	[Promotion] [decimal](18, 2) NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductTags]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Slides]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[SuppostOnlines]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[SystemConfigs]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[VisitorStatistics]    Script Date: 07/04/2019 17:57:32 ******/
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
/****** Object:  Table [dbo].[Warranties]    Script Date: 07/04/2019 17:57:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warranties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
	[WarrantyOld] [nvarchar](150) NULL,
	[WarrantyNew] [nvarchar](150) NULL,
	[TimeInnovation] [nvarchar](150) NULL,
	[FixTime] [nvarchar](150) NULL,
 CONSTRAINT [PK_dbo.Warranties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApplicationUser_Id]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_Id] ON [dbo].[IdentityUserClaims]
(
	[ApplicationUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApplicationUser_Id]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_Id] ON [dbo].[IdentityUserLogins]
(
	[ApplicationUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_ApplicationUser_Id]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_Id] ON [dbo].[IdentityUserRoles]
(
	[ApplicationUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_IdentityRole_Id]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_IdentityRole_Id] ON [dbo].[IdentityUserRoles]
(
	[IdentityRole_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_GroupID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_GroupID] ON [dbo].[Menus]
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_OrderID] ON [dbo].[OrderDetails]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[OrderDetails]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_WarrantyID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_WarrantyID] ON [dbo].[OrderDetails]
(
	[WarrantyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CustomerID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_CustomerID] ON [dbo].[Orders]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostCategoryID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_PostCategoryID] ON [dbo].[Posts]
(
	[PostCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_PostID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_PostID] ON [dbo].[PostTags]
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TagID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_TagID] ON [dbo].[PostTags]
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[PriceHistories]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductCategoryID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_ProductCategoryID] ON [dbo].[Products]
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_ProductID] ON [dbo].[ProductTags]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_TagID]    Script Date: 07/04/2019 17:57:32 ******/
CREATE NONCLUSTERED INDEX [IX_TagID] ON [dbo].[ProductTags]
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IdentityUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserClaims_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[IdentityUserClaims] CHECK CONSTRAINT [FK_dbo.IdentityUserClaims_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[IdentityUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserLogins_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[IdentityUserLogins] CHECK CONSTRAINT [FK_dbo.IdentityUserLogins_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[IdentityUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.ApplicationUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[ApplicationUsers] ([Id])
GO
ALTER TABLE [dbo].[IdentityUserRoles] CHECK CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.ApplicationUsers_ApplicationUser_Id]
GO
ALTER TABLE [dbo].[IdentityUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.IdentityRoles_IdentityRole_Id] FOREIGN KEY([IdentityRole_Id])
REFERENCES [dbo].[IdentityRoles] ([Id])
GO
ALTER TABLE [dbo].[IdentityUserRoles] CHECK CONSTRAINT [FK_dbo.IdentityUserRoles_dbo.IdentityRoles_IdentityRole_Id]
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
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Orders_dbo.Customers_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_dbo.Orders_dbo.Customers_CustomerID]
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
USE [master]
GO
ALTER DATABASE [SmartPhoneShopConnection] SET  READ_WRITE 
GO
