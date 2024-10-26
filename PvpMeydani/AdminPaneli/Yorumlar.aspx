<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="Yorumlar.aspx.cs" Inherits="PvpMeydani.AdminPaneli.Yorumlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pvp Meydanı - Yorum İşlemleri</title>
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="anaTasiyici">
        <asp:Panel ID="pnl_yetkili" runat="server" Visible="true">
            <div class="kutu">
                <div class="kutuBaslik">
                    Yeni Yorumlar
                </div>
                <div class="kutuIcerik">
                    <asp:ListView ID="lv_yeniYorumlar" runat="server" OnItemCommand="lv_yeniYorumlar_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Kullanıcı Adı</th>
                                    <th>Konu Başlığı</th>
                                    <th>İçerik</th>
                                    <th>Eklenme Tarihi</th>
                                    <th>İşlemler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("UyeKullaniciAdi") %></td>
                                <td><%# Eval("KonuBasligi") %></td>
                                <td><%# Eval("Icerik") %></td>
                                <td><%# Eval("GonderimTarihi") %></td>
                                <td>
                                    <asp:LinkButton ID="lbtn_yeniYorumSil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                 <img src="Images/Icons/x.png" style="width: 16px; height: 16px;" />
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="yetkiMesajKutusuKucuk">
                        <asp:Label ID="Label1" runat="server" CssClass="yetkiMesajiKucuk"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="kutu">
                <div class="kutuBaslik">
                    Tüm Yorumlar
                </div>
                <div class="kutuIcerik">
                    <asp:ListView ID="lv_tumYorumlar" runat="server" OnItemCommand="lv_tumYorumlar_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Kullanıcı Adı</th>
                                    <th>Konu Başlığı</th>
                                    <th>İçerik</th>
                                    <th>Beğeni Sayısı</th>
                                    <th>Eklenme Tarihi</th>
                                    <th>İşlemler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("UyeKullaniciAdi") %></td>
                                <td><%# Eval("KonuBasligi") %></td>
                                <td><%# Eval("Icerik") %></td>
                                <td><%# Eval("BegeniSayisi") %></td>
                                <td><%# Eval("GonderimTarihi") %></td>
                                <td>
                                    <asp:LinkButton ID="lbtn_yorumSil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                 <img src="Images/Icons/x.png" style="width: 16px; height: 16px;" />
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="yetkiMesajKutusuKucuk">
                        <asp:Label ID="lbl_konuOnayMsg" runat="server" CssClass="yetkiMesajiKucuk"></asp:Label>
                    </div>
                </div>
            </div>
        </asp:Panel>


        <asp:Panel ID="pnl_yetkisiz" runat="server" Visible="true">
            <div class="kutu yetkiMesajKutusu">
                <label class="yetkiMesaji">Bu sayfaya erişim yetkiniz yoktur.</label>
            </div>
        </asp:Panel>
    </div>



</asp:Content>
