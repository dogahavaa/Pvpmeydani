using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani
{
    public partial class AdminPaneliMaster : System.Web.UI.MasterPage
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {
            Yonetici y = (Yonetici)Session["Yonetici"];
            if (y != null)
            {
                lbl_kullaniciAdi.Text = y.KullaniciAdi;
                lbl_yetki.Text = y.Gorev;
            }
            else
            {
                Response.Redirect("AdminGiris.aspx");
            }
        }
    }
}