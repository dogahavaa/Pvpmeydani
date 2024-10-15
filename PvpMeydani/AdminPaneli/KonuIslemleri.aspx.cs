using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class KonuIslemleri : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        Yonetici y;
        protected void Page_Load(object sender, EventArgs e)
        {
            y = (Yonetici)Session["Yonetici"];

            if (vm.YetkiSorgula(30, y.GorevID))
            {
                pnl_yetkili.Visible = true;
                pnl_yetkisiz.Visible = false;
            }
            else
            {
                pnl_yetkili.Visible = false;
                pnl_yetkisiz.Visible = true;
            }

            lv_onayBekleyen.DataSource = vm.KonuListele(false);
            lv_onayBekleyen.DataBind();

            lv_konular.DataSource = vm.KonuListele(true);
            lv_konular.DataBind();
        }

        protected void lv_onayBekleyen_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "onayla")
            {
                if (vm.YetkiSorgula(38, y.GorevID))
                {
                    vm.KonuOnayla(id);
                    lv_onayBekleyen.DataSource = vm.KonuListele(false);
                    lv_onayBekleyen.DataBind();

                    lv_konular.DataSource = vm.KonuListele(true);
                    lv_konular.DataBind();
                }
            }
            
        }

        protected void lv_konular_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }
    }
}