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
                                <th>İzin Durumu</th>
                                <th>Seçenekler</th>
                            </tr>
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td style="text-align: left"><%#Eval("YetkilendirmeIslemi") %></td>
                            <td><%# Eval("Onay") %></td>
                            <td>
                                <asp:LinkButton ID="lbtn_true" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("YetkilendirmeID") %>' CommandName="izinDegistir">
                                    <asp:Image ID="img_ikon" runat="server" ImageUrl="Images/Icons/refresh.png" />
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
</asp:Content>
