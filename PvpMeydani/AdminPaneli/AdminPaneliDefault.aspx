<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="AdminPaneliDefault.aspx.cs" Inherits="PvpMeydani.AdminPaneli.AdminPaneliDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Anasayfa</title>
    <link href="CSS/AnasayfaCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="anaTasiyici">
        <asp:Panel ID="pnl_yetkili" runat="server" Visible="true">

            <div class="bilgiFrame" style="margin-bottom:50px;">
                <div class="kutu konuBilgisi" style="width: 200px; height: 200px; float: left; margin-left:270px;">
                    <h3 style="margin-top:10px;">Konu Sayısı</h3>
                    <hr style="margin-bottom:40px; margin-top:10px;" />
                    <asp:Label ID="lbl_konuSayisi" runat="server" Text="20" CssClass="bilgiYazi"></asp:Label>
                </div>
                <div class="kutu yorumBilgisi" style="width: 200px; height: 200px; float: left; margin-left:200px;">
                    <h3 style="margin-top:10px;">Yorum Sayısı</h3>
                    <hr style="margin-bottom:40px; margin-top:10px;" />
                    <asp:Label ID="lbl_yorumSayisi" runat="server" Text="20" CssClass="bilgiYazi"></asp:Label>
                </div>
                <div class="kutu uyeBilgisi" style="width: 200px; height: 200px; float: left; margin-left:200px;">
                    <h3 style="margin-top:10px;">Üye Sayısı</h3>
                    <hr style="margin-bottom:40px; margin-top:10px;" />
                    <asp:Label ID="lbl_uyeSayisi" runat="server" Text="20" CssClass="bilgiYazi"></asp:Label>
                </div>
                <div style="clear:both"></div>
            </div>

            <div class="bilgiFrame">
                <div class="kutu">
                    <div class="konuBaslik">
                        Onay Bekleyen Konular
                    </div>
                    <div class="konuIcerik">
                        <asp:ListView ID="lv_onayBekleyenKonular" runat="server" OnItemCommand="lv_onayBekleyenKonular_ItemCommand">
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
            </div>

            <div class="bilgiFrame">
                <div class="kutu">
                    <div class="uyeBaslik">
                        Onay Bekleyen Üyeler
                    </div>
                    <div class="uyeIcerik">
                        <asp:ListView ID="lv_onayBekleyenUyeler" runat="server" OnItemCommand="lv_onayBekleyenUyeler_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Fotoğraf</th>
                                    <th>Ad</th>
                                    <th>Soyad</th>
                                    <th>Kullanıcı Adı</th>
                                    <th>Mail</th>
                                    <th>Onayla & Reddet</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td>
                                    <img src="../Resimler/UyeResimleri/<%# Eval("ProfilFotografi") %>" style="width: 50px; height: 50px;" />
                                </td>
                                <td><%# Eval("Ad") %></td>
                                <td><%# Eval("Soyad") %></td>
                                <td><%# Eval("KullaniciAdi") %></td>
                                <td><%# Eval("Mail") %></td>
                                <td>
                                    <asp:LinkButton ID="lbtn_onayla" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="onayla">
                                    <img src="Images/Icons/check.png" style="style="width: 16px; height: 16px;" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lbtn_reddet" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                    <img src="Images/Icons/x.png" style="style="width: 16px; height: 16px;" />
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <div class="yetkiMesajKutusuKucuk">
                        <asp:Label ID="lbl_uyeOnayMesaj" runat="server" CssClass="yetkiMesajiKucuk"></asp:Label>
                    </div>
                    </div>
                </div>
            </div>

        </asp:Panel>

        <asp:Panel ID="pnl_yetkisiz" runat="server" Visible="false">
            <div class="kutu yetkiMesajKutusu">
                <label class="yetkiMesaji">Bu sayfaya erişim yetkiniz yoktur.</label>
            </div>
        </asp:Panel>
    </div>


</asp:Content>

