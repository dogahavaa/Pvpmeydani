using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using VeriErisimKatmani;

namespace PvpMeydani
{
    public partial class UyeOl : System.Web.UI.Page
    {
        VeriModeli vm = new VeriModeli();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtn_uyeOl_Click(object sender, EventArgs e)
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
                                if (!(tb_ad.Text.Length > 100))
                                {
                                    if (!(tb_soyad.Text.Length > 100))
                                    {
                                        if (!(tb_kullaniciAdi.Text.Length > 100))
                                        {
                                            if (!(tb_mail.Text.Length > 150))
                                            {
                                                if (!(tb_sifre.Text.Length > 100))
                                                {
                                                    if (!(vm.ZatenVarKontrol(tb_kullaniciAdi.Text, tb_mail.Text, "Uyeler")))
                                                    {
                                                        if (!(vm.ZatenVarKontrol(tb_kullaniciAdi.Text, tb_mail.Text, "Yoneticiler")))
                                                        {
                                                            Uye uye = new Uye();
                                                            uye.Ad = tb_ad.Text;
                                                            uye.Soyad = tb_soyad.Text;
                                                            uye.KullaniciAdi = tb_kullaniciAdi.Text;
                                                            uye.Mail = tb_mail.Text;
                                                            uye.Sifre = tb_sifre.Text;
                                                            if (fu_uyeResim.HasFile)
                                                            {
                                                                string isim = Guid.NewGuid().ToString();
                                                                string yol = fu_uyeResim.FileName;
                                                                FileInfo info = new FileInfo(yol);
                                                                string uzanti = info.Extension;
                                                                string tamisim = isim + uzanti;
                                                                fu_uyeResim.SaveAs(Server.MapPath("Resimler/UyeResimleri/" + tamisim));
                                                                uye.ProfilFotografi = tamisim;
                                                            }
                                                            else
                                                            {
                                                                uye.ProfilFotografi = "none.png";
                                                            }
                                                            uye.Onayli = false;
                                                            uye.Donmus = false;
                                                            uye.Silinmis = false;
                                                            uye.MesajSayisi = 0;
                                                            uye.KonuSayisi = 0;
                                                            uye.ReaksiyonSkoru = 0;
                                                            uye.UyelikTarihi = DateTime.Now;
                                                            if (vm.UyeKayit(uye))
                                                            {
                                                                pnl_basarisizBilgi.Visible = false;
                                                                lbl_basarisizMesaj.Visible = false;
                                                                pnl_basariliBilgi.Visible = true;
                                                            }
                                                            else
                                                            {
                                                                pnl_basariliBilgi.Visible = false;
                                                                pnl_basarisizBilgi.Visible = true;
                                                                lbl_basarisizMesaj.Visible = true;
                                                                lbl_basarisizMesaj.Text = "Bir hata ile karşılaşıldı. <br/> Lütfen daha sonra tekrar deneyiniz.";
                                                            }
                                                        }
                                                        else
                                                        {
                                                            pnl_basariliBilgi.Visible = false;
                                                            pnl_basarisizBilgi.Visible = true;
                                                            lbl_basarisizMesaj.Visible = true;
                                                            lbl_basarisizMesaj.Text = "Böyle bir kullanıcı zaten var";
                                                        }
                                                    }
                                                    else
                                                    {
                                                        pnl_basariliBilgi.Visible = false;
                                                        pnl_basarisizBilgi.Visible = true;
                                                        lbl_basarisizMesaj.Visible = true;
                                                        lbl_basarisizMesaj.Text = "Böyle bir kullanıcı zaten var";
                                                    }
                                                }
                                                else
                                                {
                                                    pnl_basariliBilgi.Visible = false;
                                                    pnl_basarisizBilgi.Visible = true;
                                                    lbl_basarisizMesaj.Visible = true;
                                                    lbl_basarisizMesaj.Text = "Şifre 100 karakterden daha uzun olamaz!";
                                                }
                                            }
                                            else
                                            {
                                                pnl_basariliBilgi.Visible = false;
                                                pnl_basarisizBilgi.Visible = true;
                                                lbl_basarisizMesaj.Visible = true;
                                                lbl_basarisizMesaj.Text = "Mail 150 karakterden daha uzun olamaz!";
                                            }
                                        }
                                        else
                                        {
                                            pnl_basariliBilgi.Visible = false;
                                            pnl_basarisizBilgi.Visible = true;
                                            lbl_basarisizMesaj.Visible = true;
                                            lbl_basarisizMesaj.Text = "Kullanıcı adı 100 karakterden daha uzun olamaz!";
                                        }
                                    }
                                    else
                                    {
                                        pnl_basariliBilgi.Visible = false;
                                        pnl_basarisizBilgi.Visible = true;
                                        lbl_basarisizMesaj.Visible = true;
                                        lbl_basarisizMesaj.Text = "Soyisim 100 karakterden daha uzun olamaz!";
                                    }
                                }
                                else
                                {
                                    pnl_basariliBilgi.Visible = false;
                                    pnl_basarisizBilgi.Visible = true;
                                    lbl_basarisizMesaj.Visible = true;
                                    lbl_basarisizMesaj.Text = "İsim 100 karakterden daha uzun olamaz!";
                                }
                            }
                            else
                            {
                                pnl_basariliBilgi.Visible = false;
                                pnl_basarisizBilgi.Visible = true;
                                lbl_basarisizMesaj.Visible = true;
                                lbl_basarisizMesaj.Text = "Lütfen bir şifre belirleyiniz!";
                            }
                        }
                        else
                        {
                            pnl_basariliBilgi.Visible = false;
                            pnl_basarisizBilgi.Visible = true;
                            lbl_basarisizMesaj.Visible = true;
                            lbl_basarisizMesaj.Text = "Lütfen bir mail adresi giriniz!";
                        }
                    }
                    else
                    {
                        pnl_basariliBilgi.Visible = false;
                        pnl_basarisizBilgi.Visible = true;
                        lbl_basarisizMesaj.Visible = true;
                        lbl_basarisizMesaj.Text = "Lütfen bir kullanıcı adı giriniz!";
                    }
                }
                else
                {
                    pnl_basariliBilgi.Visible = false;
                    pnl_basarisizBilgi.Visible = true;
                    lbl_basarisizMesaj.Visible = true;
                    lbl_basarisizMesaj.Text = "Lütfen bir soyisim giriniz!";
                }
            }
            else
            {
                pnl_basariliBilgi.Visible = false;
                pnl_basarisizBilgi.Visible = true;
                lbl_basarisizMesaj.Visible = true;
                lbl_basarisizMesaj.Text = "Lütfen bir isim giriniz!";
            }
        }


    }
}