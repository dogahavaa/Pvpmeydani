using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani
{
    public partial class KonuOlustur : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddl_tur.DataSource = vm.TurListele();
                ddl_tur.DataBind();

                ddl_zorluk.DataSource = vm.ZorlukListele();
                ddl_zorluk.DataBind();
            }
        }

        protected void lbtn_konuOlustur_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_konuBaslik.Text))
            {
                if (!string.IsNullOrEmpty(tb_serverAdi.Text))
                {
                    if (!string.IsNullOrEmpty(tb_webSite.Text))
                    {
                        if (!string.IsNullOrEmpty(tb_icerik.Text))
                        {
                            Konu k = new Konu();
                            k.Baslik = tb_konuBaslik.Text;
                            k.ServerAdi = tb_serverAdi.Text;
                            k.TurID = Convert.ToInt32(ddl_tur.SelectedItem.Value);
                            k.ZorlukID = Convert.ToInt32(ddl_zorluk.SelectedItem.Value);
                            k.Website = tb_webSite.Text;
                            k.AcilisTarihi = cl_acilisTarihi.SelectedDate;
                            k.ServerDurumu = cb_serverDurumu.Checked;
                            k.Icerik = tb_icerik.Text;
                            vm.KonuOlustur(k);
                        }
                    }
                }
            }
        }
    }
}