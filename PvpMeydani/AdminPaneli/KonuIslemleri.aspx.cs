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

            lv_onayBekleyen.DataSource = vm.KonuListele(false, true);
            lv_onayBekleyen.DataBind();

            lv_konular.DataSource = vm.KonuListele(true, true);
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
                    lbl_konuOnayMsg.Visible = false;

                    lv_onayBekleyen.DataSource = vm.KonuListele(false, true);
                    lv_onayBekleyen.DataBind();
                    lv_konular.DataSource = vm.KonuListele(true, true);
                    lv_konular.DataBind();
                    
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
                    lv_onayBekleyen.DataSource = vm.KonuListele(false, true);
                    lv_onayBekleyen.DataBind();
                }
                else
                {
                    lbl_konuOnayMsg.Text = "Konu onayı reddetme yetkiniz yoktur.";
                    lbl_konuOnayMsg.Visible = true;
                }
            }
            
        }

        protected void lv_konular_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "sil")
            {
                if (vm.YetkiSorgula(39, y.GorevID))
                {
                    vm.KonuSilSoft(id);
                    lbl_konuOnayMsg.Visible = false;
                    lv_konular.DataSource = vm.KonuListele(true, true);
                    lv_konular.DataBind();
                }
                else
                {
                    lbl_konuOnayMsg.Text = "Konu silme yetkiniz yoktur.";
                    lbl_konuOnayMsg.Visible = true;
                }
            }
            if (e.CommandName == "vip")
            {
                if (vm.YetkiSorgula(49, y.GorevID))
                {
                    vm.KonuVipCevir(id);
                    lbl_konuOnayMsg.Visible = false;
                    lv_konular.DataSource = vm.KonuListele(true, true);
                    lv_konular.DataBind();
                }
                else
                {
                    lbl_konuOnayMsg.Text = "Konunun vip durumunu değiştirme yetkiniz yoktur.";
                    lbl_konuOnayMsg.Visible = true;
                }
            }
        }
    }
}