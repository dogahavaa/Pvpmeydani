CREATE DATABASE PvpMeydani_DB
GO
USE PvpMeydani_DB
GO
CREATE TABLE Gorevler
(
	ID int IDENTITY(1,1),
	Gorev nvarchar(50)
	CONSTRAINT pk_gorevler PRIMARY KEY(ID)
)
GO
INSERT INTO Gorevler(Gorev) VALUES('Admin')
INSERT INTO Gorevler(Gorev) VALUES('Moderator')
GO
CREATE TABLE Zorluklar
(
	ID int IDENTITY(1,1),
	Zorluk nvarchar(50)
	CONSTRAINT pk_zorluklar PRIMARY KEY(ID)
)
GO
INSERT INTO Zorluklar(Zorluk) VALUES('Kolay')
INSERT INTO Zorluklar(Zorluk) VALUES('Orta')
INSERT INTO Zorluklar(Zorluk) VALUES('Zor')
GO
CREATE TABLE Turler
(
	ID int IDENTITY(1,1),
	Tur nvarchar(50)
	CONSTRAINT pk_turler PRIMARY KEY(ID)
)
GO
INSERT INTO Turler(Tur) VALUES('1-99')
INSERT INTO Turler(Tur) VALUES('1-120')
INSERT INTO Turler(Tur) VALUES('55-120')
GO
CREATE TABLE Uyeler
(
	ID int IDENTITY(1524,1),
	Ad nvarchar(100),
	Soyad nvarchar(100),
	KullaniciAdi nvarchar(100),
	Mail nvarchar(150),
	Sifre nvarchar(100),
	ProfilFotografi nvarchar(150),
	Onayli bit,
	Donmus bit,
	Silinmis bit,
	CONSTRAINT pk_uyeler PRIMARY KEY(ID)
)
GO
CREATE TABLE Konular
(
	ID int IDENTITY(1,1),
	TurID int,
	ZorlukID int,
	UyeID int,
	Baslik nvarchar(150),
	Icerik nvarchar(max),
	ServerAdi nvarchar(150),
	Website nvarchar(150),
	AcilisTarihi Datetime,
	ServerDurumu bit,
	VipKonu bit,
	EklenmeTarihi Datetime,
	GuncellenmeTarihi Datetime,
	GoruntulemeSayisi int,
	BegeniSayisi int,
	YorumSayisi int,
	Onayli bit,
	CONSTRAINT pk_konular PRIMARY KEY(ID),
	CONSTRAINT fk_konular_turler FOREIGN KEY(TurID) REFERENCES Turler(ID),
	CONSTRAINT fk_konular_zorluklar FOREIGN KEY(ZorlukID) REFERENCES Zorluklar(ID),
	CONSTRAINT fk_konular_uyeler FOREIGN KEY(UyeID) REFERENCES Uyeler(ID)
)
GO
CREATE TABLE Yoneticiler
(
	ID int IDENTITY(1,1), 
	GorevID int,
	ProfilFotografi nvarchar(100),
	Ad nvarchar(100),
	Soyad nvarchar(100),
	KullaniciAdi nvarchar(100),
	Mail nvarchar(150),
	Sifre nvarchar(100),
	Durum bit,
	Silinmis bit,
	CONSTRAINT pk_yoneticiler PRIMARY KEY(ID),
	CONSTRAINT fk_yoneticiler_gorevler FOREIGN KEY(GorevID) REFERENCES Gorevler(ID),
)
GO
INSERT INTO Yoneticiler(GorevID, Ad, Soyad, KullaniciAdi, Mail, Sifre, Durum, Silinmis) VALUES (1, 'Doða', 'Hava', 'dogahava', 'dogahava@gmail.com', '1234', 1, 0)
GO
CREATE TABLE Yorumlar
(
	ID int IDENTITY(1,1),
	UyeID int,
	Icerik nvarchar(1000),
	EklemeTarihi datetime,
	BegeniSayisi int,
	Onayli bit,
	CONSTRAINT pk_yorumlar PRIMARY KEY(ID),
	CONSTRAINT fk_yorumlar_uyeler FOREIGN KEY(UyeID) REFERENCES Uyeler(ID),
)
GO
CREATE TABLE Yanitlar
(
	ID int IDENTITY(1,1),
	YorumID int,
	UyeID int,
	Icerik nvarchar(1000),
	EklemeTarihi datetime,
	BegeniSayisi int,
	Onayli bit,
	CONSTRAINT pk_yanitlar PRIMARY KEY(ID),
	CONSTRAINT fk_yanitlar_yorumlar FOREIGN KEY(YorumID) REFERENCES Yorumlar(ID),
	CONSTRAINT fk_yanitlar_uyeler FOREIGN KEY(UyeID) REFERENCES Uyeler(ID),
)
GO
CREATE TABLE Kategoriler
(
	ID int IDENTITY(1,1),
	Isim nvarchar(150),
	Aciklama nvarchar(1000),
	Durum bit,
	Silinmis bit,
	CONSTRAINT pk_kategoriler PRIMARY KEY(ID),
)