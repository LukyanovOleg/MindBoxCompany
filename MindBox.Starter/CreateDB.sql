USE [master]
GO

/****** Object:  Database [TestDB]    Script Date: 09.10.2018 14:23:23 ******/
CREATE DATABASE [TestDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TestDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TestDB_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [TestDB] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TestDB] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TestDB] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TestDB] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TestDB] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TestDB] SET ARITHABORT OFF 
GO

ALTER DATABASE [TestDB] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TestDB] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TestDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TestDB] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TestDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TestDB] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TestDB] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TestDB] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TestDB] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TestDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TestDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TestDB] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TestDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TestDB] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TestDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TestDB] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TestDB] SET RECOVERY FULL 
GO

ALTER DATABASE [TestDB] SET  MULTI_USER 
GO

ALTER DATABASE [TestDB] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TestDB] SET DB_CHAINING OFF 
GO

ALTER DATABASE [TestDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [TestDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [TestDB] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [TestDB] SET  READ_WRITE 
GO






USE [TestDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09.10.2018 14:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductInCategory]    Script Date: 09.10.2018 14:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInCategory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_ProductInCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 09.10.2018 14:23:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[ProductInCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCategory_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[ProductInCategory] CHECK CONSTRAINT [FK_ProductInCategory_Categories]
GO
ALTER TABLE [dbo].[ProductInCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductInCategory_ProductInCategory] FOREIGN KEY([Id])
REFERENCES [dbo].[ProductInCategory] ([Id])
GO
ALTER TABLE [dbo].[ProductInCategory] CHECK CONSTRAINT [FK_ProductInCategory_ProductInCategory]
GO