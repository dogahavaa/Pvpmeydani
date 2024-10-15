<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="KonuOlustur.aspx.cs" Inherits="PvpMeydani.KonuOlustur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pvp Meydanı - Konu Oluştur</title>
    <link href="CSS/MasterCSS.css" rel="stylesheet" />
    <link href="CSS/konuOlustur.css" rel="stylesheet" />
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="konuFrame">
        <div class="kutu">
            <div class="kutuBaslik">
                Konu Oluştur
            </div>
            <div class="kutuIcerik">
                <div class="konuSolFrame">
                    <div class="satir">
                        Konu Başlığı<br />
                        <asp:TextBox ID="tb_konuBaslik" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="satir">
                        Server Adı<br />
                        <asp:TextBox ID="tb_serverAdi" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="satir">
                        Server Türü<br />
                        <asp:DropDownList ID="ddl_tur" runat="server" CssClass="konuDdl" DataTextField="TurBilgisi" DataValueField="ID"></asp:DropDownList>
                    </div>
                    <div class="satir">
                        Zorluk<br />
                        <asp:DropDownList ID="ddl_zorluk" runat="server" CssClass="konuDdl" DataTextField="ZorlukSeviyesi" DataValueField="ID"></asp:DropDownList>
                    </div>
                    <div class="satir">
                        Website<br />
                        <asp:TextBox ID="tb_webSite" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                </div>

                <div class="konuSagFrame">
                    <div class="satir">
                        Açılış Tarihi
                    <br />
                        <asp:Calendar ID="cl_acilisTarihi" runat="server"></asp:Calendar>
                    </div>
                    <div class="satir" style="margin-top: 30px;">
                        Server Durumu &nbsp
                    <asp:CheckBox ID="cb_serverDurumu" runat="server" />
                    </div>

                </div>
                <div style="clear: both"></div>
                <div class="satir" style="margin-left: 20px;">
                    İçerik<br />
                    <asp:TextBox ID="tb_icerik" runat="server" CssClass="icerik" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div class="satir" style="text-align: center; margin: 40px 0;">
                    <asp:LinkButton ID="lbtn_konuOlustur" runat="server" CssClass="konuOlustur" Text="Oluştur" OnClick="lbtn_konuOlustur_Click"></asp:LinkButton>
                </div>
                <asp:Label ID="lbl_bilgi" runat="server" Visible="false"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
