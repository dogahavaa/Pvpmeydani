using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani
{
    public partial class UyeGirisi : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtn_giris_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_kullaniciAdi.Text))
            {
                if (!string.IsNullOrEmpty(tb_sifre.Text))
                {
                    Uye uye = vm.UyeGiris(tb_kullaniciAdi.Text, tb_sifre.Text);
                    if (uye != null)
                    {
                        Session["uye"] = uye;
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        pnl_basarisizBilgi.Visible = true;
                        lbl_basarisizMesaj.Visible = true;
                        lbl_basarisizMesaj.Text = "Kullanıcı bulunamadı.";
                    }
                }
                else
                {
                    pnl_basarisizBilgi.Visible = true;
                    lbl_basarisizMesaj.Visible = true;
                    lbl_basarisizMesaj.Text = "Şifre giriniz.";
                }
            }
            else
            {
                pnl_basarisizBilgi.Visible = true;
                lbl_basarisizMesaj.Visible = true;
                lbl_basarisizMesaj.Text = "Kullanıcı adı giriniz.";
            }
        }
    }

}