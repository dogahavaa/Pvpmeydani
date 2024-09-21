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

        #endregion
    }
}
