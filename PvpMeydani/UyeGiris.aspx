<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UyeGiris.aspx.cs" Inherits="PvpMeydani.UyeGiris" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pvp Meydanı - Üye Giriş</title>
    <link href="AdminPaneli/CSS/UyelikCSS.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="mainFrame" style="min-height:375px;">
            <div class="baslik">
                Üye Giriş
            </div>
            <div class="cizgi"></div>
            <div class="formFrame">
                <div class="satir">
                    <asp:TextBox ID="tb_kullaniciAdi" runat="server" CssClass="tbStyle" placeholder="Kullanıcı Adı"></asp:TextBox>
                </div>
                <div class="satir">
                    <asp:TextBox ID="tb_sifre" runat="server" CssClass="tbStyle" placeholder="Şifre" TextMode="Password"></asp:TextBox>
                </div>
                <div class="satir">
                    <label>Henüz aramıza katılmadın mı ? <a href="#">Üye Ol</a></label>
                </div>
                <div class="satir" style="margin-top:24px;">
                    <asp:LinkButton ID="lbtn_giris" runat="server" Text="Giriş Yap" CssClass="uyeOlButon" OnClick="lbtn_giris_Click"></asp:LinkButton>
                </div>
                <asp:Panel ID="pnl_basarisizBilgi" runat="server" CssClass="satir panel basarisiz" Visible="false">
                    <asp:Label ID="lbl_basarisizMesaj" runat="server" CssClass="mesaj">asdad</asp:Label>
                </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
