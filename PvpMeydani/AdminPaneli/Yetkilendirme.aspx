<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPaneliMaster.Master" AutoEventWireup="true" CodeBehind="Yetkilendirme.aspx.cs" Inherits="PvpMeydani.AdminPaneli.Yetkilendirme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/GenelCSS.css" rel="stylesheet" />
    <link href="CSS/ListelemeCSS.css" rel="stylesheet" />
    <link href="CSS/YetkilendirmeCSS.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="anaTasiyici">


        <div class="kutu sag">
            <div class="kutuBaslik">
                Görev Oluştur
            </div>
            <div class="kutuIcerik" style="min-height: 200px; width: 682px;">
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

        <div class="kutu sol">
            <div class="kutuBaslik">
                Görevler
            </div>
            <div class="kutuIcerik" style="min-height: 200px; width: 682px;">
                <asp:ListView ID="lv_gorevler" runat="server" OnItemCommand="lv_gorevler_ItemCommand">
                    <LayoutTemplate>
                        <table cellspacing="0" cellpadding="0" class="tablo">
                            <tr>
                                <th>Yetki</th>
                                <th>Seçenekler</th>
                            </tr>
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("GorevAdi") %></td>
                            <td>
                                <asp:LinkButton ID="lbtn_sil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="sil">
                                    <img src="Images/x.png" style="width:16px; height:16px;" />
                                </asp:LinkButton>
                                <a href='YetkilendirmeDuzenle.aspx?gorevID=<%# Eval("ID") %>' class="secenekResim">
                                    <img src="Images/Icons/insurance.png" style="width: 16px; height: 16px;" />
                                </a>
                                
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
                <asp:Label ID="lbl_silinemez" runat="server" CssClass="silinemezText" Visible="false"></asp:Label>
            </div>
        </div>
        <div style="clear: both"></div>

        <div class="kutu sol">
            <div class="kutuBaslik">
                İşlemler
            </div>
            <div class="kutuIcerik" style="min-height: 210px; width: 682px;">
                <asp:ListView ID="lv_islemler" runat="server" OnItemCommand="lv_islemler_ItemCommand">
                    <LayoutTemplate>
                        <table cellspacing="0" cellpadding="0" class="tablo">
                            <tr>
                                <th>İşlem Açıklaması</th>
                                <th>Seçenekler</th>
                            </tr>
                            <asp:PlaceHolder ID="itemPlaceHolder" runat="server"></asp:PlaceHolder>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("IslemAciklamasi") %></td>
                            <td>
                                <asp:LinkButton ID="lbtn_islemSil" runat="server" CssClass="secenekResim" CommandArgument='<%# Eval("ID") %>' CommandName="islemSil">
                            <img src="Images/x.png" style="width:16px; height:16px;" />
                                </asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>


        <div class="kutu sag" style="width: 700px">
            <div class="kutuBaslik">İşlem Oluştur</div>
            <div class="kutuIcerik" style="text-align: center">
                İşlem Adı &nbsp
         <asp:TextBox ID="tb_islem" runat="server" CssClass="tbStyle"></asp:TextBox>
                <asp:LinkButton ID="lbtn_islemolustur" runat="server" OnClick="lbtn_islemolustur_Click" CssClass="ekleButon" Text="Oluştur" Style="margin-left: 30px;"></asp:LinkButton>
            </div>
        </div>



    </div>

</asp:Content>
