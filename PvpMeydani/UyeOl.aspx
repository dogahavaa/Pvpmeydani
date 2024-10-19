<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UyeOl.aspx.cs" Inherits="PvpMeydani.UyeOl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="AdminPaneli/CSS/UyelikCSS.css" rel="stylesheet" />
    <link href="CSS/MasterCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="frame">
        <div class="mainFrame">
            <div class="baslik">
                Üye Ol
            </div>
            <div class="cizgi"></div>
            <div class="formFrame">
                <div class="satir">
                    <asp:TextBox ID="tb_ad" runat="server" CssClass="tbStyle" placeholder="İsim"></asp:TextBox>
                </div>
                <div class="satir">
                    <asp:TextBox ID="tb_soyad" runat="server" CssClass="tbStyle" placeholder="Soyisim"></asp:TextBox>
                </div>
                <div class="satir">
                    <asp:TextBox ID="tb_kullaniciAdi" runat="server" CssClass="tbStyle" placeholder="Kullanıcı Adı"></asp:TextBox>
                </div>
                <div class="satir">
                    <asp:TextBox ID="tb_mail" runat="server" CssClass="tbStyle" placeholder="Mail"></asp:TextBox>
                </div>
                <div class="satir">
                    <asp:TextBox ID="tb_sifre" runat="server" CssClass="tbStyle" placeholder="Şifre" TextMode="Password"></asp:TextBox>
                </div>
                <div class="satir" style="margin-left:32px;">
                    Profil Resmi<br />
                    <asp:FileUpload ID="fu_uyeResim" runat="server" />
                </div>
                <div class="satir">
                    <label>Zaten bir hesabın mı var ? <a href="UyeGirisi.aspx">Üye Girişi</a></label>
                </div>
                <div class="satir" style="margin-top:24px;">
                    <asp:LinkButton ID="lbtn_uyeOl" runat="server" Text="Üye Ol" CssClass="uyeOlButon" OnClick="lbtn_uyeOl_Click"></asp:LinkButton>
                </div>
                <asp:Panel ID="pnl_basariliBilgi" runat="server" CssClass="satir panel basarili" Visible="false">
                    <asp:Label ID="lbl_mesaj" runat="server" CssClass="mesaj"><b>Aramıza Hoşgeldin!</b><br />Üyeliğin bir yönetici tarafından onaylanana kadar konu açamazsın ama <a href="UyeGirisi.aspx">Buradan</a> giriş yaparak sitemizde dilediğin gibi gezinebilirsin. <br />İyi Forumlar!</asp:Label>
                </asp:Panel>
                <asp:Panel ID="pnl_basarisizBilgi" runat="server" CssClass="satir panel basarisiz" Visible="false">
                    <asp:Label ID="lbl_basarisizMesaj" runat="server" CssClass="mesaj">asdad</asp:Label>
                </asp:Panel>
            </div>
        </div>
    </div>
    

</asp:Content>
