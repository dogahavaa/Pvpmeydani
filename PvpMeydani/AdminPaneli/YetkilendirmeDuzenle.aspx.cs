using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class YetkilendirmeDuzenle : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {
            lv_yetkilendirmeDuzenle.DataSource = vm.IslemListele();
            lv_yetkilendirmeDuzenle.DataBind();
        }

        protected void lv_yetkilendirmeDuzenle_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lbtn_onayla_Click(object sender, EventArgs e)
        {

        }
    }
}