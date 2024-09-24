<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="Etiketler.aspx.cs" Inherits="PvpMeydani.AdminPaneli.Etiketler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/EtiketlerCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel ID="yetkili" runat="server" Visible="false">
        <div class="anaTasiyici">
            <div class="kutu sol">
                <div class="kutuBaslik">
                    Tür Ekle
                </div>
                <div class="kutuIcerik" style="min-height:272px;">
                    <div class="etiketSatir" style="text-align: center">
                        <label class="etiketBaslik">Tür Bilgisi</label>
                    </div>
                    <div class="etiketSatir" style="text-align: center; margin-bottom: 20px;">
                        <asp:TextBox ID="tb_turBilgisi" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="etiketSatir" style="text-align: center; margin-top: 30px;">
                        <asp:LinkButton ID="lbtn_turEkle" runat="server" OnClick="lbtn_turEkle_Click" Text="Ekle" CssClass="ekleButon"></asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="kutu sag">
                <div class="kutuBaslik">
                    Türler
                </div>
                <div class="kutuIcerik" style="min-height:272px;">
                    <asp:ListView ID="lv_turler" runat="server" OnItemCommand="lv_turler_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Tür</th>
                                    <th>Seçenekler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                                <%--//NEDEN--%>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("TurBilgisi") %></td>
                                <td>
                                    <asp:LinkButton ID="lbtn_sil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                        <img src="Images/x.png"  />
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>

            <%--ZORLUK KISMI--%>

            <div class="kutu sol">
                <div class="kutuBaslik">
                    Zorluk Ekle
                </div>
                <div class="kutuIcerik" style="min-height:272px;">
                    <div class="etiketSatir" style="text-align: center">
                        <label class="etiketBaslik">Zorluk Seviyesi</label>
                    </div>
                    <div class="etiketSatir" style="text-align: center; margin-bottom: 20px;">
                        <asp:TextBox ID="tb_zorlukEkle" runat="server" CssClass="tbStyle"></asp:TextBox>
                    </div>
                    <div class="etiketSatir" style="text-align: center; margin-top: 30px;">
                        <asp:LinkButton ID="lbtn_zorlukEkle" runat="server" OnClick="lbtn_zorlukEkle_Click" Text="Ekle" CssClass="ekleButon"></asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="kutu sag">
                <div class="kutuBaslik">
                    Zorluklar
                </div>
                <div class="kutuIcerik" style="min-height:272px;">
                    <asp:ListView ID="lv_zorluk" runat="server" OnItemCommand="lv_zorluk_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Zorluk</th>
                                    <th>Seçenekler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("ZorlukSeviyesi") %></td>
                                <td>
                                    <asp:LinkButton ID="lbtn_zorlukSil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID")%>' CommandName="sil">
                                        <img src="Images/x.png" />
                                    </asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="yetkisiz" runat="server" Visible="false">
        <div class="anaTasiyici">
            <div class="kutu yetkiMesajKutusu">
                <label class="yetkiMesaji">Bu sayfanın işlemlerini sadece 'Admin' Yetkisindeki kişiler yapabilir.</label>
            </div>
        </div>
    </asp:Panel>


</asp:Content>
