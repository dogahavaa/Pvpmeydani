<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="KonuIcerigi.aspx.cs" Inherits="PvpMeydani.KonuIcerigi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/MasterCSS.css" rel="stylesheet" />
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/DetayCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="konuFrame">
        <div class="konu">
            <div class="uyeBilgileri">
                <table cellspacing="0" cellpadding="0" class="tablo">
                    <tr>
                        <td>
                            <asp:Image ID="img_uyeresim" runat="server" ImageUrl="~/Resimler/UyeResimleri/none.png" CssClass="uyeresim" />
                        </td>
                    </tr>
                    <tr><th class="ka"><asp:label ID="lbl_uka" runat="server" Text="Kullanıcı Adıı"></asp:label></th></tr>
                    <tr><td>Katılım : </td></tr>
                    <tr><td>Reaksiyon Skoru : </td></tr>
                    <tr><td>Mesaj Sayısı : </td> </tr>
                </table>
            </div>
            <div class="icerik">
                <div>
                    <asp:Label ID="lbl_mesajTarihi" runat="server" CssClass="tarih" Text="Mesaj Tarihi : 16.10.2024"></asp:Label>
                    <asp:LinkButton ID="lbtn_begen" runat="server" CssClass="begen">
                        <img src="Resimler/Icons/heart.png" />
                    </asp:LinkButton>
                    <div style="clear: both"></div>
                </div>
                <hr />
                İÇERİK KISMI
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
        <div class="yorumlar">
        </div>

    </div>
    <div style="clear: both"></div>
</asp:Content>
