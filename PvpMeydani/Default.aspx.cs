using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani
{
    public partial class Default : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {
            rptr_vipIcerik.DataSource = vm.KonuListele(true, true, true);
            rptr_vipIcerik.DataBind();

            rptr_yeniKonular.DataSource = vm.KonuListele(true, false, true);
            rptr_yeniKonular.DataBind();
        }

        protected void rptr_vipIcerik_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}