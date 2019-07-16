<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="Teste.aspx.cs" Inherits="Warden.Views.Teste" %>
<asp:Content ID="ctt_teste" ContentPlaceHolderID="cph_main" runat="server">

    <usc:ButtonUsc runat="server" ID="ButtonUsc1" Text="Regular" ComponentSize="regular" ComponentStyle="primary"/>
    <usc:ButtonUsc runat="server" ID="ButtonUsc2" Text="Small" ComponentSize="small" ComponentStyle="primary"/>
    <usc:ButtonUsc runat="server" ID="btn_teste" Text="Large" ComponentSize="large" ComponentStyle="primary"/>

    <usc:ButtonUsc runat="server" ID="ButtonUsc3" Text="Round" ComponentSize="regular" ComponentStyle="primary Round"/>
    <usc:ButtonUsc runat="server" ID="ButtonUsc4" Text="Simple" ComponentSize="small" ComponentStyle="primary Simple"/>
    <usc:ButtonUsc runat="server" ID="ButtonUsc5" Text="Link" ComponentSize="large" ComponentStyle="primary Link"/>

    <usc:DropdownUsc runat="server" />
    <usc:CardUsc runat="server" />
    <div class="form-row">
        <usc:TextBoxUsc runat="server" />
        <usc:TextBoxUsc runat="server" />
    </div>
    <usc:TableUsc runat="server" />
    <usc:AlertUsc runat="server" />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div class="row">
        <usc:ChartBarUsc runat="server" />
        <usc:ChartLineUsc runat="server" />
    </div>
</asp:Content>
