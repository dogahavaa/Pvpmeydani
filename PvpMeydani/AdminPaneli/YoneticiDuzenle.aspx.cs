using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani.AdminPaneli
{
    public partial class YoneticiDuzenle : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count != 0)
                {
                    ddld_yetki.DataSource = vm.YetkiListele();
                    ddld_yetki.DataBind();
                    int id = Convert.ToInt32(Request.QueryString["yoneticiID"]);
                    Yonetici y = vm.YoneticiGetir(id);
                    tbd_ad.Text = y.Ad;
                    tbd_soyad.Text = y.Soyad;
                    tbd_kAdi.Text = y.KullaniciAdi;
                    tbd_mail.Text = y.Mail;
                    tbd_sifre.Text = y.Sifre;
                    ddld_yetki.SelectedValue = Convert.ToString(y.GorevID);
                    img_foto.ImageUrl = "Images/YoneticiResimleri/" + y.ProfilFotografi;
                }
                else
                {
                    Response.Redirect("YoneticiDuzenle.aspx");
                }
            }
        }

        protected void lbtn_duzenle_Click(object sender, EventArgs e)
        {
            
                if (!string.IsNullOrEmpty(tbd_ad.Text))
                {
                    if (!string.IsNullOrEmpty(tbd_soyad.Text))
                    {
                        if (!string.IsNullOrEmpty(tbd_kAdi.Text))
                        {
                            if (!string.IsNullOrEmpty(tbd_mail.Text))
                            {
                                if (!string.IsNullOrEmpty(tbd_sifre.Text))
                                {
                                    int id = Convert.ToInt32(Request.QueryString["yoneticiID"]);
                                    Yonetici y = vm.YoneticiGetir(id);
                                    pnl_dbasarisiz.Visible = false;
                                    y.Ad = tbd_ad.Text;
                                    y.Soyad = tbd_soyad.Text;
                                    y.KullaniciAdi = tbd_kAdi.Text;
                                    y.Mail = tbd_mail.Text;
                                    y.Sifre = tbd_sifre.Text;
                                    y.GorevID = Convert.ToInt32(ddld_yetki.SelectedItem.Value);

                                    if (fud_pfoto.HasFile)
                                    {
                                        string isim = Guid.NewGuid().ToString();
                                        string yol = fud_pfoto.FileName;
                                        FileInfo fi = new FileInfo(yol);
                                        string uzanti = fi.Extension;
                                        string tamisim = isim + uzanti;
                                        fud_pfoto.SaveAs(Server.MapPath("Images/YoneticiResimleri/" + tamisim));
                                        y.ProfilFotografi = tamisim;
                                    }
                                    vm.YoneticiDuzenle(y);
                                Response.Redirect("YoneticiIslemler.aspx");
                                }
                                else
                                {
                                    pnl_dbasarisiz.Visible = true;
                                    lbl_dbilgi.Text = "Lütfen bir şifre giriniz.";
                                }
                            }
                            else
                            {
                                pnl_dbasarisiz.Visible = true;
                                lbl_dbilgi.Text = "Lütfen bir mail adresi giriniz.";
                            }
                        }
                        else
                        {
                            pnl_dbasarisiz.Visible = true;
                            lbl_dbilgi.Text = "Lütfen bir kullanıcı adı giriniz.";
                        }
                    }
                    else
                    {
                        pnl_dbasarisiz.Visible = true;
                        lbl_dbilgi.Text = "Lütfen soyadınızı giriniz.";
                    }
                }
                else
                {
                    pnl_dbasarisiz.Visible = true;
                    lbl_dbilgi.Text = "Lütfen adınızı giriniz.";
                }
            }
        
    }
}