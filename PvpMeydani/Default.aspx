<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PvpMeydani.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/MasterCSS.css" rel="stylesheet" />
    <link href="CSS/AnasayfaCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="anasayfaFrame">
        <%--<div class="altMenu">
            <ul>
                <li>Yeni Konular</li>
                <li>Yeni Mesajlar</li>
                <li>Popüler Konular</li>
            </ul>
            <asp:LinkButton ID="lbtn_konuOlustur" runat="server" Text="Konu Oluştur" CssClass="konuOlusturButon"></asp:LinkButton>
        </div>--%>
        <div class="icerikFrame">
            <div class="kategoriBaslik">
                VIP KONULAR
            </div>
            <div class="kategoriIcerik">
                <asp:Repeater ID="rptr_vipIcerik" runat="server">
                    <ItemTemplate>
                        <div class="konu">
                            <div class="gosterimSol">
                                <h4><%# Eval("Baslik")%></h4>
                                Yazar : <%# Eval("UyeKullaniciAdi") %> | Tarih : <%# Eval("EklenmeTarihi") %>
                            </div>
                            <div class="gosterimSag">
                                <b>Görüntüleme : </b> <%# Eval("GoruntulemeSayisi") %><br />
                                <b>Yorum       : </b> <%# Eval("YorumSayisi") %>
                            </div>
                            
                            <div style="clear:both"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <div class="icerikFrame">
            <div class="kategoriBaslik">
                YENİ KONULAR
            </div>
            <div class="kategoriIcerik">
                <asp:Repeater ID="rptr_yeniKonular" runat="server">
                    <ItemTemplate>
                        <div class="konu">
                            <div class="gosterimSol">
                                <h4><%# Eval("Baslik")%></h4>
                                Yazar : <%# Eval("UyeKullaniciAdi") %> | Tarih : <%# Eval("EklenmeTarihi") %>
                            </div>
                            <div class="gosterimSag">
                                <b>Görüntüleme : </b> <%# Eval("GoruntulemeSayisi") %><br />
                                <b>Yorum       : </b> <%# Eval("YorumSayisi") %>
                            </div>
                            <div style="clear:both"></div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</asp:Content>
