using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class Etiketler : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        Yonetici y;
        protected void Page_Load(object sender, EventArgs e)
        {
            y = (Yonetici)Session["Yonetici"];
            if (vm.YetkiSorgula(33, y.GorevID))
            {
                pnl_yetkili.Visible = true;
                pnl_yetkisiz.Visible = false;
            }
            else
            {
                pnl_yetkili.Visible = false;
                pnl_yetkisiz.Visible = true;
            }

            lv_zorluk.DataSource = vm.ZorlukListele();
            lv_zorluk.DataBind();

            lv_turler.DataSource = vm.TurListele();
            lv_turler.DataBind();
        }

        protected void lv_zorluk_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName=="sil")
            {
                if (vm.YetkiSorgula(45, y.GorevID))
                {
                    vm.ZorlukSil(id);
                    lbl_zorlukMesaj.Visible = false;
                }
                else
                {
                    lbl_zorlukMesaj.Visible = true;
                    lbl_zorlukMesaj.Text = "Zorluk seviyesi silme yetkiniz yoktur.";
                }
                
                lv_zorluk.DataSource = vm.ZorlukListele();
                lv_zorluk.DataBind();
            }
        }

        protected void lv_turler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "sil")
            {
                if (vm.YetkiSorgula(43, y.GorevID))
                {
                    vm.TurSil(id);
                    lbl_turMesaj.Visible = false;
                }
                else
                {
                    lbl_turMesaj.Visible = true;
                    lbl_turMesaj.Text = "Tür bilgisi silme yetkiniz yoktur.";
                }
                
                lv_turler.DataSource = vm.TurListele();
                lv_turler.DataBind();
            }
        }

        protected void lbtn_turEkle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_turBilgisi.Text))
            {
                if (vm.YetkiSorgula(42, y.GorevID))
                {
                    vm.TurEkle(tb_turBilgisi.Text);
                    lbl_turEkleMesaj.Visible = false;
                }
                else
                {
                    lbl_turEkleMesaj.Visible = true;
                    lbl_turEkleMesaj.Text = "Yeni bir tür ekleme yetkiniz yoktur.";
                }
                tb_turBilgisi.Text = "";
                lv_turler.DataSource = vm.TurListele();
                lv_turler.DataBind();
            }
        }

        protected void lbtn_zorlukEkle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_zorlukEkle.Text))
            {
                if (vm.YetkiSorgula(44, y.GorevID))
                {
                    vm.ZorlukEkle(tb_zorlukEkle.Text);
                    lbl_zorlukEkleMesaj.Visible = false;
                }
                else
                {
                    lbl_zorlukEkleMesaj.Visible = true;
                    lbl_zorlukEkleMesaj.Text = "Yeni bir zorluk ekleme yetkiniz yoktur.";
                }
                tb_zorlukEkle.Text = "";
                lv_zorluk.DataSource = vm.ZorlukListele();
                lv_zorluk.DataBind();
            }
        }
    }
}