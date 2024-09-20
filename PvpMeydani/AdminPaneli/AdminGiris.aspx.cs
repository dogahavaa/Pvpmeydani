using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class AdminGiris : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli(); 
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtn_giris_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_mail.Text))
            {
                if (!string.IsNullOrEmpty(tb_sifre.Text))
                {
                    Yonetici yonetici = vm.YoneticiGiris(tb_mail.Text, tb_sifre.Text);
                    if (yonetici != null )
                    {

                        Session["Yonetici"] = yonetici;
                        Response.Redirect("AdminPaneliDefault.aspx");
                    }
                    else
                    {
                        pnl_mesaj.Visible = true;
                        lbl_mesaj.Text = "Kullanıcı Bulunamadı !";
                    }
                }
                else
                {
                    pnl_mesaj.Visible = true;
                    lbl_mesaj.Text = "Şifre Alanı Boş Olamaz!";
                }
            }
            else
            {
                pnl_mesaj.Visible = true;
                lbl_mesaj.Text = "Mail Alanı Boş Olamaz!";
            }
        }
    }
}