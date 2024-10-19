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