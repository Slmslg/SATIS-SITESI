<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdresSil.aspx.cs" Inherits="SATIS_SITESI.Pages.Admin.AdresSil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../../Style/Adres.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="adresSil">
        <h3>Adres Sil</h3>
        <table>
            <tr>
                <td>KULLANICI SEÇ</td>
                <td><asp:DropDownList ID="kulDropDown" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="KULLANICI_AD" DataValueField="KULLANICI_ID"   OnSelectedIndexChanged="kulDropDown_SelectedIndexChanged" CssClass="kulDropDown"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT [KULLANICI_ID], [KULLANICI_AD], [KULLANICI_ADRES_ID] FROM [KULLANICI]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>ADRES SEÇ</td>
                <td><asp:DropDownList ID="adresSilDrop" runat="server" AutoPostBack="True" OnSelectedIndexChanged="adresSilDrop_SelectedIndexChanged"  DataSourceID="AdresSource" DataTextField="SOKAK" DataValueField="KULLANICI_ID" CssClass="adresDropDown"></asp:DropDownList>
                    <asp:SqlDataSource ID="AdresSource" runat="server" ConnectionString="<%$ ConnectionStrings:CommerceDatabaseConnectionString %>" SelectCommand="SELECT * FROM [ADRES] WHERE ([KULLANICI_ID] = @KULLANICI_ID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="kulDropDown" Name="KULLANICI_ID" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><asp:Button ID="silButon" runat="server" Text="SİL" OnClick="silButon_Click" CssClass="silButon" /></td>
            </tr>
        </table>
    </div>
</asp:Content>
