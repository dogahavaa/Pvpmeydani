using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class AdminPaneliDefault : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        Yonetici y;
        protected void Page_Load(object sender, EventArgs e)
        {
            y = (Yonetici)Session["Yonetici"];

            lbl_konuSayisi.Text = vm.KonuSayisi().ToString();
            lbl_uyeSayisi.Text = vm.UyeSayisi().ToString();
            lbl_yorumSayisi.Text = vm.YorumSayisi().ToString();

            lv_onayBekleyenKonular.DataSource = vm.KonuListele(false, true);
            lv_onayBekleyenKonular.DataBind();

            lv_onayBekleyenUyeler.DataSource = vm.UyeListele(false);
            lv_onayBekleyenUyeler.DataBind();
        }

        protected void lv_onayBekleyenKonular_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "onayla")
            {
                if (vm.YetkiSorgula(38, y.GorevID))
                {
                    vm.KonuOnayla(id);
                    lbl_konuOnayMsg.Visible = false;

                    lv_onayBekleyenKonular.DataSource = vm.KonuListele(false, true);
                    lv_onayBekleyenKonular.DataBind();

                }
                else
                {
                    lbl_konuOnayMsg.Text = "Konu onaylama yetkiniz yoktur.";
                    lbl_konuOnayMsg.Visible = true;
                }
            }
            if (e.CommandName == "sil")
            {
                if (vm.YetkiSorgula(39, y.GorevID))
                {
                    vm.KonuReddet(id);
                    lbl_konuOnayMsg.Visible = false;
                    lv_onayBekleyenKonular.DataSource = vm.KonuListele(false, true);
                    lv_onayBekleyenKonular.DataBind();
                }
                else
                {
                    lbl_konuOnayMsg.Text = "Konu onayı reddetme yetkiniz yoktur.";
                    lbl_konuOnayMsg.Visible = true;
                }
            }
        }

        protected void lv_onayBekleyenUyeler_ItemCommand(object sender, ListViewCommandEventArgs e)
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

            lv_onayBekleyenUyeler.DataSource = vm.UyeListele(false);
            lv_onayBekleyenUyeler.DataBind();
        }
    }
}