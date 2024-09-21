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
        protected void Page_Load(object sender, EventArgs e)
        {
            lv_zorluk.DataSource = vm.ZorlukListele();
            lv_zorluk.DataBind();

            lv_turler.DataSource = vm.TurListele();
            lv_turler.DataBind();
        }

        protected void lv_zorluk_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lv_turler_ItemCommand(object sender, ListViewCommandEventArgs e)
        {

        }

        protected void lbtn_turEkle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_turBilgisi.Text))
            {
                vm.TurEkle(tb_turBilgisi.Text);
                tb_turBilgisi.Text = "";
                lv_turler.DataSource = vm.TurListele();
                lv_turler.DataBind();
            }
        }
    }
}