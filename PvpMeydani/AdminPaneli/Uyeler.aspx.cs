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

            if (vm.YetkiSorgula(32, y.GorevID))
            {
                pnl_yetkili.Visible = true;
                pnl_yetkisiz.Visible = false;
            }
            else
            {
                pnl_yetkili.Visible = false;
                pnl_yetkisiz.Visible = true;
            }

            lv_uyeler.DataSource = vm.UyeListele(true);
            lv_uyeler.DataBind();

            lv_onayBekleyen.DataSource = vm.UyeListele(false);
            lv_onayBekleyen.DataBind();
        }

        protected void lv_uyeler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "sil")
            {
                if (vm.YetkiSorgula(37, y.GorevID))
                {
                    vm.UyeSil(id);
                    lbl_uyeSilMesaj.Visible = false;
                }
                else
                {
                    lbl_uyeSilMesaj.Visible = true;
                    lbl_uyeSilMesaj.Text = "Üye silme yetkiniz yoktur.";
                }
            }

            if (e.CommandName == "geriAl")
            {
                vm.UyeSilineniGeriAl(id);
            }
            lv_uyeler.DataSource = vm.UyeListele(true);
            lv_uyeler.DataBind();
        }

        protected void lv_onayBekleyen_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "onayla")
            {
                if (vm.YetkiSorgula(36, y.GorevID))
                {
                    vm.UyeOnayla(id);
                    lbl_uyeOnayMesaj.Visible = false;
                }
                else
                {
                    lbl_uyeOnayMesaj.Visible = true;
                    lbl_uyeOnayMesaj.Text = "Üye onaylama ve reddetme yetkiniz yoktur.";
                }
                
            }
            if (e.CommandName == "sil")
            {
                if (vm.YetkiSorgula(36, y.GorevID))
                {
                    vm.UyeReddet(id);
                    lbl_uyeOnayMesaj.Visible = false;
                }
                else
                {
                    lbl_uyeOnayMesaj.Visible = true;
                    lbl_uyeOnayMesaj.Text = "Üye onaylama ve reddetme yetkiniz yoktur.";
                }
            }

            lv_uyeler.DataSource = vm.UyeListele(true);
            lv_uyeler.DataBind();

            lv_onayBekleyen.DataSource = vm.UyeListele(false);
            lv_onayBekleyen.DataBind();
        }
    }
}