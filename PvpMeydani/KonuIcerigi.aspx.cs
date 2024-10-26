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
        Uye u;
        protected void Page_Load(object sender, EventArgs e)
        {
            u = (Uye)Session["uye"];
            int konuID = Convert.ToInt32(Request.QueryString["konuID"]);
            Konu konu = vm.KonuGetir(konuID);
            vm.GoruntulemeArttir(konuID, konu.UyeID);
            if (Request.QueryString.Count != 0)
            {
                Uye uye = vm.UyeGetir(konu.UyeID);
                lbl_uka.Text = uye.KullaniciAdi;
                lbl_katilimTarihi.Text = uye.UyelikTarihi.ToShortDateString();
                lbl_reaksiyon.Text = uye.ReaksiyonSkoru.ToString();
                lbl_mesajSayisi.Text = uye.MesajSayisi.ToString();
                img_uyeresim.ImageUrl = "Resimler/UyeResimleri/" + uye.ProfilFotografi;
                lbl_konuBegeniSayisi.Text = konu.BegeniSayisi.ToString();
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

                /* *********YORUMLAR******** */
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
            u = (Uye)Session["uye"];
            int konuID = Convert.ToInt32(Request.QueryString["konuID"]);
            Konu konu = vm.KonuGetir(konuID);

            if (u != null)
            {
                pnl_misafir.Visible = false;
                Yorum y = new Yorum();
                y.UyeID = u.ID;
                y.KonuID = konuID;
                y.Icerik = tb_yorumYaz.Text;
                y.GonderimTarihi = DateTime.Now;
                y.BegeniSayisi = 0;
                y.Onayli = true;
                vm.YorumYap(y);
                tb_yorumYaz.Text = "";
                vm.YorumSayisiArttir(konuID, konu.UyeID); //Konu'nun yorum sayısı + Konu sahibinin reaksiyon skorunu arttır.
                vm.MesajSayisiArttir(u.ID); //Giriş yapan üyenin mesaj sayısını ve reaksiyon skorunu arttır.
                Response.Redirect(Request.RawUrl); //Sayfayı yenile
            }
            else
            {
                pnl_misafir.Visible = true;
            }
        }

        protected void rptr_yorumlar_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void lbtn_yBegen_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int yorumID = Convert.ToInt32(btn.CommandArgument);
            u = (Uye)Session["uye"];
            int konuID = Convert.ToInt32(Request.QueryString["konuID"]);

            if (u != null)
            {
                Yorum y = vm.YorumGetir(yorumID);
                vm.YorumBegeniArttir(yorumID, konuID, u.ID, y.UyeID);
                Response.Redirect(Request.RawUrl);
            }

        }

        protected void lbtn_begen_Click(object sender, EventArgs e)
        {
            int konuID = Convert.ToInt32(Request.QueryString["konuID"]);
            Konu k = vm.KonuGetir(konuID);
            if (u != null)
            {
                vm.KonuBegeniArttir(konuID, u.ID, k.UyeID);
                Response.Redirect(Request.RawUrl);
            }
            
        }
    }
}