USE [master]
GO
/****** Object:  Database [School]    Script Date: 17.02.2023 6:25:39 ******/
CREATE DATABASE [School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'School', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\School.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'School_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\School_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [School] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [School] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [School] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [School] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [School] SET ARITHABORT OFF 
GO
ALTER DATABASE [School] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [School] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [School] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [School] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [School] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [School] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [School] SET  DISABLE_BROKER 
GO
ALTER DATABASE [School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [School] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [School] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [School] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [School] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [School] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [School] SET  MULTI_USER 
GO
ALTER DATABASE [School] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [School] SET DB_CHAINING OFF 
GO
ALTER DATABASE [School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [School] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [School] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [School] SET QUERY_STORE = OFF
GO
USE [School]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](255) NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[IDWorker] [int] NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[Discount] [float] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Worker]    Script Date: 17.02.2023 6:25:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Worker](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](510) NULL,
	[Password] [nvarchar](100) NULL,
 CONSTRAINT [PK_Worker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (1, N'Васильев', N'Оскар', N'Богданович', N'м', N'7(585)801-94-29 ', CAST(N'1971-01-30' AS Date), N'miturria@verizon.net', CAST(N'2017-05-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (2, N'Лазарев', N'Алексей', N'Богданович', N'м', N'7(0055)737-37-48 ', CAST(N'1977-03-10' AS Date), N'claesjac@me.com', CAST(N'2017-01-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (3, N'Казаков', N'Дмитрий', N'Русланович', N'м', N'7(51)682-19-40 ', CAST(N'1978-12-15' AS Date), N'ozawa@verizon.net', CAST(N'2016-05-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (4, N'Попова', N'Харита', N'Якуновна', N'ж', N'7(335)386-81-06 ', CAST(N'1997-12-16' AS Date), N'firstpr@verizon.net', CAST(N'2016-07-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (5, N'Турова', N'Георгина', N'Семёновна', N'ж', N'7(555)321-42-99 ', CAST(N'1974-05-28' AS Date), N'yruan@optonline.net', CAST(N'2018-02-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (6, N'Андреев', N'Станислав', N'Максович', N'м', N'7(02)993-91-28 ', CAST(N'1975-10-10' AS Date), N'budinger@mac.com', CAST(N'2017-12-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (7, N'Орлова', N'Влада', N'Мартыновна', N'ж', N'7(2506)433-38-35 ', CAST(N'1990-06-26' AS Date), N'rnelson@yahoo.ca', CAST(N'2016-03-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (8, N'Костина', N'Любава', N'Авксентьевна', N'ж', N'7(6419)959-21-87 ', CAST(N'1972-07-13' AS Date), N'gordonjcp@hotmail.com', CAST(N'2016-02-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (9, N'Александров', N'Станислав', N'Эдуардович', N'м', N'7(18)164-05-12 ', CAST(N'1981-07-04' AS Date), N'bigmauler@aol.com', CAST(N'2018-11-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (10, N'Корнилова', N'Анэля', N'Михайловна', N'ж', N'7(20)980-01-60 ', CAST(N'1973-04-02' AS Date), N'jonathan@aol.com', CAST(N'2016-05-22T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (11, N'Морозов', N'Наум', N'Валерьянович', N'м', N'7(636)050-96-13 ', CAST(N'1985-07-04' AS Date), N'salesgeek@mac.com', CAST(N'2016-05-02T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (12, N'Баранова', N'Эльмира', N'Дмитриевна', N'ж', N'7(9240)643-15-50 ', CAST(N'1977-01-15' AS Date), N'jgmyers@comcast.net', CAST(N'2016-07-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (13, N'Степанова', N'Амелия', N'Робертовна', N'ж', N'7(1217)441-28-42 ', CAST(N'1970-06-06' AS Date), N'rasca@hotmail.com', CAST(N'2017-09-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (14, N'Горбачёв', N'Давид', N'Тимурович', N'м', N'7(53)602-85-41 ', CAST(N'1983-05-22' AS Date), N'hedwig@att.net', CAST(N'2018-12-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (15, N'Волков', N'Людвиг', N'Витальевич', N'м', N'7(8459)592-05-58 ', CAST(N'1977-12-27' AS Date), N'jrkorson@msn.com', CAST(N'2016-04-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (16, N'Комиссарова', N'Амалия', N'Робертовна', N'ж', N'7(22)647-46-32 ', CAST(N'1971-08-18' AS Date), N'jorgb@msn.com', CAST(N'2017-08-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (17, N'Большаков', N'Вадим', N'Данилович', N'м', N'7(386)641-13-37 ', CAST(N'1970-05-15' AS Date), N'uncle@gmail.com', CAST(N'2018-08-04T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (18, N'Абрамов', N'Станислав', N'Филатович', N'м', N'7(6545)478-87-79 ', CAST(N'1989-05-18' AS Date), N'solomon@att.net', CAST(N'2016-12-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (19, N'Журавлёв', N'Леонтий', N'Яковлевич', N'м', N'7(4403)308-56-96 ', CAST(N'2000-03-02' AS Date), N'cmdrgravy@me.com', CAST(N'2018-01-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (20, N'Селиверстов', N'Глеб', N'Максимович', N'м', N'7(20)554-28-68 ', CAST(N'1999-06-20' AS Date), N'jigsaw@sbcglobal.net', CAST(N'2016-01-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (21, N'Киселёв', N'Устин', N'Яковлевич', N'м', N'7(83)334-52-76 ', CAST(N'1985-01-08' AS Date), N'dalamb@verizon.net', CAST(N'2018-06-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (22, N'Зуев', N'Матвей', N'Иванович', N'м', N'7(5383)893-04-66 ', CAST(N'1981-03-28' AS Date), N'brickbat@verizon.net', CAST(N'2018-12-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (23, N'Ершов', N'Глеб', N'Федорович', N'м', N'7(2608)298-40-82 ', CAST(N'1970-06-14' AS Date), N'sjava@aol.com', CAST(N'2016-09-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (24, N'Бобылёв', N'Георгий', N'Витальевич', N'м', N'7(88)685-13-51 ', CAST(N'1983-12-19' AS Date), N'csilvers@mac.com', CAST(N'2018-04-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (25, N'Ефремов', N'Витольд', N'Авксентьевич', N'м', N'7(93)922-14-03 ', CAST(N'1975-12-02' AS Date), N'kwilliams@yahoo.ca', CAST(N'2018-04-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (26, N'Андреева', N'Патрисия', N'Валерьевна', N'ж', N'7(9648)953-81-26 ', CAST(N'1993-11-18' AS Date), N'jigsaw@aol.com', CAST(N'2016-07-17T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (27, N'Ефимова', N'Магда', N'Платоновна', N'ж', N'7(9261)386-15-92 ', CAST(N'1995-08-16' AS Date), N'rbarreira@me.com', CAST(N'2017-08-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (28, N'Голубев', N'Иосиф', N'Тимофеевич', N'м', N'7(78)972-73-11 ', CAST(N'1982-05-06' AS Date), N'smcnabb@att.net', CAST(N'2018-08-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (29, N'Евсеев', N'Макар', N'Васильевич', N'м', N'7(2141)077-85-70 ', CAST(N'1977-09-13' AS Date), N'parsimony@sbcglobal.net', CAST(N'2018-12-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (30, N'Бобров', N'Агафон', N'Лаврентьевич', N'м', N'7(2159)507-39-57 ', CAST(N'1995-07-29' AS Date), N'petersen@comcast.net', CAST(N'2017-05-09T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (31, N'Игнатов', N'Захар', N'Павлович', N'м', N'7(578)574-73-36 ', CAST(N'1998-10-07' AS Date), N'dieman@icloud.com', CAST(N'2017-11-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (32, N'Гущина', N'Янита', N'Федоровна', N'ж', N'7(4544)716-68-96 ', CAST(N'1999-03-02' AS Date), N'lishoy@att.net', CAST(N'2018-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (33, N'Калашников', N'Артур', N'Юрьевич', N'м', N'7(147)947-47-21 ', CAST(N'1972-12-13' AS Date), N'oevans@aol.com', CAST(N'2017-08-20T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (34, N'Дмитриева', N'Элина', N'Даниловна', N'ж', N'7(787)140-48-84 ', CAST(N'1988-12-10' AS Date), N'vmalik@live.com', CAST(N'2017-02-11T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (35, N'Федотова', N'Сандра', N'Владленовна', N'ж', N'7(126)195-25-86 ', CAST(N'1985-03-29' AS Date), N'penna@verizon.net', CAST(N'2016-11-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (36, N'Кузьмина', N'Дэнна', N'Витальевна', N'ж', N'7(9940)977-45-73 ', CAST(N'1993-08-24' AS Date), N'nichoj@mac.com', CAST(N'2016-03-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (37, N'Колобова', N'Злата', N'Романовна', N'ж', N'7(50)884-07-35 ', CAST(N'1994-08-25' AS Date), N'sinkou@aol.com', CAST(N'2016-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (38, N'Некрасов', N'Варлам', N'Михайлович', N'м', N'7(019)258-06-35 ', CAST(N'2000-11-12' AS Date), N'dogdude@verizon.net', CAST(N'2017-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (39, N'Колобов', N'Орест', N'Юлианович', N'м', N'7(1680)508-58-26 ', CAST(N'2001-07-14' AS Date), N'parkes@verizon.net', CAST(N'2017-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (40, N'Блохин', N'Пантелеймон', N'Феликсович', N'м', N'7(9524)556-48-98 ', CAST(N'1978-03-06' AS Date), N'balchen@comcast.net', CAST(N'2018-02-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (41, N'Калинин', N'Петр', N'Иванович', N'м', N'7(90)316-07-17 ', CAST(N'1993-09-08' AS Date), N'aschmitz@hotmail.com', CAST(N'2016-05-26T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (42, N'Беляева', N'Сабрина', N'Федосеевна', N'ж', N'7(6580)534-32-58 ', CAST(N'1972-07-26' AS Date), N'agapow@gmail.com', CAST(N'2017-06-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (43, N'Агафонов', N'Юстиниан', N'Олегович', N'м', N'7(303)810-28-78 ', CAST(N'1997-02-02' AS Date), N'staffelb@sbcglobal.net', CAST(N'2016-06-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (44, N'Мамонтова', N'Марфа', N'Мироновна', N'ж', N'7(38)095-64-18 ', CAST(N'1984-10-19' AS Date), N'rfoley@verizon.net', CAST(N'2018-02-27T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (45, N'Блинов', N'Евгений', N'Мэлсович', N'м', N'7(0852)321-82-64 ', CAST(N'1994-01-05' AS Date), N'moxfulder@outlook.com', CAST(N'2017-05-07T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (46, N'Воронова', N'Изабелла', N'Вячеславовна', N'ж', N'7(17)433-44-98 ', CAST(N'1999-09-24' AS Date), N'kildjean@sbcglobal.net', CAST(N'2017-12-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (47, N'Медведев', N'Святослав', N'Юлианович', N'м', N'7(3520)435-21-20 ', CAST(N'1972-10-04' AS Date), N'hllam@comcast.net', CAST(N'2018-10-13T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (48, N'Куликова', N'Эвелина', N'Вячеславовна', N'ж', N'7(0236)682-42-78 ', CAST(N'1997-11-14' AS Date), N'ilikered@hotmail.com', CAST(N'2018-02-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (49, N'Суворова', N'Божена', N'Анатольевна', N'ж', N'7(347)895-86-57 ', CAST(N'1981-03-09' AS Date), N'attwood@aol.com', CAST(N'2016-01-28T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Client] ([ID], [LastName], [FirstName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (50, N'Егорова', N'Амалия', N'Дамировна', N'ж', N'7(7486)408-12-26 ', CAST(N'1999-09-28' AS Date), N'drezet@yahoo.com', CAST(N'2016-06-30T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (1, 48, 97, CAST(N'2019-11-16T11:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (2, 33, 19, CAST(N'2019-01-11T18:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (3, 33, 61, CAST(N'2019-12-01T14:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (4, 33, 53, CAST(N'2019-02-11T13:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (5, 46, 89, CAST(N'2019-09-10T18:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (6, 38, 90, CAST(N'2019-02-12T19:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (7, 11, 6, CAST(N'2019-04-04T09:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (8, 31, 83, CAST(N'2019-05-15T09:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (9, 34, 94, CAST(N'2019-01-16T14:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (10, 10, 80, CAST(N'2019-01-16T09:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (11, 28, 94, CAST(N'2019-03-15T10:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (12, 5, 19, CAST(N'2019-01-31T12:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (13, 4, 52, CAST(N'2019-11-19T15:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (14, 29, 79, CAST(N'2019-01-10T08:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (15, 50, 94, CAST(N'2019-04-29T15:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (16, 2, 66, CAST(N'2019-10-12T08:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (17, 38, 91, CAST(N'2019-02-13T18:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (18, 29, 52, CAST(N'2019-02-01T18:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (19, 10, 42, CAST(N'2019-11-12T18:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (20, 12, 69, CAST(N'2019-01-11T12:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (21, 3, 70, CAST(N'2019-03-23T19:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (22, 2, 71, CAST(N'2019-06-23T08:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (23, 43, 39, CAST(N'2019-05-25T17:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (24, 12, 51, CAST(N'2019-02-18T18:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (25, 50, 65, CAST(N'2019-07-17T08:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (26, 50, 6, CAST(N'2019-08-06T16:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (27, 13, 60, CAST(N'2019-12-14T08:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (28, 26, 77, CAST(N'2019-06-28T14:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (29, 38, 36, CAST(N'2019-06-06T19:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (30, 11, 70, CAST(N'2019-06-07T17:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (31, 15, 82, CAST(N'2019-04-30T18:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (32, 4, 69, CAST(N'2019-08-30T11:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (33, 24, 83, CAST(N'2019-05-08T14:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (34, 7, 27, CAST(N'2019-10-27T16:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (35, 10, 65, CAST(N'2019-01-05T08:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (36, 26, 24, CAST(N'2019-03-04T17:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (37, 21, 31, CAST(N'2019-09-29T13:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (38, 23, 64, CAST(N'2019-01-22T10:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (39, 10, 52, CAST(N'2019-12-19T19:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (40, 18, 73, CAST(N'2019-11-15T17:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (41, 6, 32, CAST(N'2019-07-04T17:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (42, 31, 19, CAST(N'2019-08-06T11:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (43, 50, 66, CAST(N'2019-11-09T13:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (44, 11, 22, CAST(N'2019-02-16T18:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (45, 22, 31, CAST(N'2019-03-03T17:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (46, 47, 82, CAST(N'2019-05-22T16:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (47, 37, 97, CAST(N'2019-07-31T18:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (48, 34, 24, CAST(N'2019-08-29T19:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (49, 31, 65, CAST(N'2019-10-02T10:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (50, 36, 19, CAST(N'2019-03-16T11:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (51, 2, 73, CAST(N'2019-08-27T11:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (52, 1, 27, CAST(N'2019-06-13T11:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (53, 45, 66, CAST(N'2019-08-18T16:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (54, 17, 80, CAST(N'2019-12-26T16:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (55, 42, 86, CAST(N'2019-11-27T18:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (56, 41, 65, CAST(N'2019-09-06T19:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (57, 15, 8, CAST(N'2019-09-24T13:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (58, 18, 43, CAST(N'2019-03-01T11:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (59, 49, 86, CAST(N'2019-09-28T10:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (60, 14, 6, CAST(N'2019-03-20T10:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (61, 35, 66, CAST(N'2019-11-27T11:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (62, 28, 5, CAST(N'2019-01-23T18:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (63, 23, 24, CAST(N'2019-10-21T10:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (64, 16, 6, CAST(N'2019-08-11T12:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (65, 44, 65, CAST(N'2019-01-03T14:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (66, 29, 52, CAST(N'2019-12-31T08:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (67, 30, 83, CAST(N'2019-08-29T10:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (68, 47, 61, CAST(N'2019-01-03T18:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (69, 17, 89, CAST(N'2019-04-09T11:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (70, 23, 71, CAST(N'2019-12-31T19:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (71, 39, 61, CAST(N'2019-10-17T13:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (72, 15, 31, CAST(N'2019-05-17T13:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (73, 42, 100, CAST(N'2019-11-23T18:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (74, 35, 69, CAST(N'2019-07-10T15:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (75, 33, 15, CAST(N'2019-06-09T13:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (76, 22, 31, CAST(N'2019-01-09T10:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (77, 39, 5, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (78, 20, 69, CAST(N'2019-07-15T14:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (79, 31, 100, CAST(N'2019-12-31T18:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (80, 18, 86, CAST(N'2019-12-22T09:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (81, 17, 63, CAST(N'2019-12-28T16:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (82, 29, 31, CAST(N'2019-06-26T10:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (83, 35, 97, CAST(N'2019-04-29T12:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (84, 38, 97, CAST(N'2019-04-13T09:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (85, 22, 91, CAST(N'2019-01-05T16:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (86, 49, 15, CAST(N'2019-03-25T18:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (87, 20, 39, CAST(N'2019-11-09T18:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (88, 27, 19, CAST(N'2019-04-07T10:40:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (89, 48, 51, CAST(N'2019-11-11T18:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (90, 19, 65, CAST(N'2019-01-06T15:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (91, 45, 91, CAST(N'2019-08-20T19:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (92, 8, 91, CAST(N'2019-04-16T13:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (93, 23, 94, CAST(N'2019-12-22T15:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (94, 9, 69, CAST(N'2019-01-22T16:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (95, 36, 39, CAST(N'2019-09-04T08:10:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (96, 30, 60, CAST(N'2019-01-01T14:50:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (97, 50, 100, CAST(N'2019-01-29T16:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (98, 9, 57, CAST(N'2019-07-06T11:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (99, 16, 8, CAST(N'2019-12-05T10:20:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment], [IDWorker]) VALUES (100, 46, 91, CAST(N'2019-04-05T13:20:00.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'Женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'Мужской')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (1, N'Занятие с репетитором-носителем китайского языка', N'Услуги школы\Китайский язык.jpg', 8200, 1950.0000, 1, N'1')
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (2, N'Индивидуальный урок немецкого языка с преподавателем-носителем языка', N'Услуги школы\Немецкий язык.png', 6600, 2340.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (4, N'Индивидуальный онлайн-урок японского языка по Skype', N'Услуги школы\online lessons.jpg', 4800, 1000.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (5, N'Киноклуб испанского языка для студентов', N'Услуги школы\киноклуб.jpg', 2400, 1050.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (6, N'Занятие с русскоязычным репетитором испанского языка', N'Услуги школы\Испанский язык.jpg', 3000, 1450.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (7, N'Урок в группе итальянского языка для взрослых', N'Услуги школы\Итальянский язык.jpg', 2400, 1290.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (8, N'Интенсивный онлайн-курс французского языка для компаний по Skype', N'Услуги школы\online lessons.jpg', 2400, 1180.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (9, N'Индивидуальный урок французского языка с преподавателем-носителем языка', N'Услуги школы\Французский язык.jpg', 2400, 1410.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (10, N'Урок в группе французского языка для школьников', N'Услуги школы\Французский язык.jpg', 6000, 1970.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (11, N'Занятие с репетитором-носителем английского языка', N'Услуги школы\Английский язык.jpg', 6600, 910.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (12, N'Киноклуб французского языка для взрослых', N'Услуги школы\киноклуб.jpg', 5400, 1770.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (13, N'Киноклуб немецкого языка для взрослых', N'Услуги школы\киноклуб.jpg', 6000, 1560.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (14, N'Урок в группе японского языка для школьников', N'Услуги школы\Японский язык.jpg', 4800, 1300.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (15, N'Индивидуальный урок испанского языка с русскоязычным преподавателем', N'Услуги школы\Испанский язык.jpg', 3600, 1790.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (16, N'Интенсивный онлайн-курс итальянского языка для компаний по Skype', N'Услуги школы\online lessons.jpg', 4200, 1230.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (17, N'Урок в группе японского языка для студентов', N'Услуги школы\Японский язык.jpg', 3000, 1860.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (18, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', N'Услуги школы\for company.jpg', 6600, 1670.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (19, N'Киноклуб итальянского языка для студентов', N'Услуги школы\киноклуб.jpg', 1800, 1760.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (20, N'Урок в группе испанского языка для взрослых', N'Услуги школы\Испанский язык.jpg', 1800, 1730.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (21, N'Урок в группе испанского языка для студентов', N'Услуги школы\Испанский язык.jpg', 6000, 1310.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (22, N'Интенсивный онлайн-курс испанского языка для компаний по Skype', N'Услуги школы\online lessons.jpg', 7200, 1510.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (23, N'Урок в группе английского языка для школьников', N'Услуги школы\Английский язык.jpg', 6600, 900.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (24, N'Занятие с репетитором-носителем испанского языка', N'Услуги школы\Испанский язык.jpg', 3000, 1090.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (25, N'Интенсивный курс с преподавателем-носителем итальянского языка для компаний', N'Услуги школы\for company.jpg', 2400, 1190.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (26, N'Урок в группе китайского языка для студентов', N'Услуги школы\Китайский язык.jpg', 2400, 2000.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (27, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', N'Услуги школы\Испанский язык.jpg', 5400, 1200.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (28, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', N'Услуги школы\online lessons.jpg', 4200, 1610.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (29, N'Подготовка к экзамену ACT', N'Услуги школы\Подготовка к экзамену ACT.png', 3000, 1440.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (30, N'Урок в группе китайского языка для взрослых', N'Услуги школы\Китайский язык.jpg', 4200, 1730.0000, 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (31, N'Интенсивный онлайн-курс английского языка для компаний по Skype', N'Услуги школы\online lessons.jpg', 3000, 1160.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (32, N'Подготовка к экзамену TOEFL', N'Услуги школы\Подготовка к экзамену TOEFL.jpg', 6000, 1070.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (33, N'Занятие с репетитором-носителем итальянского языка', N'Услуги школы\Итальянский язык.jpg', 7200, 1370.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (34, N'Урок в группе английского языка для взрослых', N'Услуги школы\Английский язык.jpg', 3000, 1010.0000, 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (35, N'Киноклуб английского языка для взрослых', N'Услуги школы\киноклуб.jpg', 4200, 1250.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (36, N'Интенсивный курс с преподавателем-носителем французского языка для компаний', N'Услуги школы\for company.jpg', 4200, 1630.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (37, N'Урок в группе испанского языка для школьников', N'Услуги школы\Испанский язык.jpg', 7200, 1910.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (38, N'Подготовка к экзамену GRE', N'Услуги школы\Подготовка к экзамену GRE.jpeg', 4800, 1300.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (39, N'Урок в группе английского языка для студентов', N'Услуги школы\Английский язык.jpg', 4800, 960.0000, 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (40, N'Занятие с русскоязычным репетитором японского языка', N'Услуги школы\Японский язык.jpg', 2400, 1260.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (41, N'Индивидуальный онлайн-урок немецкого языка по Skype', N'Услуги школы\online lessons.jpg', 5400, 970.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (42, N'Интенсивный курс японского языка с русскоязычным преподавателем для компаний', N'Услуги школы\for company.jpg', 4800, 1500.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (43, N'Киноклуб китайского языка для взрослых', N'Услуги школы\киноклуб.jpg', 4200, 1800.0000, 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (44, N'Индивидуальный урок китайского языка с русскоязычным преподавателем', N'Услуги школы\Китайский язык.jpg', 7200, 1860.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (45, N'Подготовка к экзамену GMAT', N'Услуги школы\Подготовка к экзамену GMAT.png', 4200, 1150.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (46, N'Подготовка к экзамену IELTS', N'Услуги школы\Подготовка к экзамену IELTS.jpg', 7200, 1730.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (47, N'Подготовка к экзамену SAT', N'Услуги школы\Подготовка к экзамену SAT.png', 2400, 1560.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (48, N'Урок в группе китайского языка для школьников', N'Услуги школы\Китайский язык.jpg', 3000, 1180.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (49, N'Киноклуб английского языка для студентов', N'Услуги школы\киноклуб.jpg', 4800, 980.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (50, N'Киноклуб португальского языка для студентов', N'Услуги школы\киноклуб.jpg', 1800, 1170.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (51, N'Киноклуб китайского языка для детей', N'Услуги школы\киноклуб.jpg', 6000, 1120.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (52, N'Урок в группе немецкого языка для школьников', N'Услуги школы\Немецкий язык.png', 1800, 1570.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (53, N'Индивидуальный онлайн-урок испанского языка по Skype', N'Услуги школы\online lessons.jpg', 4200, 1780.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (54, N'Урок в группе немецкого языка для взрослых', N'Услуги школы\Немецкий язык.png', 3600, 930.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (55, N'Индивидуальный урок китайского языка с преподавателем-носителем языка', N'Услуги школы\Китайский язык.jpg', 5400, 1480.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (56, N'Занятие с русскоязычным репетитором португальского языка', N'Услуги школы\Португальский язык.jpg', 3000, 1970.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (57, N'Интенсивный курс китайского языка с русскоязычным преподавателем для компаний', N'Услуги школы\for company.jpg', 6600, 1470.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (58, N'Занятие с русскоязычным репетитором немецкого языка', N'Услуги школы\Немецкий язык.png', 1800, 1420.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (59, N'Киноклуб английского языка для детей', N'Услуги школы\киноклуб.jpg', 2400, 1280.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (60, N'Занятие с репетитором-носителем немецкого языка', N'Услуги школы\Немецкий язык.png', 7200, 1120.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (61, N'Индивидуальный онлайн-урок китайского языка по Skype', N'Услуги школы\online lessons.jpg', 4200, 1410.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (62, N'Индивидуальный урок английского языка с преподавателем-носителем языка', N'Услуги школы\Английский язык.jpg', 7200, 1300.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (63, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', N'Услуги школы\for company.jpg', 7200, 1180.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (64, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', N'Услуги школы\online lessons.jpg', 4200, 1840.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (65, N'Урок в группе итальянского языка для школьников', N'Услуги школы\Итальянский язык.jpg', 6000, 1410.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (66, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', N'Услуги школы\Итальянский язык.jpg', 1800, 1330.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (67, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', N'Услуги школы\online lessons.jpg', 7200, 1760.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (68, N'Занятие с русскоязычным репетитором французского языка', N'Услуги школы\Французский язык.jpg', 6000, 1870.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (69, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', N'Услуги школы\Немецкий язык.png', 1800, 990.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (70, N'Индивидуальный онлайн-урок английского языка по Skype', N'Услуги школы\online lessons.jpg', 6000, 1880.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (71, N'Индивидуальный урок французского языка с русскоязычным преподавателем', N'Услуги школы\Французский язык.jpg', 4200, 1390.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (72, N'Интенсивный курс португальского языка с русскоязычным преподавателем для компаний', N'Услуги школы\for company.jpg', 3600, 2010.0000, 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (73, N'Индивидуальный онлайн-урок французского языка по Skype', N'Услуги школы\online lessons.jpg', 7200, 2010.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (74, N'Интенсивный курс английского языка с русскоязычным преподавателем для компаний', N'Услуги школы\for company.jpg', 4800, 1210.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (75, N'Урок в группе французского языка для взрослых', N'Услуги школы\Французский язык.jpg', 7200, 960.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (76, N'Подготовка к экзамену IELTS Speaking Club', N'Услуги школы\Подготовка к экзамену IELTS.jpg', 5400, 1430.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (77, N'Киноклуб итальянского языка для детей', N'Услуги школы\киноклуб.jpg', 4200, 1480.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (78, N'Урок в группе итальянского языка для студентов', N'Услуги школы\Итальянский язык.jpg', 6600, 1020.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (79, N'Индивидуальный урок итальянского языка с преподавателем-носителем языка', N'Услуги школы\Итальянский язык.jpg', 4800, 1690.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (80, N'Киноклуб немецкого языка для детей', N'Услуги школы\киноклуб.jpg', 7200, 1670.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (81, N'Киноклуб итальянского языка для взрослых', N'Услуги школы\киноклуб.jpg', 6600, 1760.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (82, N'Киноклуб португальского языка для взрослых', N'Услуги школы\киноклуб.jpg', 1800, 950.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (83, N'Киноклуб португальского языка для детей', N'Услуги школы\киноклуб.jpg', 5400, 1710.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (84, N'Киноклуб французского языка для детей', N'Услуги школы\киноклуб.jpg', 5400, 1600.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (85, N'Урок в группе японского языка для взрослых', N'Услуги школы\Японский язык.jpg', 4800, 1420.0000, 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (86, N'Интенсивный курс французского языка с русскоязычным преподавателем для компаний', N'Услуги школы\for company.jpg', 2400, 1940.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (87, N'Занятие с русскоязычным репетитором итальянского языка', N'Услуги школы\Итальянский язык.jpg', 4200, 1620.0000, 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (88, N'Индивидуальный урок английского языка с русскоязычным преподавателем', N'Услуги школы\Английский язык.jpg', 1800, 1910.0000, 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (89, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', N'Услуги школы\for company.jpg', 1800, 1580.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (90, N'Интенсивный курс испанского языка с русскоязычным преподавателем для компаний', N'Услуги школы\for company.jpg', 5400, 1000.0000, 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (91, N'Киноклуб немецкого языка для студентов', N'Услуги школы\киноклуб.jpg', 3000, 1140.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (92, N'Занятие с репетитором-носителем французского языка', N'Услуги школы\Французский язык.jpg', 3000, 2040.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (93, N'Урок в группе немецкого языка для студентов', N'Услуги школы\Немецкий язык.png', 4200, 1240.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (94, N'Занятие с русскоязычным репетитором китайского языка', N'Услуги школы\Китайский язык.jpg', 6600, 940.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (95, N'Занятие с репетитором-носителем японского языка', N'Услуги школы\Японский язык.jpg', 3000, 1100.0000, 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (96, N'Урок в группе французского языка для студентов', N'Услуги школы\Французский язык.jpg', 1800, 1910.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (97, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', N'Услуги школы\for company.jpg', 6600, 900.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (98, N'Занятие с русскоязычным репетитором английского языка', N'Услуги школы\Английский язык.jpg', 5400, 1950.0000, 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (99, N'Интенсивный курс с преподавателем-носителем испанского языка для компаний', N'Услуги школы\for company.jpg', 5400, 1660.0000, 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [DurationInSeconds], [Cost], [Discount], [Description]) VALUES (100, N'Интенсивный курс с преподавателем-носителем японского языка для компаний', N'Услуги школы\for company.jpg', 4200, 1380.0000, 0.2, NULL)
GO
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Worker] ON 

INSERT [dbo].[Worker] ([ID], [Login], [Password]) VALUES (1, N'Admin', N'0000')
SET IDENTITY_INSERT [dbo].[Worker] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Worker] FOREIGN KEY([IDWorker])
REFERENCES [dbo].[Worker] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Worker]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [School] SET  READ_WRITE 
GO
