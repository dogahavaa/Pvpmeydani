<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="YetkilendirmeDuzenle.aspx.cs" Inherits="PvpMeydani.AdminPaneli.YetkilendirmeDuzenle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="anaTasiyici">
        <div class="kutu">
            <div class="kutuBaslik">
                <asp:Label ID="lbl_baslik" runat="server" Text="Admin Yetkilerini Düzenle"></asp:Label>
            </div>
            <div class="kutuIcerik" style="text-align: left">
                <asp:ListView ID="lv_yetkilendirmeDuzenle" runat="server" OnItemCommand="lv_yetkilendirmeDuzenle_ItemCommand">
                    <LayoutTemplate>
                        <table cellspacing="0" cellpadding="0" class="tablo">
                            <tr>
                                <th>İşlem Açıklaması</th>
                                <th>Erişilebilirlik</th>
                            </tr>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="text-align: left"><%#Eval("IslemAciklamasi") %></td>
                            <td>
                                <asp:CheckBox ID="cb_erisebilir" runat="server" />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <div style="margin-top:30px; text-align:center">
                <asp:LinkButton ID="lbtn_onayla" runat="server" CssClass="onaylaButon" Text="İşlemleri Onayla" OnClick="lbtn_onayla_Click"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
