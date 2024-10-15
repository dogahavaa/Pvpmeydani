using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class KonuDetay : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count != 0)
                {
                    Yonetici y = (Yonetici)Session["Yonetici"];
                    if (y != null)
                    {
                        int konuID = Convert.ToInt32(Request.QueryString["gorevID"]);
                        Konu k = vm.KonuGetir(konuID);
                        lbl_serverAdi.Text = k.ServerAdi;
                        lbl_website.Text = k.Website;
                        lbl_tur.Text = k.TurAdi;
                        lbl_zorluk.Text = k.Zorluk;
                        lbl_acilisTarihi.Text = Convert.ToString(k.AcilisTarihi);
                        lbl_vip.Text = k.AcilisTarihi.ToString();
                        lbl_onay.Text = k.Onayli.ToString();
                        lbl_kullanici.Text = k.UyeKullaniciAdi;
                        lbl_baslik.Text = k.Baslik.ToString();
                        lbl_icerik.Text = k.Icerik;
                    }
                }
                else
                {
                    Response.Redirect("KonuIslemleri.aspx");
                }
            }
        }

        protected void lbtn_geriDon_Click(object sender, EventArgs e)
        {
            Response.Redirect("KonuIslemleri.aspx");
        }
    }
}