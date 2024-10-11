<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="YoneticiIslemleri.aspx.cs" Inherits="PvpMeydani.AdminPaneli.YoneticiIslemleri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
    <link href="CSS/YoneticiIslemleriCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="anaTasiyici">

        <asp:Panel ID="pnl_yetkili" runat="server" Visible="true">
            <div class="kutu kutuYonetici sag">
                <div class="kutuBaslik">
                    Yönetici Kayıt
                </div>
                <div class="kutuIcerik" style="min-height: 682px;">
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
                    <div class="yoneticiSatir" style="margin-top: 30px; text-align: center">
                        <asp:LinkButton ID="lbtn_ekle" runat="server" CssClass="ekleButon" OnClick="lbtn_ekle_Click" Text="Onayla"></asp:LinkButton>
                    </div>
                    <asp:Panel ID="pnl_basarisiz" runat="server" CssClass="basarisizPanel" Visible="false">
                        <asp:Label ID="lbl_bilgi" runat="server" CssClass="bilgi">Başarısız!</asp:Label>
                    </asp:Panel>
                </div>
            </div>

            <div class="kutu kutuYonetici sol">
                <div class="kutuBaslik">
                    Yönetici Ekibi
                </div>
                <div class="kutuIcerik" style="min-height: 682px;">
                    <asp:DropDownList ID="ddl_filtre" runat="server" CssClass="filtre" OnSelectedIndexChanged="ddl_filtre_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="Hepsi" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Aktif" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Pasif" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Silinmiş" Value="4"></asp:ListItem>
                    </asp:DropDownList>

                    <asp:ListView ID="lv_yoneticiEkibi" runat="server" OnItemCommand="lv_yoneticiEkibi_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Profil Fotoğrafı</th>
                                    <th>Yetki</th>
                                    <th>Kullanıcı Adı</th>
                                    <th>Durum</th>
                                    <th>Silinmiş</th>
                                    <th>Seçenekler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>

                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td>
                                    <img src='../Resimler/YoneticiResimleri/<%# Eval("ProfilFotografi") %>' /></td>
                                <td><%# Eval("Gorev") %></td>
                                <td><%# Eval("KullaniciAdi") %></td>
                                <td><%# Eval("Durum") %></td>
                                <td><%# Eval("Silinmis") %></td>
                                <td>
                                    <a href='YoneticiDuzenle.aspx?yoneticiID=<%# Eval("ID") %>' class="secenekResim">
                                        <img src="Images/Icons/editt.png" style="width: 16px; height: 16px;" />
                                    </a>
                                    <asp:LinkButton ID="lbtn_yDurumDegistir" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="yDurumDegistir">
                                        <img src="Images/Icons/refresh.png" style="width:16px; height:16px;" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lbtn_ySil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="ySil">
                                        <img src="Images/Icons/x.png" style="width:16px; height:16px;" />
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lbtn_geriAl" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="ySilineniGeriAl" Visible='<%# Eval("Silinmis") %>'>
                                        <img src="Images/Icons/check.png" style="width:16px; height:16px;" />
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
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
