using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class YetkilendirmeDuzenle : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count != 0)
                {
                    int gorevID = Convert.ToInt32(Request.QueryString["gorevID"]);

                    List<YetkilendirmeGorevAra> ygaList = vm.YGAraTabloListele(gorevID);
                    lbl_baslik.Text = ygaList[0].GorevAdi + " Yetkilerini Düzenle";
                    lv_yetkilendirmeDuzenle.DataSource = ygaList;
                    lv_yetkilendirmeDuzenle.DataBind();
                }
                else
                {
                    Response.Redirect("Yetkilendirme.aspx");
                }
            }
        }

        protected void lv_yetkilendirmeDuzenle_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int yID = Convert.ToInt32(e.CommandArgument);
            int gID = Convert.ToInt32(Request.QueryString["gorevID"]);

            if (e.CommandName == "izinDegistir")
            {
                vm.YetkilendirmeDurumuDegistir(yID, gID);
                lv_yetkilendirmeDuzenle.DataSource = vm.YGAraTabloListele(gID);
                lv_yetkilendirmeDuzenle.DataBind();
            }
        }

       

       
    }
}