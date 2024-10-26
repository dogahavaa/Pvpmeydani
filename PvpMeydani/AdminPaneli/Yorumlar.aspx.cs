using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class Yorumlar : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        Yonetici y;
        protected void Page_Load(object sender, EventArgs e)
        {
            y = (Yonetici)Session["Yonetici"];

            if (vm.YetkiSorgula(31, y.GorevID))
            {
                pnl_yetkili.Visible = true;
                pnl_yetkisiz.Visible = false;
            }
            else
            {
                pnl_yetkili.Visible = false;
                pnl_yetkisiz.Visible = true;
            }

            lv_yeniYorumlar.DataSource = vm.YeniYorumlariListele();
            lv_yeniYorumlar.DataBind();

            lv_tumYorumlar.DataSource = vm.YorumListele();
            lv_tumYorumlar.DataBind();


        }

        protected void lv_yeniYorumlar_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "sil")
            {
                if (vm.YetkiSorgula(41, y.GorevID))
                {
                    vm.YorumSil(id);
                    lbl_konuOnayMsg.Visible = false;
                    lv_yeniYorumlar.DataSource = vm.YeniYorumlariListele();
                    lv_yeniYorumlar.DataBind();
                }
                else
                {
                    lbl_konuOnayMsg.Text = "Yorum silme yetkiniz yoktur.";
                    lbl_konuOnayMsg.Visible = true;
                }
            }
        }

        protected void lv_tumYorumlar_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "sil")
            {
                if (vm.YetkiSorgula(41, y.GorevID))
                {
                    vm.YorumSil(id);
                    lbl_konuOnayMsg.Visible = false;
                    lv_tumYorumlar.DataSource = vm.YorumListele();
                    lv_tumYorumlar.DataBind();
                }
                else
                {
                    lbl_konuOnayMsg.Text = "Yorum silme yetkiniz yoktur.";
                    lbl_konuOnayMsg.Visible = true;
                }
            }
        }
    }
}