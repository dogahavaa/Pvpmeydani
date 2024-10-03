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
        protected void Page_Load(object sender, EventArgs e)
        {
            Yonetici y = (Yonetici)Session["Yonetici"];
            if (y != null)
            {
                if (y.Gorev == "Admin")
                {
                    yetkili.Visible = true;
                    yetkisiz.Visible = false;
                }
            }

            lv_gorevler.DataSource = vm.YetkiListele();
            lv_gorevler.DataBind();

            lv_yoneticiEkibi.DataSource = vm.YoneticiListele();
            lv_yoneticiEkibi.DataBind();

            if (!IsPostBack)
            {
                ddl_yetki.DataSource = vm.YetkiListele();
                ddl_yetki.DataBind();
            }
        }

        protected void lv_yoneticiEkibi_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "yDurumDegistir")
            {
                ddlFiltre();
                vm.YoneticiDurumDegistir(id);
                ddlFiltre();
            }
            if (e.CommandName == "ySil")
            {
                ddlFiltre();
                vm.YoneticiSil(id);
                ddlFiltre();
            }
            if (e.CommandName == "ySilineniGeriAl")
            {
                ddlFiltre();
                vm.YoneticiSilineniGeriAl(id);
                ddlFiltre();
            }
            if (e.CommandName == "yDuzenle")
            {
                ddlFiltre();
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
                ddlFiltre();
            }
        }

        protected void lbtn_yetkiEkle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(tb_yetkiAdi.Text))
            {
                vm.YetkiOlustur(tb_yetkiAdi.Text);
                ddl_yetki.DataSource = vm.YetkiListele();
                ddl_yetki.DataBind();
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
                    ddl_yetki.DataSource = vm.YetkiListele();
                    ddl_yetki.DataBind();
                    lv_gorevler.DataSource = vm.YetkiListele();
                    lv_gorevler.DataBind();
                    ddlFiltre();
                }
                else
                {
                    lbl_silinemez.Visible = true;
                    lbl_silinemez.Text = "Bu yetki silinemez !";
                }
            }
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