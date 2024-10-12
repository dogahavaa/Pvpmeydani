using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class Yetkilendirme : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        Yonetici y;
        protected void Page_Load(object sender, EventArgs e)
        {
            lv_gorevler.DataSource = vm.YetkiListele();
            lv_gorevler.DataBind();

            lv_islemler.DataSource = vm.IslemListele();
            lv_islemler.DataBind();

            y = (Yonetici)Session["Yonetici"];
            if (vm.YetkiSorgula(35, y.GorevID))
            {
                pnl_yetkili.Visible = true;
                pnl_yetkisiz.Visible = false;
            }
            else
            {
                pnl_yetkili.Visible = false;
                pnl_yetkisiz.Visible = true;
            }

        }

        protected void lbtn_olustur_Click(object sender, EventArgs e)
        {
            
        }

        protected void lbtn_yetkiEkle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_yetkiAdi.Text))
            {
                vm.YetkiOlustur(tb_yetkiAdi.Text);
                lv_gorevler.DataSource = vm.YetkiListele();
                lv_gorevler.DataBind();
                tb_yetkiAdi.Text = "";
            }
        }

        protected void lv_gorevler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "sil")
            {
                if (id != 4 && id != 11)
                {
                    vm.YetkiSil(id);
                    lv_gorevler.DataSource = vm.YetkiListele();
                    lv_gorevler.DataBind();
                    lbl_silinemez.Visible = false;
                }
                else
                {
                    lbl_silinemez.Visible = true;
                    lbl_silinemez.Text = "Bu yetki silinemez !";
                }
            }
        }

        protected void lbtn_islemolustur_Click(object sender, EventArgs e)
        {
            Islem i = new Islem();
            i.IslemAciklamasi = tb_islem.Text;
            vm.IslemOlustur(i);
            lv_islemler.DataSource = vm.IslemListele();
            lv_islemler.DataBind();
            tb_islem.Text = "";
        }

        protected void lv_islemler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "islemSil")
            {
                vm.IslemSil(id);
                lv_islemler.DataSource = vm.IslemListele();
                lv_islemler.DataBind();
            }
        }
    }
}