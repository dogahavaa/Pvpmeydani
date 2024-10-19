<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UyeGirisi.aspx.cs" Inherits="PvpMeydani.UyeGirisi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/MasterCSS.css" rel="stylesheet" />
    <link href="AdminPaneli/CSS/UyelikCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="frame">
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
                    <label>Henüz aramıza katılmadın mı ? <a href="UyeOl.aspx">Üye Ol</a></label>
                </div>
                <div class="satir" style="margin-top:24px;">
                    <asp:LinkButton ID="lbtn_giris" runat="server" Text="Giriş Yap" CssClass="uyeOlButon" OnClick="lbtn_giris_Click"></asp:LinkButton>
                </div>
                <asp:Panel ID="pnl_basarisizBilgi" runat="server" CssClass="satir panel basarisiz" Visible="false">
                    <asp:Label ID="lbl_basarisizMesaj" runat="server" CssClass="mesaj">asdad</asp:Label>
                </asp:Panel>
            </div>
        </div>

    </div>
</asp:Content>
