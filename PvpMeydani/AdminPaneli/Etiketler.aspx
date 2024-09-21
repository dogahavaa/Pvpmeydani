<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="Etiketler.aspx.cs" Inherits="PvpMeydani.AdminPaneli.Etiketler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/EtiketlerCSS.css" rel="stylesheet" />
    <link href="CSS/FormCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="anaTasiyici">

        <div class="kutu sol">
            <div class="tabloBaslik">
                Tür Ekle
            </div>
            <div class="tabloIcerik">
                <div class="etiketSatir" style="text-align:center">
                    <label class="etiketBaslik">Tür Bilgisi</label>
                </div>
                <div class="etiketSatir" style="text-align:center; margin-bottom:20px;">
                    <asp:TextBox ID="tb_turBilgisi" runat="server" CssClass="tbStyle"></asp:TextBox>
                </div>
                <div class="etiketSatir" style="text-align:center; margin-top:30px;">
                    <asp:LinkButton ID="lbtn_turEkle" runat="server" OnClick="lbtn_turEkle_Click" Text="Ekle" CssClass="ekleButon"></asp:LinkButton>
                </div>
            </div>
        </div>

        <div class="kutu sag">
            <div class="tabloBaslik">
                Türler
            </div>
            <div class="kutuIcerik">
                <div class="tabloIcerik">
                    <asp:ListView ID="lv_turler" runat="server" OnItemCommand="lv_turler_ItemCommand">
                        <LayoutTemplate>
                            <table cellspacing="0" cellpadding="0" class="tablo">
                                <tr>
                                    <th>ID</th>
                                    <th>Tür</th>
                                    <th>Seçenekler</th>
                                </tr>
                                <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder> <%--//NEDEN--%>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("ID") %></td>
                                <td><%# Eval("TurBilgisi") %></td>
                                <td>Sil</td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>

        <div class="kutu sol">
            <div class="tabloBaslik">
                Zorluk Ekle
            </div>
            <div class="tabloIcerik">
                <div class="satir">
                    Zorluk
                </div>
                <div class="sag"></div>
            </div>
        </div>

        <div class="kutu sag">
            <div class="tabloBaslik">
                Zorluklar
            </div>
            <div class="kutuIcerik">
                <div class="tabloIcerik">
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
                                <td>Sil</td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
        
    </div>

</asp:Content>
