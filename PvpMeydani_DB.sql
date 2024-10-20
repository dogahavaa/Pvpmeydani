USE [master]
GO
/****** Object:  Database [PvpMeydani_DB]    Script Date: 4.10.2024 12:51:07 ******/
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
/****** Object:  Table [dbo].[Gorevler]    Script Date: 4.10.2024 12:51:07 ******/
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
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 4.10.2024 12:51:07 ******/
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
/****** Object:  Table [dbo].[Konular]    Script Date: 4.10.2024 12:51:07 ******/
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
 CONSTRAINT [pk_konular] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turler]    Script Date: 4.10.2024 12:51:07 ******/
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
/****** Object:  Table [dbo].[Uyeler]    Script Date: 4.10.2024 12:51:07 ******/
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
/****** Object:  Table [dbo].[Yanitlar]    Script Date: 4.10.2024 12:51:07 ******/
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
/****** Object:  Table [dbo].[Yoneticiler]    Script Date: 4.10.2024 12:51:07 ******/
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
/****** Object:  Table [dbo].[Yorumlar]    Script Date: 4.10.2024 12:51:07 ******/
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
 CONSTRAINT [pk_yorumlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zorluklar]    Script Date: 4.10.2024 12:51:07 ******/
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
SET IDENTITY_INSERT [dbo].[Gorevler] ON 

INSERT [dbo].[Gorevler] ([ID], [Gorev]) VALUES (4, N'Boşta')
INSERT [dbo].[Gorevler] ([ID], [Gorev]) VALUES (11, N'Admin')
INSERT [dbo].[Gorevler] ([ID], [Gorev]) VALUES (16, N'Moderatör')
INSERT [dbo].[Gorevler] ([ID], [Gorev]) VALUES (18, N'Editör')
SET IDENTITY_INSERT [dbo].[Gorevler] OFF
GO
SET IDENTITY_INSERT [dbo].[Turler] ON 

INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (1, N'1-99')
INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (2, N'1-120')
INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (6, N'1-105')
INSERT [dbo].[Turler] ([ID], [Tur]) VALUES (7, N'55-120')
SET IDENTITY_INSERT [dbo].[Turler] OFF
GO
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1526, N'Doğa', N'Hava', N'dogahavaa', N'dogahava@gmail.comm', N'1234', N'none.png', 0, 0, 0, 0, 0, 0, CAST(N'2024-10-02T22:11:31.230' AS DateTime))
INSERT [dbo].[Uyeler] ([ID], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [ProfilFotografi], [Onayli], [Donmus], [Silinmis], [MesajSayisi], [KonuSayisi], [ReaksiyonSkoru], [UyelikTarihi]) VALUES (1527, N'uye', N'uye soyad', N'uyusyueu', N'sdslk@sds.com', N'1234', N'none.png', 0, 0, 0, 0, 0, 0, CAST(N'2024-10-02T22:18:21.830' AS DateTime))
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
GO
SET IDENTITY_INSERT [dbo].[Yoneticiler] ON 

INSERT [dbo].[Yoneticiler] ([ID], [GorevID], [ProfilFotografi], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [Durum], [Silinmis]) VALUES (11, 11, N'c7c06daf-9a0d-4929-b759-4cbd7901c906.jpeg', N'Doğa', N'Hava', N'dogahava', N'dogahava@gmail.com', N'1234', 1, 0)
INSERT [dbo].[Yoneticiler] ([ID], [GorevID], [ProfilFotografi], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [Durum], [Silinmis]) VALUES (13, 16, N'40cec535-5b74-4460-97b8-0ea46e59e343.png', N'Kamil', N'Kamiloğlu', N'kamilogli', N'kamil@gmail.com', N'1234', 1, 0)
INSERT [dbo].[Yoneticiler] ([ID], [GorevID], [ProfilFotografi], [Ad], [Soyad], [KullaniciAdi], [Mail], [Sifre], [Durum], [Silinmis]) VALUES (15, 4, N'none.png', N'Kamil2', N'Kamiloğlu', N'kamilogliiis', N'kamil@gmail.comsda', N'1234', 0, 0)
SET IDENTITY_INSERT [dbo].[Yoneticiler] OFF
GO
SET IDENTITY_INSERT [dbo].[Zorluklar] ON 

INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (1, N'Kolay')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (2, N'Orta')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (3, N'Zor')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (5, N'Tr Tipi')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (6, N'Wslik Server')
INSERT [dbo].[Zorluklar] ([ID], [Zorluk]) VALUES (7, N'Emek Server')
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
ALTER TABLE [dbo].[Yoneticiler]  WITH CHECK ADD  CONSTRAINT [fk_yoneticiler_gorevler] FOREIGN KEY([GorevID])
REFERENCES [dbo].[Gorevler] ([ID])
GO
ALTER TABLE [dbo].[Yoneticiler] CHECK CONSTRAINT [fk_yoneticiler_gorevler]
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
