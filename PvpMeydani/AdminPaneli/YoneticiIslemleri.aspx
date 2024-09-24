﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="YoneticiIslemleri.aspx.cs" Inherits="PvpMeydani.AdminPaneli.YoneticiIslemleri" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
    <link href="CSS/YoneticiIslemleriCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="yetkisiz" runat="server" Visible="false">
        <div class="anaTasiyici">
            <div class="yetkiMesajKutusu">
                <label class="yetkiMesaji">Bu sayfanın işlemlerini sadece 'Admin' Yetkisindeki kişiler yapabilir.</label>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="yetkili" runat="server" Visible="true">
        <div class="anaTasiyici">

            <div class="kutu kutuYonetici sol">
                <div class="kutuBaslik">
                    Yönetici Kayıt
                </div>
                <div class="kutuIcerik" style="min-height:682px;">
                    <div class="yoneticiSatir">
                        <label>Ad</label><br />
                        <asp:TextBox ID="tb_ad" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Soyad<br />
                        <asp:TextBox ID="tb_soyad" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Kullanıcı Adı<br />
                        <asp:TextBox ID="tb_kullaniciAdi" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Mail<br />
                        <asp:TextBox ID="tb_mail" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Şifre<br />
                        <asp:TextBox ID="tb_sifre" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="yoneticiSatir">
                        Yetki<br />
                        <asp:DropDownList ID="ddl_yetki" runat="server" CssClass="ddlStyle" DataTextField="GorevAdi" DataValueField="ID"></asp:DropDownList>
                    </div>
                    <div class="yoneticiSatir">
                        Profil Fotoğrafı
                        <asp:FileUpload ID="fu_profilResmi" runat="server" />
                    </div>
                    <div class="yoneticiSatir" style="margin-top:30px; text-align:center">
                        <asp:LinkButton ID="lbtn_ekle" runat="server" CssClass="ekleButon" OnClick="lbtn_ekle_Click" Text="Kayıt"></asp:LinkButton>
                    </div>
                    <asp:Panel ID="pnl_basarisiz" runat="server" CssClass="basarisizPanel" Visible="false">
                        <asp:Label ID="lbl_bilgi" runat="server" CssClass="bilgi">Başarısız!</asp:Label>
                    </asp:Panel>
                </div>
            </div>
            
            <div class="kutu kutuYonetici sag">
                <div class="kutuBaslik">
                    Yönetici Ekibi
                </div>
                <div class="kutuIcerik" style="min-height:682px;">
                    <asp:ListView ID="lv_yoneticiEkibi" runat="server" OnItemCommand="lv_yoneticiEkibi_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Profil Fotoğrafı</th>
                                    <th>Yetki</th>
                                    <th>Kullanıcı Adı</th>
                                    <th>Durum</th>
                                    <th>Seçenekler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>

                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><img src='Images/<%# Eval("ProfilFotografi") %>' /></td>
                                <td><%# Eval("Gorev") %></td>
                                <td><%# Eval("KullaniciAdi") %></td>
                                <td><%# Eval("Durum") %></td>
                                <td>Seçenekler</td>
                            </tr>
                        </ItemTemplate>

                    </asp:ListView>
                </div>
            </div>
            <div class="kutu sol" style="">
                <div class="kutuBaslik">
                    Görev Oluştur
                </div>
                <div class="kutuIcerik" style="min-height:200px; width:682px; ">
                    <div class="etiketSatir" style="text-align: center">
                        <label class="etiketBaslik">Yetki</label>
                    </div>
                    <div class="etiketSatir" style="text-align: center; margin-bottom: 20px;">
                        <asp:TextBox ID="tb_yetkiAdi" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="etiketSatir" style="text-align: center; margin-top: 30px;">
                        <asp:LinkButton ID="lbtn_yetkiEkle" runat="server" Text="Ekle" OnClick="lbtn_yetkiEkle_Click" CssClass="ekleButon">

                        </asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="kutu sag">
                <div class="kutuBaslik">
                    Görevler
                </div>
                <div class="kutuIcerik" style="min-height:200px; width:682px;">
                    <asp:ListView ID="lv_gorevler" runat="server" OnItemCommand="lv_gorevler_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Yetki</th>
                                    <th>Seçenekler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("GorevAdi") %></td>
                                <td>
                                    <asp:LinkButton ID="lbtn_sil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                        <img src="Images/x.png" style="width:16px; height:16px;" />
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>