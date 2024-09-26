<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="YoneticiDuzenle.aspx.cs" Inherits="PvpMeydani.AdminPaneli.YoneticiDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
    <link href="CSS/YoneticiIslemleriCSS.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="yetkisiz" runat="server" Visible="false">
        <div class="anaTasiyici">
            <div class="yetkiMesajKutusu">
                <label class="yetkiMesaji">Bu sayfanın işlemlerini sadece 'Admin' Yetkisindeki kişiler yapabilir.</label>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="yetkili" runat="server" Visible="true">
        <div class="anaTasiyici">
            <div class="kutu kutuYonetici sol">
                <div class="kutuBaslik">
                    Yönetici Düzenle
                </div>
                <div class="kutuIcerik" style="min-height: 682px;">
                    <div class="yoneticiSatir">
                        <label>Ad</label><br />
                        <asp:TextBox ID="tbd_ad" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Soyad<br />
                        <asp:TextBox ID="tbd_soyad" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Kullanıcı Adı<br />
                        <asp:TextBox ID="tbd_kAdi" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Mail<br />
                        <asp:TextBox ID="tbd_mail" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Şifre<br />
                        <asp:TextBox ID="tbd_sifre" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Yetki<br />
                        <asp:DropDownList ID="ddld_yetki" runat="server" CssClass="ddlStyle" DataTextField="GorevAdi" DataValueField="ID"></asp:DropDownList>
                    </div>
                    <div class="yoneticiSatir">
                        <div class="fotoTasiyici">
                            <div class="fotoSol">
                                Profil Fotoğrafı
                                <asp:FileUpload ID="fud_pfoto" runat="server" />
                            </div>
                            <div class="fotoSag">
                                <asp:Image ID="img_foto" runat="server" CssClass="profilFoto" />
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div class="yoneticiSatir" style="margin-top: 30px; text-align: center">
                        <asp:LinkButton ID="lbtn_duzenle" runat="server" CssClass="ekleButon" OnClick="lbtn_duzenle_Click" Text="Düzenle"></asp:LinkButton>
                    </div>
                    <asp:Panel ID="pnl_dbasarisiz" runat="server" CssClass="basarisizPanel" Visible="false">
                        <asp:Label ID="lbl_dbilgi" runat="server" CssClass="bilgi">Başarısız!</asp:Label>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
