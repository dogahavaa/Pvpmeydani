﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="Uyeler.aspx.cs" Inherits="PvpMeydani.AdminPaneli.Uyeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="anaTasiyici">
        <div class="kutu">
            <div class="kutuBaslik">
                Onay Bekleyen Üyeler
            </div>
            <div class="kutuIcerik">
                <asp:ListView ID="lv_onayBekleyen" runat="server" OnItemCommand="lv_onayBekleyen_ItemCommand">
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
            </div>
        </div>
        <div class="kutu">
            <div class="kutuBaslik">
                Kayıtlı Üyeler
            </div>
            <div class="kutuIcerik">

                <asp:Panel ID="pnl_silmeBasarisiz" runat="server" Visible="false" style="text-align:right; margin-bottom:20px;">
                    <asp:Label ID="lbl_yetkiHatasi" runat="server" style="color:darkred; font-size:14pt;margin-right:30px;" Text="Silme işlemi yetki hatası!"></asp:Label>
                </asp:Panel>

                <asp:ListView ID="lv_uyeler" runat="server" OnItemCommand="lv_uyeler_ItemCommand">
                    <LayoutTemplate>
                        <table cellspacing="0" cellpadding="0" class="tablo">
                            <tr>
                                <th>ID</th>
                                <th>Fotoğraf</th>
                                <th>Ad</th>
                                <th>Soyad</th>
                                <th>Kullanıcı Adı</th>
                                <th>Mail</th>
                                <th>Donmuş</th>
                                <th>Mesaj Sayısı</th>
                                <th>Konu Sayısı</th>
                                <th>Reaksiyon Skoru</th>
                                <th>Seçenekler</th>
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
                            <td><%# Eval("Donmus") %></td>
                            <td><%# Eval("MesajSayisi") %></td>
                            <td><%# Eval("KonuSayisi") %></td>
                            <td><%# Eval("ReaksiyonSkoru") %></td>
                            <td>
                                <asp:LinkButton ID="lbtn_sil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                    <img src='Images/Icons/x.png' style="width:16px; height:16px;" />
                                </asp:LinkButton>
                                <asp:LinkButton ID="lbtn_silineniGeriAl" runat="server" CssClass="secenekResim" Visible='<%# Eval("Silinmis") %>' CommandArgument='<%# Eval("ID") %>' CommandName="geriAl">
                                    <img src='Images/Icons/check.png' style="width:16px; height:16px;" />
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

</asp:Content>
