<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminGiris.aspx.cs" Inherits="PvpMeydani.AdminPaneli.AdminGiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="CSS/AdminGirisCSS.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="tasiyici">
            <div class="buyukSatir" style="margin-top: 20px;">
                <label class="baslik">Yönetici Girişi</label>
            </div>
            <div class="kucukSatir cizgi"></div>
            <div class="form">
                <label class="kucukSatir">Mail</label><br />
                <div class="buyukSatir">
                    <asp:TextBox ID="tb_mail" runat="server" CssClass="textBoxStyle"></asp:TextBox>
                </div>
                <label class="kucukSatir">Şifre</label><br />
                <div class="buyukSatir">
                    <asp:TextBox ID="tb_sifre" runat="server" CssClass="textBoxStyle"></asp:TextBox>
                </div>
                <div class=" buyukSatir" style="margin-top: 20px; margin-left: 50px; margin-bottom:20px;">
                    <asp:LinkButton ID="lbtn_giris" runat="server" Text="Giriş Yap" CssClass="girisButon" OnClick="lbtn_giris_Click"></asp:LinkButton>
                </div>
                <asp:Panel ID="pnl_mesaj" runat="server" CssClass="mesajPanel" Visible="false">
                    <asp:Label ID="lbl_mesaj" runat="server">Kullanıcı Bulunamadı !</asp:Label>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
