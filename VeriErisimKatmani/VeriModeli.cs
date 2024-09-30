using System;
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
                cmd.CommandText = "INSERT INTO Gorevler(Gorev) VALUES(@yetki)";
                cmd.Parameters.Clear();
                cmd.Parameters.AddWithValue("@yetki", yetki);
                con.Open();
                cmd.ExecuteNonQuery();
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
                // Silme işlemi
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


    }
}
