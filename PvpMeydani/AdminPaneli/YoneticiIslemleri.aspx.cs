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
    public partial class YoneticiIslemleri : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        Yonetici y;
        protected void Page_Load(object sender, EventArgs e)
        {
            y = (Yonetici)Session["Yonetici"];
            if (y != null)
            {
                if (vm.YetkiSorgula(34, y.GorevID))
                {
                    pnl_yetkili.Visible = true;
                    pnl_yetkisiz.Visible = false;
                }
                else
                {
                    pnl_yetkisiz.Visible = true;
                    pnl_yetkili.Visible = false;
                }
            }
            else
            {
                Response.Redirect("AdminGiris.aspx");
            }

            
            if (!IsPostBack)
            {
                lv_yoneticiEkibi.DataSource = vm.YoneticiListele();
                lv_yoneticiEkibi.DataBind();
                ddl_yetki.DataSource = vm.YetkiListele();
                ddl_yetki.DataBind();
            }
        }

        protected void lv_yoneticiEkibi_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "yDurumDegistir")
            {
                vm.YoneticiDurumDegistir(id);
            }
            if (e.CommandName == "ySil")
            {
                vm.YoneticiSil(id);
            }
            if (e.CommandName == "ySilineniGeriAl")
            {
                vm.YoneticiSilineniGeriAl(id);
            }
            if (e.CommandName == "yDuzenle")
            {
                Yonetici y = vm.YoneticiGetir(id);
                tb_ad.Text = y.Ad;
                tb_soyad.Text = y.Soyad;
                tb_kullaniciAdi.Text = y.KullaniciAdi;
                tb_mail.Text = y.Mail;
                tb_sifre.Text = y.Sifre;
                ddl_yetki.SelectedValue = y.GorevID.ToString();
                if (!IsPostBack)
                {
                    vm.YoneticiDuzenle(y);
                }
            }
            ddlFiltre();
        }

        protected void lbtn_ekle_Click(object sender, EventArgs e)
        {
            if (!(vm.ZatenVarKontrol(tb_kullaniciAdi.Text, tb_mail.Text, "Yoneticiler")))
            {
                if (!string.IsNullOrEmpty(tb_kullaniciAdi.Text))
                {
                    if (!string.IsNullOrEmpty(tb_ad.Text))
                    {
                        if (!string.IsNullOrEmpty(tb_soyad.Text))
                        {
                            if (!string.IsNullOrEmpty(tb_kullaniciAdi.Text))
                            {
                                if (!string.IsNullOrEmpty(tb_mail.Text))
                                {
                                    if (!string.IsNullOrEmpty(tb_sifre.Text))
                                    {
                                        pnl_basarisiz.Visible = false;
                                        Yonetici y = new Yonetici();
                                        y.Ad = tb_ad.Text;
                                        y.Soyad = tb_soyad.Text;
                                        y.KullaniciAdi = tb_kullaniciAdi.Text;
                                        y.Mail = tb_mail.Text;
                                        y.Sifre = tb_sifre.Text;
                                        y.GorevID = Convert.ToInt32(ddl_yetki.SelectedItem.Value);

                                        if (fu_profilResmi.HasFile)
                                        {
                                            string isim = Guid.NewGuid().ToString();
                                            string yol = fu_profilResmi.FileName;
                                            FileInfo fi = new FileInfo(yol);
                                            string uzanti = fi.Extension;
                                            string tamisim = isim + uzanti;
                                            fu_profilResmi.SaveAs(Server.MapPath("../Resimler/YoneticiResimleri/" + tamisim));
                                            y.ProfilFotografi = tamisim;
                                        }
                                        else
                                        {
                                            y.ProfilFotografi = "none.png";
                                        }
                                        vm.YoneticiEkle(y);
                                        lv_yoneticiEkibi.DataSource = vm.YoneticiListele();
                                        lv_yoneticiEkibi.DataBind();
                                    }
                                    else
                                    {
                                        pnl_basarisiz.Visible = true;
                                        lbl_bilgi.Text = "Lütfen bir şifre giriniz.";
                                    }
                                }
                                else
                                {
                                    pnl_basarisiz.Visible = true;
                                    lbl_bilgi.Text = "Lütfen bir mail adresi giriniz.";
                                }
                            }
                            else
                            {
                                pnl_basarisiz.Visible = true;
                                lbl_bilgi.Text = "Lütfen bir kullanıcı adı giriniz.";
                            }
                        }
                        else
                        {
                            pnl_basarisiz.Visible = true;
                            lbl_bilgi.Text = "Lütfen soyadınızı giriniz.";
                        }
                    }
                    else
                    {
                        pnl_basarisiz.Visible = true;
                        lbl_bilgi.Text = "Lütfen adınızı giriniz.";
                    }
                }
                else
                {
                    pnl_basarisiz.Visible = true;
                    lbl_bilgi.Text = "Lütfen bir kullanıcı adı giriniz.";
                }
            }
            else
            {
                pnl_basarisiz.Visible = true;
                lbl_bilgi.Text = "Böyle bir yönetici zaten var.";
            }
        }

        protected void ddl_filtre_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlFiltre();
        }
        private void ddlFiltre()
        {
            lv_yoneticiEkibi.Items.Clear();
            if (ddl_filtre.SelectedItem.Text == "Hepsi")
            {

                lv_yoneticiEkibi.DataSource = vm.YoneticiListele();
                lv_yoneticiEkibi.DataBind();

            }
            else if (ddl_filtre.SelectedItem.Text == "Aktif")
            {
                lv_yoneticiEkibi.DataSource = vm.YoneticiListele(true);
                lv_yoneticiEkibi.DataBind();
            }
            else if (ddl_filtre.SelectedItem.Text == "Pasif")
            {
                lv_yoneticiEkibi.DataSource = vm.YoneticiListele(false);
                lv_yoneticiEkibi.DataBind();
            }
            else if (ddl_filtre.SelectedItem.Text == "Silinmiş")
            {
                lv_yoneticiEkibi.DataSource = vm.YoneticiListele(false, true);
                lv_yoneticiEkibi.DataBind();
            }
        }
    }
}