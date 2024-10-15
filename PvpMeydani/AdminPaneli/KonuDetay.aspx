<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="KonuDetay.aspx.cs" Inherits="PvpMeydani.AdminPaneli.KonuDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/KonuCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="anaTasiyici">
        <asp:Panel ID="pnl_yetkili" runat="server" Visible="true">

            <div class="kutu">
                <div class="kutuBaslik">
                    Konu Detay
                </div>
                <div class="kutuIcerik">

                    <div class="konuSol">
                        <table class="tablo" cellspacing="0" cellpadding="0">
                            <tr>
                                <th>Server Adı</th>
                                <td><asp:Label ID="lbl_serverAdi" runat="server" Text="Server Adı" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Website</th>
                                <td><asp:Label ID="lbl_website" runat="server" Text="Website" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Tür</th>
                                <td><asp:Label ID="lbl_tur" runat="server" Text="Tür Bilgisi" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Zorluk</th>
                                <td><asp:Label ID="lbl_zorluk" runat="server" Text="Zorluk Bilgisi" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Açılış Tarihi</th>
                                <td><asp:Label ID="lbl_acilisTarihi" runat="server" Text="Açılış Tarihi" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Vip Konu</th>
                                <td><asp:Label ID="lbl_vip" runat="server" Text="true&false" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Konu Onayı</th>
                                <td><asp:Label ID="lbl_onay" runat="server" Text="true&false" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                            <tr>
                                <th>Konu Sahibi</th>
                                <td><asp:Label ID="lbl_kullanici" runat="server" Text="kullaniciAdi" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                        </table>
                    </div>

                    <div class="konuSag">
                        <table class="tablo" cellspacing="0" cellpadding="0">
                            <tr>
                                <th>Başlık</th>
                                <td><asp:Label ID="lbl_baslik" runat="server" Text="Konu Başlığı" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                             <tr>
                                <th style="text-align:justify">İçerik</th>
                                <td><asp:Label ID="lbl_icerik" runat="server" Text="Konu İçeriği" CssClass="lblStyle"></asp:Label></td>
                            </tr>
                        </table>

                    </div>
                    <div style="clear: both"></div>

                    <div class="butonlar">
                        <asp:LinkButton ID="lbtn_geriDon" runat="server" CssClass="konuButon" Text="Geri Dön" OnClick="lbtn_geriDon_Click"></asp:LinkButton>
                    </div>
                </div>
                </div>
        </asp:Panel>

        <asp:Panel ID="pnl_yetkisiz" runat="server" Visible="false">
            <div class="kutu yetkiMesajKutusu">
                <label class="yetkiMesaji">Bu sayfaya erişim yetkiniz yoktur.</label>
            </div>
        </asp:Panel>
    </div>

</asp:Content>
