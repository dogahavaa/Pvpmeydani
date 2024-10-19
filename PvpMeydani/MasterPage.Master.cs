using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {
            Uye u = (Uye)Session["uye"];
            if (u != null)
            {
                pnl_uye.Visible = true;
                pnl_misafir.Visible = false;
                hl_profileGit.Text = u.KullaniciAdi;
            }
        }

        protected void lbtn_guvenliCikis_Click(object sender, EventArgs e)
        {
            Session["uye"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}