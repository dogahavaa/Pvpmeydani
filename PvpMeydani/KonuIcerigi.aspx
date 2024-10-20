<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="KonuIcerigi.aspx.cs" Inherits="PvpMeydani.KonuIcerigi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/MasterCSS.css" rel="stylesheet" />
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/DetayCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="konuFrame">
        <div class="konuBasligi">
            <asp:Label ID="lbl_konuBasligi" runat="server" Text="KONU BAŞLIĞI"></asp:Label>
        </div>
        <div class="konu">

            <div class="uyeBilgileri">
                <table cellspacing="0" cellpadding="0" class="tablo">
                    <tr>
                        <td>
                            <asp:Image ID="img_uyeresim" runat="server" ImageUrl="~/Resimler/UyeResimleri/none.png" CssClass="uyeresim" />
                        </td>
                    </tr>
                    <tr>
                        <th class="ka" style="padding: 5px 0;">
                            <asp:Label ID="lbl_uka" runat="server" Text="Kullanıcı Adıı"></asp:Label></th>
                    </tr>
                    <tr>
                        <td>Katılım :
                            <asp:Label ID="lbl_katilimTarihi" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Reaksiyon Skoru :
                            <asp:Label ID="lbl_reaksiyon" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>Mesaj Sayısı :
                            <asp:Label ID="lbl_mesajSayisi" runat="server"></asp:Label></td>
                    </tr>
                </table>
            </div>
            <div class="icerik">
                <div>
                    <asp:Label ID="lbl_mesajTarihi" runat="server" CssClass="tarih" Text="Mesaj Tarihi : 16.10.2024"></asp:Label>
                    <asp:Label ID="lbl_guncellemeTarihi" runat="server" CssClass="tarih" Text="Mesaj Tarihi : 16.10.2024"></asp:Label>
                    <asp:LinkButton ID="lbtn_begen" runat="server" CssClass="begen">
                        <img src="Resimler/Icons/heart.png" />
                    </asp:LinkButton>
                    <div style="clear: both"></div>
                </div>
                <hr />
                <table class="aciklamaTablo" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>Server Adı : </th>
                        <td>
                            <asp:Label ID="lbl_serverAdii" runat="server" Text="Server Adı"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Website : </th>
                        <td>
                            <asp:Label ID="lbl_website" runat="server" Text="Server Adı"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Tür : </th>
                        <td>
                            <asp:Label ID="lbl_tur" runat="server" Text="Server Adı"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Zorluk : </th>
                        <td>
                            <asp:Label ID="lbl_zorluk" runat="server" Text="Server Adı"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Açılış Tarihi : </th>
                        <td>
                            <asp:Label ID="lbl_acilisTarihi" runat="server" Text="Server Adı"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <th>Server Durumu : </th>
                        <td>
                            <asp:Label ID="lbl_svDurumu" runat="server" Text="Server Adı"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lbl_icerik" runat="server"></asp:Label>
            </div>
            <div style="clear: both"></div>
        </div>

        <%--YORUM YAZ--%>
        <div class="konuFrame">
            <div class="yorumYazFrame">
                <h3 style="text-align: center;">Yorum Yap</h3>
                <hr />
                <asp:Panel ID="pnl_uyeGirisli" runat="server">
                    <asp:TextBox ID="tb_yorumYaz" runat="server" TextMode="MultiLine" CssClass="yorumYazTB" placeholder="Yorum yaz...">
                    </asp:TextBox>
                    <div style="text-align: center; margin: 20px 0;">
                        <asp:LinkButton ID="lbtn_gonder" runat="server" Text="Gönder" CssClass="yorumYazBTN" OnClick="lbtn_gonder_Click"></asp:LinkButton>
                    </div>
                </asp:Panel>

                <asp:Panel ID="pnl_misafir" runat="server" Visible="false">
                    <asp:Label ID="lbl_yorumIzin" runat="server" CssClass="yetkiMesaji" Text="Yorum yapmak için lütfen giriş yapın."></asp:Label>
                </asp:Panel>
            </div>
        </div>


        <%---*-*-*-*- YORUMLAR -*-*-*---%>
        <div class="konuFrame">
            <div class="konu">
                <asp:Repeater ID="rptr_yorumlar" runat="server">
                    <ItemTemplate>
                        <div class="uyeBilgileri">
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <td>
                                        <asp:Image ID="img_yUyeResmi" runat="server" ImageUrl="~/Resimler/UyeResimleri/none.png" CssClass="uyeresim" />
                                    </td>
                                </tr>
                                <tr>
                                    <th class="ka" style="padding: 5px 0;">
                                        <asp:Label ID="lbl_yKullaniciAdi" runat="server" Text="Kullanıcı Adıı"></asp:Label></th>
                                </tr>
                                <tr>
                                    <td>Katılım :
                                    <asp:Label ID="lbl_yKatilim" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Reaksiyon Skoru :
                                    <asp:Label ID="lbl_yReaksiyon" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>Mesaj Sayısı :
                                    <asp:Label ID="lbl_yMesajSayisi" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                        <div class="icerik">
                            <div>
                                <asp:Label ID="lbl_yorumTarihi" runat="server" CssClass="tarih" Text="Mesaj Tarihi : 16.10.2024"></asp:Label>
                                <asp:LinkButton ID="lbtn_yBegen" runat="server" CssClass="begen">
                                         <img src="Resimler/Icons/heart.png" />
                                </asp:LinkButton>
                                <div style="clear: both"></div>
                            </div>
                            <hr />
                            Yorum Kısmı
                        </div>
                        <div style="clear: both"></div>
                    </ItemTemplate>
                </asp:Repeater>
                <div style="clear: both"></div>
            </div>
        </div>
    </div>
</asp:Content>
