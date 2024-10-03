using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class Uyeler : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();        
        protected void Page_Load(object sender, EventArgs e)
        {
            lv_uyeler.DataSource = vm.UyeListele(true);
            lv_uyeler.DataBind();

            lv_onayBekleyen.DataSource = vm.UyeListele(false);
            lv_onayBekleyen.DataBind();
        }

        protected void lv_uyeler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lv_onayBekleyen_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }
    }
}