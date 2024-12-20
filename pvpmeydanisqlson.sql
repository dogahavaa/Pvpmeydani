USE [master]
GO
/****** Object:  Database [PvpMeydani_DB]    Script Date: 27.10.2024 13:49:20 ******/
CREATE DATABASE [PvpMeydani_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PvpMeydani_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PvpMeydani_DB.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PvpMeydani_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PvpMeydani_DB_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PvpMeydani_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PvpMeydani_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PvpMeydani_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PvpMeydani_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PvpMeydani_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PvpMeydani_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PvpMeydani_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PvpMeydani_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PvpMeydani_DB] SET  MULTI_USER 
GO
ALTER DATABASE [PvpMeydani_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PvpMeydani_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PvpMeydani_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PvpMeydani_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PvpMeydani_DB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [PvpMeydani_DB]
GO
/****** Object:  Table [dbo].[Begeniler]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Begeniler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[konuID] [int] NOT NULL,
	[yorumID] [int] NOT NULL,
	[uyeID] [int] NOT NULL,
 CONSTRAINT [pk_begeniler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[konuID] ASC,
	[yorumID] ASC,
	[uyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gorevler]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gorevler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Gorev] [nvarchar](50) NULL,
 CONSTRAINT [pk_gorevler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Isim] [nvarchar](150) NULL,
	[Aciklama] [nvarchar](1000) NULL,
	[Durum] [bit] NULL,
	[Silinmis] [bit] NULL,
 CONSTRAINT [pk_kategoriler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KonuBegenileri]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KonuBegenileri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[konuID] [int] NOT NULL,
	[uyeID] [int] NOT NULL,
 CONSTRAINT [pk_konuBegenileri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[konuID] ASC,
	[uyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Konular]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Konular](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TurID] [int] NULL,
	[ZorlukID] [int] NULL,
	[UyeID] [int] NULL,
	[Baslik] [nvarchar](150) NULL,
	[Icerik] [nvarchar](max) NULL,
	[ServerAdi] [nvarchar](150) NULL,
	[Website] [nvarchar](150) NULL,
	[AcilisTarihi] [datetime] NULL,
	[ServerDurumu] [bit] NULL,
	[VipKonu] [bit] NULL,
	[EklenmeTarihi] [datetime] NULL,
	[GuncellenmeTarihi] [datetime] NULL,
	[GoruntulemeSayisi] [int] NULL,
	[BegeniSayisi] [int] NULL,
	[YorumSayisi] [int] NULL,
	[Onayli] [bit] NULL,
	[SonYorumTarihi] [datetime] NULL,
	[SonYorumKAdi] [nvarchar](150) NULL,
	[Durum] [bit] NULL,
 CONSTRAINT [pk_konular] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turler]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tur] [nvarchar](50) NULL,
 CONSTRAINT [pk_turler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[ID] [int] IDENTITY(1524,1) NOT NULL,
	[Ad] [nvarchar](100) NULL,
	[Soyad] [nvarchar](100) NULL,
	[KullaniciAdi] [nvarchar](100) NULL,
	[Mail] [nvarchar](150) NULL,
	[Sifre] [nvarchar](100) NULL,
	[ProfilFotografi] [nvarchar](150) NULL,
	[Onayli] [bit] NULL,
	[Donmus] [bit] NULL,
	[Silinmis] [bit] NULL,
	[MesajSayisi] [int] NULL,
	[KonuSayisi] [int] NULL,
	[ReaksiyonSkoru] [int] NULL,
	[UyelikTarihi] [datetime] NULL,
 CONSTRAINT [pk_uyeler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yanitlar]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yanitlar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[YorumID] [int] NULL,
	[UyeID] [int] NULL,
	[Icerik] [nvarchar](1000) NULL,
	[EklemeTarihi] [datetime] NULL,
	[BegeniSayisi] [int] NULL,
	[Onayli] [bit] NULL,
 CONSTRAINT [pk_yanitlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yetkilendirme]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yetkilendirme](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Islem] [nvarchar](100) NULL,
 CONSTRAINT [pk_yetkilendirme] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YetkilendirmeGorevAra]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YetkilendirmeGorevAra](
	[GorevID] [int] NOT NULL,
	[YetkilendirmeID] [int] NOT NULL,
	[Onay] [bit] NULL,
 CONSTRAINT [pk_yetkilendirmeGorev] PRIMARY KEY CLUSTERED 
(
	[GorevID] ASC,
	[YetkilendirmeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yoneticiler]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yoneticiler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GorevID] [int] NULL,
	[ProfilFotografi] [nvarchar](100) NULL,
	[Ad] [nvarchar](100) NULL,
	[Soyad] [nvarchar](100) NULL,
	[KullaniciAdi] [nvarchar](100) NULL,
	[Mail] [nvarchar](150) NULL,
	[Sifre] [nvarchar](100) NULL,
	[Durum] [bit] NULL,
	[Silinmis] [bit] NULL,
 CONSTRAINT [pk_yoneticiler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yorumlar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UyeID] [int] NULL,
	[Icerik] [nvarchar](1000) NULL,
	[EklemeTarihi] [datetime] NULL,
	[BegeniSayisi] [int] NULL,
	[Onayli] [bit] NULL,
	[KonuID] [int] NULL,
 CONSTRAINT [pk_yorumlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zorluklar]    Script Date: 27.10.2024 13:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zorluklar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Zorluk] [nvarchar](50) NULL,
 CONSTRAINT [pk_zorluklar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Begeniler] ON 

INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (1, 3, 4, 1533)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (2, 3, 4, 1526)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (3, 3, 6, 1526)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (4, 7, 7, 1533)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (5, 7, 12, 1526)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (6, 7, 7, 1526)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (7, 4, 2, 1526)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (8, 1, 5, 1533)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (9, 4, 15, 1533)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (10, 3, 6, 1533)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (11, 7, 14, 1533)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (12, 7, 13, 1533)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (13, 3, 4, 1534)
INSERT [dbo].[Begeniler] ([ID], [konuID], [yorumID], [uyeID]) VALUES (14, 7, 16, 1533)
SET IDENTITY_INSERT [dbo].[Begeniler] OFF
GO
SET IDENTITY_INSERT [dbo].[Gorevler] ON 

INSERT [dbo].[Gorevler] ([ID], [Gorev]) VALUES (4, N'Boşta')
INSERT [dbo].[Gorevler] ([ID], [Gorev]) VALUES (11, N'Admin')
INSERT [dbo].[Gorevler] ([ID], [Gorev]) VALUES (28, N'Moderatör')
INSERT [dbo].[Gorevler] ([ID], [Gorev]) VALUES (29, N'Editör')
SET IDENTITY_INSERT [dbo].[Gorevler] OFF
GO
SET IDENTITY_INSERT [dbo].[KonuBegenileri] ON 

INSERT [dbo].[KonuBegenileri] ([ID], [konuID], [uyeID]) VALUES (1, 7, 1533)
INSERT [dbo].[KonuBegenileri] ([ID], [konuID], [uyeID]) VALUES (2, 7, 1526)
INSERT [dbo].[KonuBegenileri] ([ID], [konuID], [uyeID]) VALUES (3, 3, 1533)
SET IDENTITY_INSERT [dbo].[KonuBegenileri] OFF
GO
SET IDENTITY_INSERT [dbo].[Konular] ON 

INSERT [dbo].[Konular] ([ID], [TurID], [ZorlukID], [UyeID], [Baslik], [Icerik], [ServerAdi], [Website], [AcilisTarihi], [ServerDurumu], [VipKonu], [EklenmeTarihi], [GuncellenmeTarihi], [GoruntulemeSayisi], [BegeniSayisi], [YorumSayisi], [Onayli], [SonYorumTarihi], [SonYorumKAdi], [Durum]) VALUES (1, 1, 1, 1532, N'asda', N'fdgdfgd"', N'asdad', N'asdas', CAST(N'2024-10-18T00:00:00.000' AS DateTime), 0, 0, CAST(N'2024-10-12T00:00:00.000' AS DateTime), CAST(N'2024-10-12T00:00:00.000' AS DateTime), 12, 0, 0, 1, CAST(N'2024-10-12T00:00:00.000' AS DateTime), N'fkocaoglu', 1)
INSERT [dbo].[Konular] ([ID], [TurID], [ZorlukID], [UyeID], [Baslik], [Icerik], [ServerAdi], [Website], [AcilisTarihi], [ServerDurumu], [VipKonu], [EklenmeTarihi], [GuncellenmeTarihi], [GoruntulemeSayisi], [BegeniSayisi], [YorumSayisi], [Onayli], [SonYorumTarihi], [SonYorumKAdi], [Durum]) VALUES (3, 1, 2, 1532, N'deneme baslık', N'sadasdad', N'sw adı', N'asdas', CAST(N'2024-10-11T00:00:00.000' AS DateTime), 1, 0, CAST(N'2024-10-15T13:30:30.920' AS DateTime), CAST(N'2024-10-15T13:30:30.920' AS DateTime), 26, 1, 1, 1, CAST(N'2024-10-15T13:30:30.920' AS DateTime), N'fkocaoglu', 1)
INSERT [dbo].[Konular] ([ID], [TurID], [ZorlukID], [UyeID], [Baslik], [Icerik], [ServerAdi], [Website], [AcilisTarihi], [ServerDurumu], [VipKonu], [EklenmeTarihi], [GuncellenmeTarihi], [GoruntulemeSayisi], [BegeniSayisi], [YorumSayisi], [Onayli], [SonYorumTarihi], [SonYorumKAdi], [Durum]) VALUES (4, 1, 2, 1532, N'deneme baslık', N'sadasdad', N'sw adı', N'asdas', CAST(N'2024-10-11T00:00:00.000' AS DateTime), 1, 0, CAST(N'2024-10-15T13:30:32.543' AS DateTime), CAST(N'2024-10-15T13:30:32.543' AS DateTime), 12, 0, 1, 1, CAST(N'2024-10-15T13:30:32.543' AS DateTime), N'fkocaoglu', 0)
INSERT [dbo].[Konular] ([ID], [TurID], [ZorlukID], [UyeID], [Baslik], [Icerik], [ServerAdi], [Website], [AcilisTarihi], [ServerDurumu], [VipKonu], [EklenmeTarihi], [GuncellenmeTarihi], [GoruntulemeSayisi], [BegeniSayisi], [YorumSayisi], [Onayli], [SonYorumTarihi], [SonYorumKAdi], [Durum]) VALUES (6, 6, 5, 1532, N'deneme baslıkasdasd', N'sadasdadasdasdadasda', N'sw adıasdad', N'asdasasda', CAST(N'2024-10-26T00:00:00.000' AS DateTime), 0, 0, CAST(N'2024-10-15T13:30:44.937' AS DateTime), CAST(N'2024-10-15T13:30:44.937' AS DateTime), 10, 0, 2, 1, CAST(N'2024-10-15T13:30:44.937' AS DateTime), N'fkocaoglu', 0)
INSERT [dbo].[Konular] ([ID], [TurID], [ZorlukID], [UyeID], [Baslik], [Icerik], [ServerAdi], [Website], [AcilisTarihi], [ServerDurumu], [VipKonu], [EklenmeTarihi], [GuncellenmeTarihi], [GoruntulemeSayisi], [BegeniSayisi], [YorumSayisi], [Onayli], [SonYorumTarihi], [SonYorumKAdi], [Durum]) VALUES (7, 2, 1, 1532, N'Lorem Ipsum', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a varius erat. Maecenas scelerisque lobortis accumsan. Maecenas sapien leo, pulvinar sit amet dictum eu, auctor id lorem. Sed ut maximus felis. Donec venenatis lacus in justo venenatis venenatis. Suspendisse porttitor pulvinar orci nec commodo. Nulla nec nisl tempus, mattis nisl id, auctor augue. In finibus elit sit amet mi ultricies, eu vulputate erat mattis. Maecenas hendrerit, nulla vitae luctus interdum, metus eros malesuada augue, et bibendum felis tellus vitae diam. Sed nec nisi nibh. Suspendisse pretium vestibulum sem at dictum. Nullam dictum mi odio, vitae viverra arcu semper luctus.

Sed eget nulla porttitor, sodales purus in, euismod nulla. Proin arcu eros, posuere eget cursus non, tempus ac purus. Phasellus suscipit et erat vitae placerat. In nec nisl sed mi sagittis porttitor sed pulvinar arcu. Sed faucibus sem vitae enim suscipit, a sollicitudin urna viverra. Aliquam a est in enim tincidunt laoreet. Aliquam congue, enim ut porttitor luctus, nunc arcu condimentum felis, vel auctor velit tellus eu nunc.
', N'Lorem mt2', N'https://www.lipsum.com', CAST(N'2024-10-26T00:00:00.000' AS DateTime), 1, 1, CAST(N'2024-10-24T00:45:53.967' AS DateTime), CAST(N'2024-10-24T00:45:53.967' AS DateTime), 64, 2, 5, 1, CAST(N'2024-10-24T00:45:53.967' AS DateTime), N'fkocaoglu', 1)
INSERT [dbo].[Konular] ([ID], [TurID], [ZorlukID], [UyeID], [Baslik], [Icerik], [ServerAdi], [Website], [AcilisTarihi], [ServerDurumu], [VipKonu], [EklenmeTarihi], [GuncellenmeTarihi], [GoruntulemeSayisi], [BegeniSayisi], [YorumSayisi], [Onayli], [SonYorumTarihi], [SonYorumKAdi], [Durum]) VALUES (8, 1, 2, 1532, N'onaylanmayan konu', N'asdasd', N'asdassad', N'asdasd', CAST(N'2024-10-26T00:00:00.000' AS DateTime), 1, 0, CAST(N'2024-10-26T02:20:22.937' AS DateTime), CAST(N'2024-10-26T02:20:22.937' AS DateTime), 2, 0, 0, 0, CAST(N'2024-10-26T02:20:22.937' AS DateTime), N'fkocaoglu', 1)
SET IDENTITY_INSERT [dbo].[Konular] OFF
GO
SET IDENTITY_INSERT [dbo].[Turler] ON 

INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (1, N'1-99')
INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (2, N'1-120')
INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (6, N'1-105')
INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (8, N'55-120')
INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (9, N'120-121')
SET IDENTITY_INSERT [dbo].[Turler] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1526, N'Doğa', N'Hava', N'dogahavaa', N'dogahava@gmail.comm', N'1234', N'none.png', 1, 0, 0, 6, 0, 27, CAST(N'2024-10-02T22:11:31.230' AS DateTime))
INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1527, N'uye', N'uye soyad', N'uyusyueu', N'sdslk@sds.com', N'1234', N'none.png', 1, 0, 0, 0, 0, 0, CAST(N'2024-10-02T22:18:21.830' AS DateTime))
INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1530, N'dilara nur', N'savran', N'nursaaa', N'nursavran@gmail.comm', N'1234', N'2c1c3d07-08c5-47d1-9409-d548a249b687.jpg', 1, 0, 1, 0, 0, 0, CAST(N'2024-10-05T15:49:15.300' AS DateTime))
INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1531, N'dilara nur', N'savran', N'nursaaas', N'nursavran@gmail.comms', N'1234', N'7dad3a99-1bf5-447e-ab03-7a3baeef9b8a.jpg', 1, 0, 1, 0, 0, 0, CAST(N'2024-10-05T15:55:05.933' AS DateTime))
INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1532, N'furkan', N'kocaoğlu', N'fkocaoglu', N'sdslkds@sds.com', N'1234', N'2d14b2f3-ac11-4411-aaf5-23d76e2b4d75.jpg', 1, 0, 0, 0, 0, 109, CAST(N'2024-10-05T16:22:06.333' AS DateTime))
INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1533, N'Müge', N'Ünal', N'munall', N'm.unal@gmail.com', N'1234', N'none.png', 1, 0, 0, 1, 0, 12, CAST(N'2024-10-11T16:18:15.313' AS DateTime))
INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1534, N'Yeni', N'Üye', N'yeniuye', N'yeniuye@gmail.com', N'1234', N'none.png', 0, 0, 0, 0, 0, 0, CAST(N'2024-10-18T14:12:36.787' AS DateTime))
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yetkilendirme] ON 

INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (30, N'Konu işlemleri sayfası erişilebilirlik')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (31, N'Yorumlar sayfası erişilebilirlik')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (32, N'Üyeler sayfası erişilebilirlik')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (33, N'Etiketler sayfası erişilebilirlik')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (34, N'Yönetici işlemleri sayfası erişilebilirlik')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (35, N'Yetkilendirme sayfası erişilebilirlik')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (36, N'Üye onaylama')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (37, N'Üye silme')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (38, N'Konu onaylama')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (39, N'Konu silme')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (40, N'Yorum onaylama')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (41, N'Yorum silme')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (42, N'Tür bilgisi ekleme')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (43, N'Tür bilgisi silme')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (44, N'Zorluk seviyesi ekleme')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (45, N'Zorluk seviyesi silme')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (47, N'Yönetici durumlarını değiştirme')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (48, N'Yönetici oluşturma')
INSERT [dbo].[Yetkilendirme] ([ID], [Islem]) VALUES (49, N'Konunun vip durumunu değiştirme')
SET IDENTITY_INSERT [dbo].[Yetkilendirme] OFF
GO
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 30, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 31, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 32, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 33, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 34, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 35, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 36, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 37, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 38, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 39, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 40, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 41, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 42, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 43, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 44, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 45, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 47, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 48, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (4, 49, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 30, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 31, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 32, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 33, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 34, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 35, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 36, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 37, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 38, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 39, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 40, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 41, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 42, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 43, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 44, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 45, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 47, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 48, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (11, 49, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 30, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 31, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 32, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 33, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 34, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 35, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 36, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 37, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 38, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 39, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 40, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 41, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 42, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 43, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 44, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 45, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 47, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 48, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (28, 49, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 30, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 31, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 32, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 33, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 34, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 35, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 36, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 37, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 38, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 39, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 40, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 41, 1)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 42, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 43, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 44, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 45, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 47, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 48, 0)
INSERT [dbo].[YetkilendirmeGorevAra] ([GorevID], [YetkilendirmeID], [Onay]) VALUES (29, 49, 0)
GO
SET IDENTITY_INSERT [dbo].[Yoneticiler] ON 

INSERT [dbo].[Yoneticiler] ([ID], [GorevID], [ProfilFotografi], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [Durum], [Silinmis]) VALUES (11, 11, N'c7c06daf-9a0d-4929-b759-4cbd7901c906.jpeg', N'Doğa', N'Hava', N'dogahava', N'dogahava@gmail.com', N'1234', 1, 0)
INSERT [dbo].[Yoneticiler] ([ID], [GorevID], [ProfilFotografi], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [Durum], [Silinmis]) VALUES (15, 28, N'none.png', N'Kamil2', N'Kamiloğlu', N'kamilogliiis', N'kamil@gmail.comsda', N'1234', 0, 1)
SET IDENTITY_INSERT [dbo].[Yoneticiler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yorumlar] ON 

INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (1, 1533, N'deneme yorum', CAST(N'2024-10-18T14:52:54.803' AS DateTime), 0, 0, 4)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (2, 1533, N'deneme yorum', CAST(N'2024-10-18T14:54:41.010' AS DateTime), 1, 1, 4)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (3, 1533, N'deneme yoru 2', CAST(N'2024-10-18T14:55:06.103' AS DateTime), 1, 0, 4)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (4, 1533, N'sayfa yenileme denemesi', CAST(N'2024-10-18T14:58:13.517' AS DateTime), 3, 1, 3)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (5, 1526, N'MARABA', CAST(N'2024-10-23T12:27:13.377' AS DateTime), 1, 0, 1)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (6, 1526, N'MARABA', CAST(N'2024-10-23T12:32:19.033' AS DateTime), 5, 0, 3)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (7, 1533, N'asdasd', CAST(N'2024-10-24T00:47:36.577' AS DateTime), 2, 0, 7)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (8, 1526, N'Yorum sayısı arttır', CAST(N'2024-10-26T18:44:44.337' AS DateTime), 0, 1, 7)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (9, 1526, N'Yorum sayısı arttır 2', CAST(N'2024-10-26T18:46:00.983' AS DateTime), 0, 1, 7)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (10, 1526, N'İlk yorum', CAST(N'2024-10-26T18:54:55.770' AS DateTime), 0, 1, 6)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (11, 1526, N'İkinci yorum', CAST(N'2024-10-26T18:55:23.757' AS DateTime), 0, 1, 6)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (12, 1526, N'Reaksiyon arttır', CAST(N'2024-10-26T19:13:36.657' AS DateTime), 1, 1, 7)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (13, 1526, N'deneme', CAST(N'2024-10-26T19:16:13.757' AS DateTime), 1, 0, 7)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (14, 1526, N'asdasd', CAST(N'2024-10-26T19:16:30.683' AS DateTime), 1, 0, 7)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (15, 1526, N'reaskyioın', CAST(N'2024-10-26T19:17:15.940' AS DateTime), 1, 0, 4)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (16, 1526, N'Güzel konu knks', CAST(N'2024-10-26T21:50:27.187' AS DateTime), 1, 1, 7)
INSERT [dbo].[Yorumlar] ([ID], [UyeID], [Icerik], [EklemeTarihi], [BegeniSayisi], [Onayli], [KonuID]) VALUES (17, 1533, N'okey miyiz', CAST(N'2024-10-26T21:52:10.653' AS DateTime), 0, 1, 3)
SET IDENTITY_INSERT [dbo].[Yorumlar] OFF
GO
SET IDENTITY_INSERT [dbo].[Zorluklar] ON 

INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (1, N'Kolay')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (2, N'Orta')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (3, N'Zor')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (5, N'Tr Tipi')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (9, N'Orta-Zor')
SET IDENTITY_INSERT [dbo].[Zorluklar] OFF
GO
ALTER TABLE [dbo].[Konular]  WITH CHECK ADD  CONSTRAINT [fk_konular_turler] FOREIGN KEY([TurID])
REFERENCES [dbo].[Turler] ([ID])
GO
ALTER TABLE [dbo].[Konular] CHECK CONSTRAINT [fk_konular_turler]
GO
ALTER TABLE [dbo].[Konular]  WITH CHECK ADD  CONSTRAINT [fk_konular_uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([ID])
GO
ALTER TABLE [dbo].[Konular] CHECK CONSTRAINT [fk_konular_uyeler]
GO
ALTER TABLE [dbo].[Konular]  WITH CHECK ADD  CONSTRAINT [fk_konular_zorluklar] FOREIGN KEY([ZorlukID])
REFERENCES [dbo].[Zorluklar] ([ID])
GO
ALTER TABLE [dbo].[Konular] CHECK CONSTRAINT [fk_konular_zorluklar]
GO
ALTER TABLE [dbo].[Yanitlar]  WITH CHECK ADD  CONSTRAINT [fk_yanitlar_uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([ID])
GO
ALTER TABLE [dbo].[Yanitlar] CHECK CONSTRAINT [fk_yanitlar_uyeler]
GO
ALTER TABLE [dbo].[Yanitlar]  WITH CHECK ADD  CONSTRAINT [fk_yanitlar_yorumlar] FOREIGN KEY([YorumID])
REFERENCES [dbo].[Yorumlar] ([ID])
GO
ALTER TABLE [dbo].[Yanitlar] CHECK CONSTRAINT [fk_yanitlar_yorumlar]
GO
ALTER TABLE [dbo].[YetkilendirmeGorevAra]  WITH CHECK ADD  CONSTRAINT [fk_gorevAra] FOREIGN KEY([GorevID])
REFERENCES [dbo].[Gorevler] ([ID])
GO
ALTER TABLE [dbo].[YetkilendirmeGorevAra] CHECK CONSTRAINT [fk_gorevAra]
GO
ALTER TABLE [dbo].[YetkilendirmeGorevAra]  WITH CHECK ADD  CONSTRAINT [fk_yetkilendirmeAra] FOREIGN KEY([YetkilendirmeID])
REFERENCES [dbo].[Yetkilendirme] ([ID])
GO
ALTER TABLE [dbo].[YetkilendirmeGorevAra] CHECK CONSTRAINT [fk_yetkilendirmeAra]
GO
ALTER TABLE [dbo].[Yoneticiler]  WITH CHECK ADD  CONSTRAINT [fk_yoneticiler_gorevler] FOREIGN KEY([GorevID])
REFERENCES [dbo].[Gorevler] ([ID])
GO
ALTER TABLE [dbo].[Yoneticiler] CHECK CONSTRAINT [fk_yoneticiler_gorevler]
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD FOREIGN KEY([KonuID])
REFERENCES [dbo].[Konular] ([ID])
GO
ALTER TABLE [dbo].[Yorumlar]  WITH CHECK ADD  CONSTRAINT [fk_yorumlar_uyeler] FOREIGN KEY([UyeID])
REFERENCES [dbo].[Uyeler] ([ID])
GO
ALTER TABLE [dbo].[Yorumlar] CHECK CONSTRAINT [fk_yorumlar_uyeler]
GO
USE [master]
GO
ALTER DATABASE [PvpMeydani_DB] SET  READ_WRITE 
GO
