<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="KonuIslemleri.aspx.cs" Inherits="PvpMeydani.AdminPaneli.KonuIslemleri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Pvp Meydanı - Konu İşlemleri</title>
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
<link href="CSS/ListelemeCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="anaTasiyici">

        <asp:Panel ID="pnl_yetkili" runat="server" Visible="true">
            <div class="kutu">
                <div class="kutuBaslik">
                    Onay Bekleyen Konular
                </div>
                <div class="kutuIcerik">
                    <asp:ListView ID="lv_onayBekleyen" runat="server" OnItemCommand="lv_onayBekleyen_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Kullanıcı Adı</th>
                                    <th>Başlık</th>
                                    <th>Server Adı</th>
                                    <th>Website</th>
                                    <th>Serverın Açılış Tarihi</th>
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
                                <td><%# Eval("Baslik") %></td>
                                <td><%# Eval("ServerAdi") %></td>
                                <td><%# Eval("Website") %></td>
                                <td><%# Eval("AcilisTarihi") %></td>
                                <td><%# Eval("EklenmeTarihi") %></td>
                                <td>
                                    <asp:LinkButton ID="lbtn_onayla" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="onayla">
                                 <img src="Images/Icons/check.png" style="style="width: 16px; height: 16px;" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lbtn_reddet" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                 <img src="Images/Icons/x.png" style="style="width: 16px; height: 16px;" />
                                    </asp:LinkButton>
                                    <a href='KonuDetay.aspx?gorevID=<%# Eval("ID") %>' class="secenekResim">
                                        <img src="Images/Icons/find.png" style="width: 16px; height: 16px;" />
                                    </a>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="yetkiMesajKutusuKucuk">
                        <asp:Label ID="lbl_konuOnayMsg" runat="server" CssClass="yetkiMesajiKucuk"></asp:Label>
                    </div>
                </div>
            </div>

            <%--AKTİF KONULAR--%>
            <div class="kutu">
                <div class="kutuBaslik">
                    Aktif Konular
                </div>
                <div class="kutuIcerik">

                    <asp:ListView ID="lv_konular" runat="server" OnItemCommand="lv_konular_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Başlık</th>
                                    <th>Server Adı</th>
                                    <th>Server Durumu</th>
                                    <th>Vip Konu</th>
                                    <th>Görüntülenme Sayısı</th>
                                    <th>Beğeni Sayısı</th>
                                    <th>Yorum Sayısı</th>
                                    <th>Eklenme Tarihi</th>
                                    <th>Güncellenme Tarihi</th>
                                    <th>Son Yorum Tarihi</th>
                                    <th>İşlemler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("Baslik") %></td>
                                <td><%# Eval("ServerAdi") %></td>
                                <td><%# Eval("ServerDurumu") %></td>
                                <td><%# Eval("VipKonu") %></td>
                                <td><%# Eval("GoruntulemeSayisi") %></td>
                                <td><%# Eval("BegeniSayisi") %></td>
                                <td><%# Eval("YorumSayisi") %></td>
                                <td><%# Eval("EklenmeTarihi") %></td>
                                <td><%# Eval("GuncellenmeTarihi") %></td>
                                <td><%# Eval("SonYorumTarihi") %></td>
                                <td>
                                    <asp:LinkButton ID="lbtn_vip" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="vip">
                                        <asp:Image ID="img_vip" runat="server" ImageUrl="Images/Icons/vip.png" style="width:16px; height:16px;" />
                                    </asp:LinkButton>
                                    
                                    <asp:LinkButton ID="lbtn_sil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                         <img src='Images/Icons/x.png' style="width:16px; height:16px;" />
                                    </asp:LinkButton>

                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="yetkiMesajKutusuKucuk">
                        <asp:Label ID="lbl_uyeSilMesaj" runat="server" CssClass="yetkiMesajiKucuk"></asp:Label>
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
