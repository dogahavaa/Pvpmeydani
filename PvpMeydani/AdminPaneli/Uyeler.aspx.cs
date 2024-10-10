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
        Yonetici y;
        protected void Page_Load(object sender, EventArgs e)
        {
            y = (Yonetici)Session["Yonetici"];
            lv_uyeler.DataSource = vm.UyeListele(true);
            lv_uyeler.DataBind();

            lv_onayBekleyen.DataSource = vm.UyeListele(false);
            lv_onayBekleyen.DataBind();
        }

        protected void lv_uyeler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (y.Gorev=="Admin")
            {
                if (e.CommandName == "sil")
                {
                    vm.UyeSil(id);
                }
            }
            else
            {
                pnl_silmeBasarisiz.Visible = true;
            }
            
            if (e.CommandName=="geriAl")
            {
                vm.UyeSilineniGeriAl(id);
            }
            lv_uyeler.DataSource = vm.UyeListele(true);
            lv_uyeler.DataBind();
        }

        protected void lv_onayBekleyen_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName=="onayla")
            {
                vm.UyeOnayla(id);
            }
            if (e.CommandName=="sil")
            {
                vm.UyeReddet(id);
            }
            lv_uyeler.DataSource = vm.UyeListele(true);
            lv_uyeler.DataBind();

            lv_onayBekleyen.DataSource = vm.UyeListele(false);
            lv_onayBekleyen.DataBind();
        }
    }
}