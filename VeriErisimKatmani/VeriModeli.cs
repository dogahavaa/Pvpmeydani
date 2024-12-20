﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace VeriErisimKatmani
{
    public class VeriModeli
    {
        SqlConnection con;
        SqlCommand cmd;

        public VeriModeli()
        {
            con = new SqlConnection(BaglantiYollari.baglantiYolu);
            cmd = con.CreateCommand();
        }

        public Yonetici YoneticiGiris(string mail, string sifre)
        {
            try
            {
                cmd.CommandText = "SELECT COUNT(*) FROM Yoneticiler WHERE Mail=@mail AND Sifre=@sifre";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@mail", mail);
                cmd.Parameters.AddWithValue("@sifre", sifre);
                con.Open();
                int sayi = Convert.ToInt32(cmd.ExecuteScalar());
                if (sayi == 1)
                {
                    cmd.CommandText = "SELECT Y.ID, Y.GorevID, G.Gorev, Y.ProfilFotografi, Y.Ad, Y.Soyad, Y.KullaniciAdi, Y.Mail, Y.Sifre, Y.Durum, Y.Silinmis FROM Yoneticiler AS Y JOIN Gorevler AS G ON G.ID = Y.GorevID WHERE Mail=@mail AND Sifre=@sifre";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@mail", mail);
                    cmd.Parameters.AddWithValue("@sifre", sifre);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Yonetici yonetici = new Yonetici();
                    while (reader.Read())
                    {
                        yonetici.ID = reader.GetInt32(0);
                        yonetici.GorevID = reader.GetInt32(1);
                        yonetici.Gorev = reader.GetString(2);
                        if (string.IsNullOrEmpty(reader.GetString(3)))
                        {
                            yonetici.ProfilFotografi = "none.png";
                        }
                        else
                        {
                            yonetici.ProfilFotografi = reader.GetString(3);
                        }
                        yonetici.Ad = reader.GetString(4);
                        yonetici.Soyad = reader.GetString(5);
                        yonetici.KullaniciAdi = reader.GetString(6);
                        yonetici.Mail = reader.GetString(7);
                        yonetici.Sifre = reader.GetString(8);
                        yonetici.Durum = reader.GetBoolean(9);
                        yonetici.Silinmis = reader.GetBoolean(10);
                    }
                    return yonetici;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public bool ZatenVarKontrol(string kullaniciAdi, string mail, string tabloAdi)
        {
            try
            {
                int mailSayi = 0;
                int kullaniciAdiSayi = 0;

                cmd.CommandText = "SELECT COUNT(*) FROM " + @tabloAdi + " WHERE KullaniciAdi=@kAdi";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@tabloAdi", tabloAdi);
                cmd.Parameters.AddWithValue("@kAdi", kullaniciAdi);
                con.Open();
                kullaniciAdiSayi = Convert.ToInt32(cmd.ExecuteScalar());

                cmd.CommandText = "SELECT COUNT(*) FROM " + @tabloAdi + " WHERE Mail=@mail";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@tabloAdi", tabloAdi);
                cmd.Parameters.AddWithValue("@mail", mail);
                mailSayi = Convert.ToInt32(cmd.ExecuteScalar());

                if (kullaniciAdiSayi > 0 || mailSayi > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return true;
            }
            finally
            {
                con.Close();
            }
        }
        

        #region Etiket İşlemleri

        public List<Zorluk> ZorlukListele()
        {
            List<Zorluk> zorluklar = new List<Zorluk>();
            try
            {
                cmd.CommandText = "SELECT ID, Zorluk FROM Zorluklar";
                cmd.Parameters.Clear();
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Zorluk zorluk = new Zorluk();
                    zorluk.ID = reader.GetInt32(0);
                    zorluk.ZorlukSeviyesi = reader.GetString(1);
                    zorluklar.Add(zorluk);
                }
                return zorluklar;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Tur> TurListele()
        {
            List<Tur> turler = new List<Tur>();
            try
            {
                cmd.CommandText = "SELECT ID, Tur FROM Turler";
                cmd.Parameters.Clear();
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Tur tur = new Tur();
                    tur.ID = reader.GetInt32(0);
                    tur.TurBilgisi = reader.GetString(1);
                    turler.Add(tur);
                }
                return turler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public void TurEkle(string tur)
        {
            try
            {
                cmd.CommandText = "INSERT INTO Turler(Tur) VALUES(@tur)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@tur", tur);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void TurSil(int id)
        {
            try
            {
                cmd.CommandText = "DELETE FROM Turler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void ZorlukEkle(string zorluk)
        {
            try
            {
                cmd.CommandText = "INSERT INTO Zorluklar(Zorluk) VALUES(@zorluk)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@zorluk", zorluk);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void ZorlukSil(int id)
        {
            try
            {
                cmd.CommandText = "DELETE FROM Zorluklar WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Yönetici İşlemleri

        public void YoneticiEkle(Yonetici y)
        {
            try
            {
                cmd.CommandText = "INSERT INTO Yoneticiler(GorevID, ProfilFotografi, Ad, Soyad, KullaniciAdi, Mail, Sifre, Durum, Silinmis) VALUES(@gorevid, @profilFoto, @ad, @soyad, @kullaniciAdi, @mail, @sifre, @durum, @silinmis)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@gorevid", y.GorevID);
                cmd.Parameters.AddWithValue("@profilFoto", y.ProfilFotografi);
                cmd.Parameters.AddWithValue("@ad", y.Ad);
                cmd.Parameters.AddWithValue("@soyad", y.Soyad);
                cmd.Parameters.AddWithValue("@kullaniciAdi", y.KullaniciAdi);
                cmd.Parameters.AddWithValue("@mail", y.Mail);
                cmd.Parameters.AddWithValue("@sifre", y.Sifre);
                cmd.Parameters.AddWithValue("@durum", y.Durum);
                cmd.Parameters.AddWithValue("@silinmis", y.Silinmis);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public List<Yonetici> YoneticiListele()
        {
            List<Yonetici> yoneticiler = new List<Yonetici>();
            try
            {
                cmd.CommandText = "SELECT Y.ID, Y.ProfilFotografi , G.Gorev, Y.KullaniciAdi, Y.Durum, Y.Silinmis FROM Yoneticiler AS Y JOIN Gorevler AS G ON G.ID = Y.GorevID";
                cmd.Parameters.Clear();
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Yonetici y = new Yonetici();
                    y.ID = reader.GetInt32(0);
                    y.ProfilFotografi = reader.GetString(1);
                    y.Gorev = reader.GetString(2);
                    y.KullaniciAdi = reader.GetString(3);
                    y.Durum = reader.GetBoolean(4);
                    y.Silinmis = reader.GetBoolean(5);
                    yoneticiler.Add(y);
                }
                return yoneticiler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Yonetici> YoneticiListele(bool durum)
        {
            List<Yonetici> yoneticiler = new List<Yonetici>();
            try
            {
                cmd.CommandText = "SELECT Y.ID, Y.ProfilFotografi , G.Gorev, Y.KullaniciAdi, Y.Durum, Y.Silinmis FROM Yoneticiler AS Y JOIN Gorevler AS G ON G.ID = Y.GorevID WHERE Durum=@durum";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@durum", durum);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Yonetici y = new Yonetici();
                    y.ID = reader.GetInt32(0);
                    y.ProfilFotografi = reader.GetString(1);
                    y.Gorev = reader.GetString(2);
                    y.KullaniciAdi = reader.GetString(3);
                    y.Durum = reader.GetBoolean(4);
                    y.Silinmis = reader.GetBoolean(5);
                    yoneticiler.Add(y);
                }
                return yoneticiler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Yonetici> YoneticiListele(bool durum, bool silinmis)
        {
            List<Yonetici> yoneticiler = new List<Yonetici>();
            try
            {
                cmd.CommandText = "SELECT Y.ID, Y.ProfilFotografi , G.Gorev, Y.KullaniciAdi, Y.Durum, Y.Silinmis FROM Yoneticiler AS Y JOIN Gorevler AS G ON G.ID = Y.GorevID WHERE Durum=@durum AND Silinmis=@silinmis";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@durum", durum);
                cmd.Parameters.AddWithValue("@silinmis", silinmis);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Yonetici y = new Yonetici();
                    y.ID = reader.GetInt32(0);
                    y.ProfilFotografi = reader.GetString(1);
                    y.Gorev = reader.GetString(2);
                    y.KullaniciAdi = reader.GetString(3);
                    y.Durum = reader.GetBoolean(4);
                    y.Silinmis = reader.GetBoolean(5);
                    yoneticiler.Add(y);
                }
                return yoneticiler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public void YoneticiDurumDegistir(int id)
        {
            try
            {
                bool durum;
                cmd.CommandText = "SELECT Durum FROM Yoneticiler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                durum = Convert.ToBoolean(cmd.ExecuteScalar());
                cmd.CommandText = "UPDATE Yoneticiler SET Durum=@durum WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@durum", !durum);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void YoneticiSil(int id)
        {
            try
            {
                bool silindiMi = YoneticiSilinmisMi(id);
                if (silindiMi == false)
                {
                    cmd.CommandText = "UPDATE Yoneticiler SET Silinmis=@silinmis WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@silinmis", !silindiMi);
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    cmd.CommandText = "UPDATE Yoneticiler SET Durum=@durum WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@durum", false);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    cmd.CommandText = "DELETE FROM Yoneticiler WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            finally
            {
                con.Close();
            }
        }

        public void YoneticiSilineniGeriAl(int id)
        {
            try
            {
                cmd.CommandText = "UPDATE Yoneticiler SET Silinmis='False' WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public bool YoneticiSilinmisMi(int id)
        {
            try
            {
                cmd.CommandText = "SELECT Silinmis FROM Yoneticiler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                bool silinmis = Convert.ToBoolean(cmd.ExecuteScalar());
                if (silinmis == false)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            catch
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        public Yonetici YoneticiGetir(int id)
        {
            try
            {
                cmd.CommandText = "SELECT ID, Ad, Soyad, KullaniciAdi, Mail, Sifre, GorevID, ProfilFotografi FROM Yoneticiler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                Yonetici y = new Yonetici();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    y.ID = reader.GetInt32(0);
                    y.Ad = reader.GetString(1);
                    y.Soyad = reader.GetString(2);
                    y.KullaniciAdi = reader.GetString(3);
                    y.Mail = reader.GetString(4);
                    y.Sifre = reader.GetString(5);
                    y.GorevID = reader.GetInt32(6);
                    y.ProfilFotografi = reader.GetString(7);
                }
                return y;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public void YoneticiDuzenle(Yonetici y)
        {
            try
            {
                cmd.CommandText = "UPDATE Yoneticiler SET Ad=@ad, Soyad=@soyad, KullaniciAdi=@kAdi, Mail=@mail, Sifre=@sifre, GorevID=@gorevid, ProfilFotografi=@profilFotografi, Durum=@durum, Silinmis=@silinmis WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ad", y.Ad);
                cmd.Parameters.AddWithValue("@soyad", y.Soyad);
                cmd.Parameters.AddWithValue("@kAdi", y.KullaniciAdi);
                cmd.Parameters.AddWithValue("@mail", y.Mail);
                cmd.Parameters.AddWithValue("@sifre", y.Sifre);
                cmd.Parameters.AddWithValue("@gorevid", y.GorevID);
                cmd.Parameters.AddWithValue("@profilFotografi", y.ProfilFotografi);
                cmd.Parameters.AddWithValue("@durum", y.Durum);
                cmd.Parameters.AddWithValue("@silinmis", y.Silinmis);
                cmd.Parameters.AddWithValue("@id", y.ID);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void YetkiOlustur(string yetki)
        {
            try
            {
                //Yeni görev oluştur
                cmd.CommandText = "INSERT INTO Gorevler(Gorev) VALUES(@yetki)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@yetki", yetki);
                con.Open();
                cmd.ExecuteNonQuery();
                //Oluşturulan görevin ID'sini al
                cmd.CommandText = "SELECT ID FROM Gorevler WHERE Gorev=@gorev";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@gorev", yetki);
                int gorevID = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();//IslemListele() içerisinde bir bağlantı aç daha olduğu için önce kapat

                List<Islem> islemler = IslemListele();
                con.Open();//islemleri aldıktan sonra bağlantıyı tekrar aç.
                
                for(int i=0; i < islemler.Count(); i++)//Tüm işlemleri yeni eklenen göreve ekleyerek ara tablo oluştur.
                {
                    cmd.CommandText = "INSERT INTO YetkilendirmeGorevAra(GorevID, YetkilendirmeID, Onay) VALUES(@gorevID, @yetkilendirmeID, @onay)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@gorevID", gorevID);
                    cmd.Parameters.AddWithValue("@yetkilendirmeID", islemler[i].ID);
                    cmd.Parameters.AddWithValue("@onay", false);
                    cmd.ExecuteNonQuery();
                }
            }
            finally
            {
                con.Close();
            }
        }

        public List<Gorev> YetkiListele()
        {
            List<Gorev> gorevListele = new List<Gorev>();
            try
            {
                cmd.CommandText = "SELECT ID, Gorev FROM Gorevler";
                cmd.Parameters.Clear();
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Gorev gorev = new Gorev();
                    gorev.ID = reader.GetInt32(0);
                    gorev.GorevAdi = reader.GetString(1);
                    gorevListele.Add(gorev);
                }
                return gorevListele;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public bool YetkiSil(int gorevID)
        {
            try
            {
                // Önce id'si gelen yetkiye sahip yönetici var mı kontrol ediyoruz.
                cmd.CommandText = "SELECT COUNT(*) FROM Yoneticiler WHERE GorevID = @gorevID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@gorevID", gorevID);
                con.Open();
                int gorevliSayisi = Convert.ToInt32(cmd.ExecuteScalar());
                if (gorevliSayisi > 0)
                {
                    // Eğer id'si gelen yetkiye sahip yönetici var ise yetkilerini boşa alıyoruz.
                    cmd.CommandText = "UPDATE Yoneticiler SET GorevID = @bosaAl WHERE GorevID=@gorevID";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@bosaAl", 4);
                    cmd.Parameters.AddWithValue("@gorevID", gorevID);
                    cmd.ExecuteNonQuery();
                }
                //*-*-*-*- Ara tablodan silme işlemi -*-*-*-*//
                cmd.CommandText = "DELETE FROM YetkilendirmeGorevAra WHERE GorevID=@araGorevID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@araGorevID", gorevID);
                cmd.ExecuteNonQuery();


                // *-*-*-*- Asıl silme işlemi -*-*-*-*//
                cmd.CommandText = "DELETE FROM Gorevler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", gorevID);
                cmd.ExecuteNonQuery();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Üye İşlemleri

        public bool UyeKayit(Uye uye)
        {
            try
            {
                cmd.CommandText = "INSERT INTO Uyeler (Ad, Soyad, KullaniciAdi, Mail, Sifre, ProfilFotografi, Onayli, Donmus, Silinmis, UyelikTarihi, MesajSayisi, KonuSayisi, ReaksiyonSkoru) VALUES (@ad, @soyad, @kullaniciadi, @mail, @sifre, @profilfotografi, @onayli, @donmus, @silinmis, @uyeliktarihi, @mesajsayisi, @konusayisi, @reaksiyonskoru)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ad", uye.Ad);
                cmd.Parameters.AddWithValue("@soyad", uye.Soyad);
                cmd.Parameters.AddWithValue("@kullaniciadi", uye.KullaniciAdi);
                cmd.Parameters.AddWithValue("@mail", uye.Mail);
                cmd.Parameters.AddWithValue("@sifre", uye.Sifre);
                cmd.Parameters.AddWithValue("@profilfotografi", uye.ProfilFotografi);
                cmd.Parameters.AddWithValue("@onayli", uye.Onayli);
                cmd.Parameters.AddWithValue("@donmus", uye.Donmus);
                cmd.Parameters.AddWithValue("@silinmis", uye.Silinmis);
                cmd.Parameters.AddWithValue("@uyeliktarihi", uye.UyelikTarihi);
                cmd.Parameters.AddWithValue("@mesajsayisi", 0);
                cmd.Parameters.AddWithValue("@konusayisi", 0);
                cmd.Parameters.AddWithValue("@reaksiyonskoru", 0);
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch 
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        public Uye UyeGiris(string kullaniciadi, string sifre)
        {
            try
            {
                int kullaniciAdiSayi = 0;
                cmd.CommandText = "SELECT COUNT(*) FROM Uyeler WHERE KullaniciAdi=@kAdi";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@kAdi", kullaniciadi);
                con.Open();
                kullaniciAdiSayi = Convert.ToInt32(cmd.ExecuteScalar());
                if (kullaniciAdiSayi == 1)
                {
                    cmd.CommandText = "SELECT ID, Ad, Soyad, KullaniciAdi, Mail, Sifre, ProfilFotografi, Onayli, Donmus, Silinmis, MesajSayisi, KonuSayisi, ReaksiyonSkoru, UyelikTarihi FROM Uyeler WHERE KullaniciAdi=@kullaniciadi AND Sifre=@sifre";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@kullaniciadi", kullaniciadi);
                    cmd.Parameters.AddWithValue("@sifre", sifre);
                    SqlDataReader reader = cmd.ExecuteReader();
                    Uye uye = new Uye();
                    while (reader.Read())
                    {
                        uye.ID = reader.GetInt32(0);
                        uye.Ad = reader.GetString(1);
                        uye.Soyad = reader.GetString(2);
                        uye.KullaniciAdi = reader.GetString(3);
                        uye.Mail = reader.GetString(4);
                        uye.Sifre = reader.GetString(5);
                        if (string.IsNullOrEmpty(reader.GetString(6)))
                        {
                            uye.ProfilFotografi = "none.png";
                        }
                        else
                        {
                            uye.ProfilFotografi = reader.GetString(6);
                        }
                        uye.Onayli = reader.GetBoolean(7);
                        uye.Donmus = reader.GetBoolean(8);
                        uye.Silinmis = reader.GetBoolean(9);
                        uye.MesajSayisi = reader.GetInt32(10);
                        uye.KonuSayisi = reader.GetInt32(11);
                        uye.ReaksiyonSkoru = reader.GetInt32(12);
                        uye.UyelikTarihi = reader.GetDateTime(13);
                    }
                    return uye;
                }
                else
                {
                    return null;
                }
            }
            finally
            {
                con.Close();
            }
        }

        public List<Uye> UyeListele()
        {
            List<Uye> uyeler = new List<Uye>();
            try
            {
                cmd.CommandText = "SELECT ID, Ad, Soyad, KullaniciAdi, Mail, ProfilFotografi, Onayli, Donmus, MesajSayisi, KonuSayisi, ReaksiyonSkoru FROM Uyeler WHERE Silinmis=@silinmis";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@silinmis", false);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Uye uye = new Uye();
                    uye.ID = reader.GetInt32(0);
                    uye.Ad = reader.GetString(1);
                    uye.Soyad = reader.GetString(2);
                    uye.KullaniciAdi = reader.GetString(3);
                    uye.Mail = reader.GetString(4);
                    uye.ProfilFotografi = reader.GetString(5);
                    uye.Onayli = reader.GetBoolean(6);
                    uye.Donmus = reader.GetBoolean(7);
                    uye.MesajSayisi = reader.GetInt32(8);
                    uye.KonuSayisi = reader.GetInt32(9);
                    uye.ReaksiyonSkoru = reader.GetInt32(10);
                    uyeler.Add(uye);
                }
                return uyeler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Uye> UyeListele(bool onayli)
        {
            List<Uye> uyeler = new List<Uye>();
            try
            {
                cmd.CommandText = "SELECT ID, Ad, Soyad, KullaniciAdi, Mail, ProfilFotografi, Onayli, Donmus, MesajSayisi, KonuSayisi, ReaksiyonSkoru FROM Uyeler WHERE Silinmis=@silinmis AND Onayli=@onayli";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@silinmis", false);
                cmd.Parameters.AddWithValue("@onayli", onayli);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Uye uye = new Uye();
                    uye.ID = reader.GetInt32(0);
                    uye.Ad = reader.GetString(1);
                    uye.Soyad = reader.GetString(2);
                    uye.KullaniciAdi = reader.GetString(3);
                    uye.Mail = reader.GetString(4);
                    uye.ProfilFotografi = reader.GetString(5);
                    uye.Onayli = reader.GetBoolean(6);
                    uye.Donmus = reader.GetBoolean(7);
                    uye.MesajSayisi = reader.GetInt32(8);
                    uye.KonuSayisi = reader.GetInt32(9);
                    uye.ReaksiyonSkoru = reader.GetInt32(10);
                    uyeler.Add(uye);
                }
                return uyeler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public void UyeOnayla(int id)
        {
            try
            {
                cmd.CommandText = "UPDATE Uyeler SET Onayli=@onay WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@onay", true);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void UyeReddet(int id)
        {
            try
            {
                cmd.CommandText = "DELETE FROM Uyeler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            { con.Close(); }
        }

        public void UyeSil(int id)
        {
            try
            {
                cmd.CommandText = "SELECT Silinmis FROM Uyeler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                bool silinmis = Convert.ToBoolean(cmd.ExecuteScalar());

                if (silinmis == false)
                {
                    cmd.CommandText = "UPDATE Uyeler SET Silinmis=@silinmis WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@silinmis", true);
                    cmd.Parameters.AddWithValue("@id", id);
                    cmd.ExecuteNonQuery();
                }
                else
                {
                    cmd.CommandText = "DELETE FROM Uyeler WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@id", id);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            finally
            {
                con.Close();
            }
        }

        public void UyeSilineniGeriAl(int id)
        {
            try
            {
                cmd.CommandText = "UPDATE Uyeler SET Silinmis='True' WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public Uye UyeGetir(int id)
        {
            try
            {
                cmd.CommandText = "SELECT * FROM Uyeler WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                Uye u = new Uye();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    u.ID = reader.GetInt32(0);
                    u.Ad = reader.GetString(1);
                    u.Soyad = reader.GetString(2);
                    u.KullaniciAdi = reader.GetString(3);
                    u.Mail = reader.GetString(4);
                    u.Sifre = reader.GetString(5);
                    u.ProfilFotografi = reader.GetString(6);
                    u.Onayli = reader.GetBoolean(7);
                    u.Donmus = reader.GetBoolean(8);
                    u.Silinmis = reader.GetBoolean(9);
                    u.MesajSayisi = reader.GetInt32(10);
                    u.KonuSayisi = reader.GetInt32(11);
                    u.ReaksiyonSkoru = reader.GetInt32(12);
                    u.UyelikTarihi = reader.GetDateTime(13);
                }
                return u;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public int UyeSayisi()
        {
            try
            {
                cmd.CommandText = "SELECT COUNT(*) FROM Uyeler WHERE Onayli=@onayli AND Silinmis=@silinmis";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", true);
                cmd.Parameters.AddWithValue("@silinmis", false);
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());

            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Yetkilendirme İşlemleri

        public void IslemOlustur(Islem i) // Güzel metot kanks
        {
            try
            {
                //Yetkilendirme işlemi oluştur.
                cmd.CommandText = "INSERT INTO Yetkilendirme(Islem) VALUES(@islem)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@islem", i.IslemAciklamasi);
                con.Open();
                cmd.ExecuteNonQuery();

                //Yeni eklenen yetkilendirme işleminin id'sini al.
                cmd.CommandText = "SELECT ID FROM Yetkilendirme WHERE Islem=@islemA";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@islemA", i.IslemAciklamasi);
                int islemID = Convert.ToInt32(cmd.ExecuteScalar());

                con.Close(); //pozisyonları listeleyebilmek için bağlantı kapat
                List<Gorev> pozisyonList = YetkiListele();
                con.Open();

                // Daha önceden oluşturulmuş her bir pozisyona yeni oluşturulan yetkilendirme işlemini ara tabloda doldur.
                foreach (Gorev pozisyon in pozisyonList)
                {
                    cmd.CommandText = "INSERT INTO YetkilendirmeGorevAra(GorevID, YetkilendirmeID, Onay) VALUES (@gID, @yID, @o)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@gID", pozisyon.ID);
                    cmd.Parameters.AddWithValue("@yID", islemID);
                    cmd.Parameters.AddWithValue("@o", false);
                    cmd.ExecuteNonQuery();
                }
            }
            finally
            {
                con.Close();
            }
        }

        public List<Islem> IslemListele()
        {
            try
            {
                List<Islem> islemler = new List<Islem>();
                cmd.CommandText = "SELECT ID, Islem FROM Yetkilendirme";
                cmd.Parameters.Clear();
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Islem i = new Islem();
                    i.ID = reader.GetInt32(0);
                    i.IslemAciklamasi = reader.GetString(1);
                    islemler.Add(i);
                }
                return islemler;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public void IslemSil(int id)
        {
            try
            {
                // Önce ara tabloda ilgili yetkilendirmeID'ye sahip gorevID'leri sil
                cmd.CommandText = "DELETE FROM YetkilendirmeGorevAra WHERE YetkilendirmeID=@yID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@yID", id);
                con.Open();
                cmd.ExecuteNonQuery();

                // Daha sonra yetkilendirme tablosundan işlemi sil
                cmd.CommandText = "DELETE FROM Yetkilendirme WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        } 

        public List<YetkilendirmeGorevAra> YGAraTabloListele(int gorevID)
        {
            try
            {
                List<YetkilendirmeGorevAra> araTabloSatirlari = new List<YetkilendirmeGorevAra>();

                cmd.CommandText = "SELECT YG.GorevID, G.Gorev, YG.YetkilendirmeID, Y.Islem, YG.Onay FROM YetkilendirmeGorevAra AS YG JOIN Gorevler AS G ON YG.GorevID = G.ID JOIN Yetkilendirme AS Y ON YG.YetkilendirmeID = Y.ID WHERE GorevID=@gID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@gID", gorevID);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    YetkilendirmeGorevAra yga = new YetkilendirmeGorevAra();
                    yga.GorevID = reader.GetInt32(0);
                    yga.GorevAdi = reader.GetString(1);
                    yga.YetkilendirmeID = reader.GetInt32(2);
                    yga.YetkilendirmeIslemi = reader.GetString(3);
                    yga.Onay = reader.GetBoolean(4);
                    araTabloSatirlari.Add(yga);
                }
                return araTabloSatirlari;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }

        }

        public void YetkilendirmeDurumuDegistir(int yID, int gID)
        {
            try
            {
                cmd.CommandText = "SELECT Onay FROM YetkilendirmeGorevAra WHERE YetkilendirmeID=@yID AND GorevID=@gID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("yID", yID);
                cmd.Parameters.AddWithValue("gID", gID);
                con.Open();
                bool onay = Convert.ToBoolean(cmd.ExecuteScalar());
                cmd.CommandText = "UPDATE YetkilendirmeGorevAra SET Onay=@onay WHERE YetkilendirmeID=@yID AND GorevID=@gID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onay", !onay);
                cmd.Parameters.AddWithValue("yID", yID);
                cmd.Parameters.AddWithValue("gID", gID);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public bool YetkiSorgula(int yID, int gID)
        {
            try
            {
                cmd.CommandText = "SELECT Onay FROM YetkilendirmeGorevAra WHERE GorevID=@gID AND YetkilendirmeID=@yID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@gID", gID);
                cmd.Parameters.AddWithValue("@yID", yID);
                con.Open();
                return Convert.ToBoolean(cmd.ExecuteScalar());
            }
            catch
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Konu İşlemleri

        public bool KonuOlustur(Konu k, int uyeID)
        {
            try
            {
                Uye uye = UyeGetir(uyeID);
                cmd.CommandText = "INSERT INTO Konular(TurID, ZorlukID, UyeID, Baslik, Icerik, ServerAdi, Website, AcilisTarihi, ServerDurumu, VipKonu, EklenmeTarihi, GuncellenmeTarihi, GoruntulemeSayisi, BegeniSayisi, YorumSayisi, Onayli, SonYorumTarihi, SonYorumKAdi) VALUES(@turID, @zorlukID, @uyeID, @baslik, @icerik, @serverAdi, @website, @acilisTarihi, @serverDurumu, @vipKonu, @eklenmeTarihi, @guncellenmeTarihi, @goruntulemeSayisi, @begeniSayisi, @yorumSayisi, @onayli, @sonYorumTarihi, @sonYorumKAdi)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@turID", k.TurID);
                cmd.Parameters.AddWithValue("@zorlukID", k.ZorlukID);
                cmd.Parameters.AddWithValue("@uyeID", uyeID);
                cmd.Parameters.AddWithValue("@baslik", k.Baslik);
                cmd.Parameters.AddWithValue("@icerik", k.Icerik);
                cmd.Parameters.AddWithValue("@serverAdi", k.ServerAdi);
                cmd.Parameters.AddWithValue("@website", k.Website);
                cmd.Parameters.AddWithValue("@acilisTarihi", k.AcilisTarihi);
                cmd.Parameters.AddWithValue("@serverDurumu", k.ServerDurumu);
                cmd.Parameters.AddWithValue("@vipKonu", false);
                cmd.Parameters.AddWithValue("@eklenmeTarihi", DateTime.Now);
                cmd.Parameters.AddWithValue("@guncellenmeTarihi", DateTime.Now);
                cmd.Parameters.AddWithValue("@goruntulemeSayisi", 0);
                cmd.Parameters.AddWithValue("@begeniSayisi", 0);
                cmd.Parameters.AddWithValue("@yorumSayisi", 0);
                cmd.Parameters.AddWithValue("@onayli", false);
                cmd.Parameters.AddWithValue("@sonYorumTarihi", DateTime.Now);
                cmd.Parameters.AddWithValue("@sonYorumKAdi", uye.KullaniciAdi);
                con.Open();
                cmd.ExecuteNonQuery();
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Konu> KonuListele()
        {
            try
            {
                cmd.CommandText = "SELECT K.ID, K.UyeID, U.KullaniciAdi, K.TurID, T.Tur, K.ZorlukID, Z.Zorluk, K.Baslik, K.Icerik, K.ServerAdi, K.Website, K.AcilisTarihi, K.ServerDurumu, K.VipKonu, K.EklenmeTarihi, K.GuncellenmeTarihi, K.GoruntulemeSayisi, K.BegeniSayisi, K.YorumSayisi, K.Onayli, K.SonYorumTarihi, K.SonYorumKAdi FROM Konular AS K JOIN Uyeler AS U ON U.ID = K.UyeID JOIN Zorluklar AS Z ON Z.ID = K.ZorlukID JOIN Turler AS T ON T.ID = K.TurID";
                cmd.Parameters.Clear();
                con.Open();
                List<Konu> konular = new List<Konu>();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Konu k = new Konu();
                    k.ID = reader.GetInt32(0);
                    k.UyeID = reader.GetInt32(1);
                    k.UyeKullaniciAdi = reader.GetString(2);
                    k.TurID = reader.GetInt32(3);
                    k.TurAdi = reader.GetString(4);
                    k.ZorlukID = reader.GetInt32(5);
                    k.Zorluk = reader.GetString(6);
                    k.Baslik = reader.GetString(7);
                    k.Icerik = reader.GetString(8);
                    k.ServerAdi = reader.GetString(9);
                    k.Website = reader.GetString(10);
                    k.AcilisTarihi = reader.GetDateTime(11);
                    k.ServerDurumu = reader.GetBoolean(12);
                    k.VipKonu = reader.GetBoolean(13);
                    k.EklenmeTarihi = reader.GetDateTime(14);
                    k.GuncellenmeTarihi = reader.GetDateTime(15);
                    k.GoruntulemeSayisi = reader.GetInt32(16);
                    k.BegeniSayisi = reader.GetInt32(17);
                    k.YorumSayisi = reader.GetInt32(18);
                    k.Onayli = reader.GetBoolean(19);
                    k.SonYorumTarihi = reader.GetDateTime(20);
                    k.SonYorumKAdi = reader.GetString(21);
                    konular.Add(k);
                }
                return konular;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Konu> KonuListele(bool onayli, bool durum)
        {
            try
            {
                cmd.CommandText = "SELECT K.ID, K.UyeID, U.KullaniciAdi, K.TurID, T.Tur, K.ZorlukID, Z.Zorluk, K.Baslik, K.Icerik, K.ServerAdi, K.Website, K.AcilisTarihi, K.ServerDurumu, K.VipKonu, K.EklenmeTarihi, K.GuncellenmeTarihi, K.GoruntulemeSayisi, K.BegeniSayisi, K.YorumSayisi, K.Onayli, K.SonYorumTarihi, K.SonYorumKAdi FROM Konular AS K JOIN Uyeler AS U ON U.ID = K.UyeID JOIN Zorluklar AS Z ON Z.ID = K.ZorlukID JOIN Turler AS T ON T.ID = K.TurID WHERE K.Onayli=@onayli AND K.Durum=@durum";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", onayli);
                cmd.Parameters.AddWithValue("@durum", durum);
                con.Open();
                List<Konu> konular = new List<Konu>();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Konu k = new Konu();
                    k.ID = reader.GetInt32(0);
                    k.UyeID = reader.GetInt32(1);
                    k.UyeKullaniciAdi = reader.GetString(2);
                    k.TurID = reader.GetInt32(3);
                    k.TurAdi = reader.GetString(4);
                    k.ZorlukID = reader.GetInt32(5);
                    k.Zorluk = reader.GetString(6);
                    k.Baslik = reader.GetString(7);
                    k.Icerik = reader.GetString(8);
                    k.ServerAdi = reader.GetString(9);
                    k.Website = reader.GetString(10);
                    k.AcilisTarihi = reader.GetDateTime(11);
                    k.ServerDurumu = reader.GetBoolean(12);
                    k.VipKonu = reader.GetBoolean(13);
                    k.EklenmeTarihi = reader.GetDateTime(14);
                    k.GuncellenmeTarihi = reader.GetDateTime(15);
                    k.GoruntulemeSayisi = reader.GetInt32(16);
                    k.BegeniSayisi = reader.GetInt32(17);
                    k.YorumSayisi = reader.GetInt32(18);
                    k.Onayli = reader.GetBoolean(19);
                    k.SonYorumTarihi = reader.GetDateTime(20);
                    k.SonYorumKAdi = reader.GetString(21);
                    konular.Add(k);
                }
                return konular;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public List<Konu> KonuListele(bool onayli, bool vip, bool durum)
        {
            try
            {
                cmd.CommandText = "SELECT K.ID, K.UyeID, U.KullaniciAdi, K.TurID, T.Tur, K.ZorlukID, Z.Zorluk, K.Baslik, K.Icerik, K.ServerAdi, K.Website, K.AcilisTarihi, K.ServerDurumu, K.VipKonu, K.EklenmeTarihi, K.GuncellenmeTarihi, K.GoruntulemeSayisi, K.BegeniSayisi, K.YorumSayisi, K.Onayli, K.SonYorumTarihi, K.SonYorumKAdi FROM Konular AS K JOIN Uyeler AS U ON U.ID = K.UyeID JOIN Zorluklar AS Z ON Z.ID = K.ZorlukID JOIN Turler AS T ON T.ID = K.TurID WHERE K.Onayli=@onayli AND K.VipKonu=@vip AND K.Durum=@durum";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", onayli);
                cmd.Parameters.AddWithValue("@vip", vip);
                cmd.Parameters.AddWithValue("@durum", durum);
                con.Open();
                List<Konu> konular = new List<Konu>();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Konu k = new Konu();
                    k.ID = reader.GetInt32(0);
                    k.UyeID = reader.GetInt32(1);
                    k.UyeKullaniciAdi = reader.GetString(2);
                    k.TurID = reader.GetInt32(3);
                    k.TurAdi = reader.GetString(4);
                    k.ZorlukID = reader.GetInt32(5);
                    k.Zorluk = reader.GetString(6);
                    k.Baslik = reader.GetString(7);
                    k.Icerik = reader.GetString(8);
                    k.ServerAdi = reader.GetString(9);
                    k.Website = reader.GetString(10);
                    k.AcilisTarihi = reader.GetDateTime(11);
                    k.ServerDurumu = reader.GetBoolean(12);
                    k.VipKonu = reader.GetBoolean(13);
                    k.EklenmeTarihi = reader.GetDateTime(14);
                    k.GuncellenmeTarihi = reader.GetDateTime(15);
                    k.GoruntulemeSayisi = reader.GetInt32(16);
                    k.BegeniSayisi = reader.GetInt32(17);
                    k.YorumSayisi = reader.GetInt32(18);
                    k.Onayli = reader.GetBoolean(19);
                    k.SonYorumTarihi = reader.GetDateTime(20);
                    k.SonYorumKAdi = reader.GetString(21);
                    konular.Add(k);
                }
                return konular;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public void KonuOnayla(int id)
        {
            try
            {
                cmd.CommandText = "UPDATE Konular SET Onayli=@onayli WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", true);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void KonuReddet(int id)
        {
            try
            {
                cmd.CommandText = "DELETE FROM Konular WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public Konu KonuGetir(int id)
        {
            try
            {
                cmd.CommandText = "SELECT Z.Zorluk, T.Tur, U.KullaniciAdi, K.Baslik, K.Icerik, K.ServerAdi, K.Website, K.AcilisTarihi, K.VipKonu, K.Onayli, K.TurID, K.ZorlukID, K.UyeID, K.ServerDurumu, K.EklenmeTarihi, K.GuncellenmeTarihi, K.GoruntulemeSayisi, K.BegeniSayisi, K.YorumSayisi, K.SonYorumKAdi, K.SonYorumTarihi, K.ID FROM Konular AS K JOIN Turler AS T ON T.ID = K.TurID  JOIN Zorluklar AS Z ON Z.ID = K.ZorlukID  JOIN Uyeler AS U ON U.ID = K.UyeID WHERE K.ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                Konu k = new Konu();
                while (reader.Read())
                {
                    k.Zorluk = reader.GetString(0);
                    k.TurAdi = reader.GetString(1);
                    k.UyeKullaniciAdi = reader.GetString(2);
                    k.Baslik = reader.GetString(3);
                    k.Icerik = reader.GetString(4);
                    k.ServerAdi = reader.GetString(5);
                    k.Website = reader.GetString(6);
                    k.AcilisTarihi = reader.GetDateTime(7);
                    k.VipKonu = reader.GetBoolean(8);
                    k.Onayli = reader.GetBoolean(9);
                    k.TurID = reader.GetInt32(10);
                    k.ZorlukID = reader.GetInt32(11);
                    k.UyeID = reader.GetInt32(12);
                    k.ServerDurumu = reader.GetBoolean(13);
                    k.EklenmeTarihi = reader.GetDateTime(14);
                    k.GuncellenmeTarihi = reader.GetDateTime(15);
                    k.GoruntulemeSayisi = reader.GetInt32(16);
                    k.BegeniSayisi = reader.GetInt32(17);
                    k.YorumSayisi = reader.GetInt32(18);
                    k.SonYorumKAdi = reader.GetString(19);
                    k.SonYorumTarihi = reader.GetDateTime(20); // Yorum yap metodunda düzenle !!!
                }
                return k;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }
        
        public void KonuSilSoft(int id)
        {
            try
            {
                cmd.CommandText = "UPDATE Konular SET Durum=@durum WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@durum", false);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public void KonuVipCevir(int id)
        {
            try
            {
                cmd.CommandText = "SELECT VipKonu FROM Konular WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                bool vipDurumu = Convert.ToBoolean(cmd.ExecuteScalar());
                cmd.CommandText = "UPDATE Konular SET VipKonu=@vipDurumu WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@vipDurumu", !vipDurumu);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public int KonuSayisi()
        {
            try
            {
                cmd.CommandText = "SELECT COUNT(*) FROM Konular WHERE Onayli=@onayli AND Durum=@durum";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", true);
                cmd.Parameters.AddWithValue("@durum", true);
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());

            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Yorum İşlemleri

        public void YorumYap(Yorum y) // Düzenlenecek
        {
            try
            {
                cmd.CommandText = "INSERT INTO Yorumlar(UyeID, KonuID, Icerik, EklemeTarihi, BegeniSayisi, Onayli) VALUES(@uID, @kID, @icerik, @eklemeTarihi, @begeniSayisi, @onayli)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@uID", y.UyeID);
                cmd.Parameters.AddWithValue("@kID", y.KonuID);
                cmd.Parameters.AddWithValue("@icerik", y.Icerik);
                cmd.Parameters.AddWithValue("@eklemeTarihi", y.GonderimTarihi);
                cmd.Parameters.AddWithValue("@begeniSayisi", y.BegeniSayisi);
                cmd.Parameters.AddWithValue("@onayli", y.Onayli);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public List<Yorum> YorumListele()
        {
            try
            {
                cmd.CommandText = "SELECT Y.ID, Y.UyeID, U.KullaniciAdi, U.UyelikTarihi, U.ReaksiyonSkoru, U.MesajSayisi, Y.Icerik, Y.EklemeTarihi, Y.BegeniSayisi, Y.Onayli, Y.KonuID, K.Baslik FROM Yorumlar AS Y JOIN Uyeler AS U ON U.ID = Y.UyeID JOIN Konular AS K ON K.ID=Y.KonuID WHERE Y.Onayli=@onayli";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", true);
                con.Open();
                List<Yorum> yorumlar = new List<Yorum>();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Yorum y = new Yorum();
                    y.ID = reader.GetInt32(0);
                    y.UyeID = reader.GetInt32(1);
                    y.UyeKullaniciAdi = reader.GetString(2);
                    y.UyelikTarihi = reader.GetDateTime(3);
                    y.UyeReaksiyonSkoru = reader.GetInt32(4);
                    y.UyeMesajSayisi = reader.GetInt32(5);
                    y.Icerik = reader.GetString(6);
                    y.GonderimTarihi = reader.GetDateTime(7);
                    y.BegeniSayisi = reader.GetInt32(8);
                    y.Onayli = reader.GetBoolean(9);
                    y.KonuID = reader.GetInt32(10);
                    y.KonuBasligi = reader.GetString(11);
                    yorumlar.Add(y);
                }
                return yorumlar;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } //Sadece onaylı yorumları listeleme

        public List<Yorum> YorumListele(int konuID)
        {
            try
            {
                cmd.CommandText = "SELECT Y.ID, Y.UyeID, U.KullaniciAdi, U.UyelikTarihi, U.ReaksiyonSkoru, U.MesajSayisi, Y.Icerik, Y.EklemeTarihi, Y.BegeniSayisi, Y.Onayli, Y.KonuID FROM Yorumlar AS Y JOIN Uyeler AS U ON U.ID = Y.UyeID WHERE Y.KonuID = @konuID AND Y.Onayli=@onayli ORDER BY Y.EklemeTarihi DESC";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@konuID", konuID);
                cmd.Parameters.AddWithValue("@onayli", true);
                con.Open();
                List<Yorum> yorumlar = new List<Yorum>();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Yorum y = new Yorum();
                    y.ID = reader.GetInt32(0);
                    y.UyeID = reader.GetInt32(1);
                    y.UyeKullaniciAdi = reader.GetString(2);
                    y.UyelikTarihi = reader.GetDateTime(3);
                    y.UyeReaksiyonSkoru = reader.GetInt32(4);
                    y.UyeMesajSayisi = reader.GetInt32(5); 
                    y.Icerik = reader.GetString(6);
                    y.GonderimTarihi = reader.GetDateTime(7);
                    y.BegeniSayisi = reader.GetInt32(8);
                    y.Onayli = reader.GetBoolean(9);
                    y.KonuID = reader.GetInt32(10);
                    yorumlar.Add(y);
                }
                return yorumlar;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        } //Konu altındaki yorumlar (Konuya göre yorum listeleme)

        public List<Yorum> YeniYorumlariListele()
        {
            try
            {
                cmd.CommandText = "SELECT TOP 3 Y.ID, Y.UyeID, U.KullaniciAdi, U.UyelikTarihi, U.ReaksiyonSkoru, U.MesajSayisi, Y.Icerik, Y.EklemeTarihi, Y.BegeniSayisi, Y.Onayli, Y.KonuID, K.Baslik FROM Yorumlar AS Y JOIN Uyeler AS U ON U.ID = Y.UyeID JOIN Konular AS K ON K.ID=Y.KonuID WHERE Y.Onayli=@onayli ORDER BY Y.EklemeTarihi DESC";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", true);
                con.Open();
                List<Yorum> yorumlar = new List<Yorum>();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Yorum y = new Yorum();
                    y.ID = reader.GetInt32(0);
                    y.UyeID = reader.GetInt32(1);
                    y.UyeKullaniciAdi = reader.GetString(2);
                    y.UyelikTarihi = reader.GetDateTime(3);
                    y.UyeReaksiyonSkoru = reader.GetInt32(4);
                    y.UyeMesajSayisi = reader.GetInt32(5);
                    y.Icerik = reader.GetString(6);
                    y.GonderimTarihi = reader.GetDateTime(7);
                    y.BegeniSayisi = reader.GetInt32(8);
                    y.Onayli = reader.GetBoolean(9);
                    y.KonuID = reader.GetInt32(10);
                    y.KonuBasligi = reader.GetString(11);
                    yorumlar.Add(y);
                }
                return yorumlar;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public Yorum YorumGetir(int yorumID)
        {
            try
            {
                cmd.CommandText = "SELECT Y.ID, Y.UyeID, U.KullaniciAdi, Y.Icerik, Y.EklemeTarihi, Y.BegeniSayisi, Y.Onayli, Y.KonuID, K.Baslik FROM Yorumlar AS Y JOIN Uyeler AS U ON U.ID = Y.UyeID JOIN Konular AS K ON K.ID = Y.KonuID WHERE Y.ID=@yID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@yID", yorumID);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                Yorum y = new Yorum();
                while (reader.Read())
                {
                    y.ID = reader.GetInt32(0);
                    y.UyeID = reader.GetInt32(1);
                    y.UyeKullaniciAdi = reader.GetString(2);
                    y.Icerik = reader.GetString(3);
                    y.GonderimTarihi = reader.GetDateTime(4);
                    y.BegeniSayisi = reader.GetInt32(5);
                    y.Onayli = reader.GetBoolean(6);
                    y.KonuID = reader.GetInt32(7);
                    y.KonuBasligi = reader.GetString(8);
                }
                return y;
            }
            catch
            {
                return null;
            }
            finally
            {
                con.Close();
            }
        }

        public void YorumSil(int id)
        {
            try
            {
                cmd.CommandText = "UPDATE Yorumlar SET Onayli=@onayli WHERE ID=@id";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", false);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }

        public int YorumSayisi()
        {
            try
            {
                cmd.CommandText = "SELECT COUNT(*) FROM Yorumlar WHERE Onayli=@onayli";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@onayli", true);
                con.Open();
                return Convert.ToInt32(cmd.ExecuteScalar());
            }
            catch
            {
                return 0;
            }
            finally
            {
                con.Close();
            }
        }

        #endregion

        #region Beğeni & Reaksiyon Skoru & Mesaj Sayısı İşlemleri

        public void KonuBegeniArttir(int konuID, int uyeID, int konuUyeID)
        {
            try
            {
                cmd.CommandText = "SELECT COUNT(*) FROM KonuBegenileri WHERE konuID=@konuID AND uyeID=@uyeID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@konuID", konuID);
                cmd.Parameters.AddWithValue("@uyeID", uyeID);
                con.Open();
                int deger = Convert.ToInt32(cmd.ExecuteScalar());
                if (deger == 0)
                {
                    cmd.CommandText = "SELECT BegeniSayisi From Konular WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@id", konuID);
                    int begeniSayisi = Convert.ToInt32(cmd.ExecuteScalar());
                    cmd.CommandText = "UPDATE Konular Set BegeniSayisi = @begeniSayisi WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@id", konuID);
                    cmd.Parameters.AddWithValue("@begeniSayisi", (begeniSayisi + 1));
                    cmd.ExecuteNonQuery();
                    cmd.CommandText = "INSERT INTO KonuBegenileri(konuID, uyeID) VALUES(@konuID, @uyeID)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@konuID", konuID);
                    cmd.Parameters.AddWithValue("@uyeID", uyeID);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ReaksiyonSkoruArttir(konuUyeID, 1);
                }
            }
            finally
            {
                
            }
        }

        public void YorumBegeniArttir(int yorumID, int konuID, int uyeID, int yorumUyeID)
        {
            try
            {
                cmd.CommandText = "SELECT COUNT(*) FROM Begeniler WHERE yorumID=@yorumID AND konuID=@konuID AND uyeID=@uyeID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@konuID", konuID);
                cmd.Parameters.AddWithValue("@yorumID", yorumID);
                cmd.Parameters.AddWithValue("@uyeID", uyeID);
                con.Open();
                int deger = Convert.ToInt32(cmd.ExecuteScalar());
                if (deger == 0)
                {
                    cmd.CommandText = "SELECT BegeniSayisi From Yorumlar WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@id", yorumID);
                    int begeniSayisi = Convert.ToInt32(cmd.ExecuteScalar());
                    cmd.CommandText = "UPDATE Yorumlar Set BegeniSayisi = @begeniSayisi WHERE ID=@id";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@id", yorumID);
                    cmd.Parameters.AddWithValue("@begeniSayisi", (begeniSayisi + 1));
                    cmd.ExecuteNonQuery();
                    cmd.CommandText = "INSERT INTO Begeniler(konuID, yorumID, uyeID) VALUES(@konuID, @yorumID, @uyeID)";
                    cmd.Parameters.Clear();
                    cmd.Parameters.AddWithValue("@konuID", konuID);
                    cmd.Parameters.AddWithValue("@yorumID", yorumID);
                    cmd.Parameters.AddWithValue("@uyeID", uyeID);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ReaksiyonSkoruArttir(yorumUyeID, 3);
                }
            }
            finally
            {
                con.Close();
            }
        }

        public void GoruntulemeArttir(int konuID, int uyeID)
        {
            try
            {
                cmd.CommandText = "SELECT GoruntulemeSayisi FROM Konular WHERE ID=@konuID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@konuID", konuID);
                con.Open();
                int gSayi = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.CommandText = "UPDATE Konular Set GoruntulemeSayisi=@gSayi WHERE ID=@konuID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@gSayi", (gSayi + 1));
                cmd.Parameters.AddWithValue("@konuID", konuID);
                cmd.ExecuteNonQuery();
                con.Close();
                ReaksiyonSkoruArttir(uyeID, 1);
            }
            finally
            {
                con.Close();
            }
        }

        public void YorumSayisiArttir(int konuID, int uyeID)
        {
            try
            {
                cmd.CommandText = "SELECT YorumSayisi FROM Konular WHERE ID=@konuID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@konuID", konuID);
                con.Open();
                int ySayi = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.CommandText = "UPDATE Konular SET YorumSayisi=@ySayi WHERE ID=@konuID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@ySayi", (ySayi + 1));
                cmd.Parameters.AddWithValue("@konuID", konuID);
                cmd.ExecuteNonQuery();
                con.Close();
                ReaksiyonSkoruArttir(uyeID, 1);
            }
            finally
            {
                con.Close();
            }
        }

        public void MesajSayisiArttir(int uyeID)
        {
            try
            {
                cmd.CommandText = "SELECT MesajSayisi FROM Uyeler WHERE ID=@uyeID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@uyeID", uyeID);
                con.Open();
                int mSayi = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.CommandText = "UPDATE Uyeler SET MesajSayisi=@mSayi WHERE ID=@uyeID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@mSayi", (mSayi + 1));
                cmd.Parameters.AddWithValue("@uyeID", uyeID);
                cmd.ExecuteNonQuery();
                con.Close();
                ReaksiyonSkoruArttir(uyeID, 3);
            }
            finally
            {
                con.Close();
            }
        }
        
        public void ReaksiyonSkoruArttir(int uyeID, int artis)
        {
            try
            {
                cmd.CommandText = "SELECT ReaksiyonSkoru FROM Uyeler WHERE ID=@uyeID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@uyeID", uyeID);
                con.Open();
                int reaksiyonSkoru = Convert.ToInt32(cmd.ExecuteScalar());
                cmd.CommandText = "UPDATE Uyeler SET ReaksiyonSkoru=@reaksiyonSkoru WHERE ID=@uyeID";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@reaksiyonSkoru", (reaksiyonSkoru + artis));
                cmd.Parameters.AddWithValue("@uyeID", uyeID);
                cmd.ExecuteNonQuery();
            }
            finally
            {
                con.Close();
            }
        }


        #endregion

        
    }
}
