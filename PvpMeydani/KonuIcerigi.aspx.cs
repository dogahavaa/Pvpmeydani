using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani
{
    public partial class KonuIcerigi : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {
            int konuID = Convert.ToInt32(Request.QueryString["konuID"]);
            if (Request.QueryString.Count != 0)
            {
                Konu konu = vm.KonuGetir(konuID);
                Uye uye = vm.UyeGetir(konu.UyeID);
                lbl_uka.Text = uye.KullaniciAdi;
                lbl_katilimTarihi.Text = uye.UyelikTarihi.ToShortDateString();
                lbl_reaksiyon.Text = uye.ReaksiyonSkoru.ToString();
                lbl_mesajSayisi.Text = uye.MesajSayisi.ToString();
                img_uyeresim.ImageUrl = "Resimler/UyeResimleri/" + uye.ProfilFotografi;

                lbl_konuBasligi.Text = konu.Baslik;
                lbl_mesajTarihi.Text = "Konu Tarihi : " + konu.EklenmeTarihi.ToShortDateString();
                lbl_guncellemeTarihi.Text = " | Güncellenme Tarihi : " + konu.GuncellenmeTarihi.ToShortDateString();
                lbl_icerik.Text = konu.Icerik;
                lbl_serverAdii.Text = konu.ServerAdi;
                lbl_website.Text = konu.Website;
                lbl_tur.Text = konu.TurAdi;
                lbl_zorluk.Text = konu.Zorluk;
                lbl_acilisTarihi.Text = konu.AcilisTarihi.ToShortDateString();
                string svDurumu;
                if (konu.ServerDurumu)
                {
                    svDurumu = "Açık";
                }
                else
                {
                    svDurumu = "Kapalı";
                }
                lbl_svDurumu.Text = svDurumu;

                rptr_yorumlar.DataSource = vm.YorumListele(konuID);
                rptr_yorumlar.DataBind();
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            
        }

        protected void lbtn_gonder_Click(object sender, EventArgs e)
        {
            Uye u = (Uye)Session["uye"];
            int konuID = Convert.ToInt32(Request.QueryString["konuID"]);
            if (u != null)
            {
                pnl_misafir.Visible = false;
                Yorum y = new Yorum();
                y.UyeID = u.ID;
                y.KonuID = konuID;
                y.Icerik = tb_yorumYaz.Text;
                y.EklemeTarihi = DateTime.Now;
                y.BegeniSayisi = 0;
                y.Onayli = true;
                vm.YorumYap(y);
                tb_yorumYaz.Text = "";
                Response.Redirect(Request.RawUrl);
            }
            else
            {
                pnl_misafir.Visible = true;
            }
        }
    }
}