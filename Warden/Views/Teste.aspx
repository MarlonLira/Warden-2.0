<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="Teste.aspx.cs" Inherits="Warden.Views.Teste" %>
<asp:Content ID="ctt_teste" ContentPlaceHolderID="cph_main" runat="server">


    <usc:ButtonUsc runat="server" ID="ButtonUsc1" Text="Regular" ComponentSize="regular" ComponentStyle="primary"/>
    <usc:ButtonUsc runat="server" ID="ButtonUsc2" Text="Small" ComponentSize="small" ComponentStyle="primary"/>
    <usc:ButtonUsc runat="server" ID="btn_teste" Text="Large" ComponentSize="large" ComponentStyle="primary"/>

    <usc:ButtonUsc runat="server" ID="ButtonUsc3" Text="Round" ComponentSize="regular" ComponentStyle="primary Round"/>
    <usc:ButtonUsc runat="server" ID="ButtonUsc4" Text="Simple" ComponentSize="small" ComponentStyle="primary Simple"/>
    <usc:ButtonUsc runat="server" ID="ButtonUsc5" Text="Link" ComponentSize="large" ComponentStyle="primary Link"/>

    <usc:ButtonUsc runat="server" ID="ButtonUsc6" Text="Regular" ComponentSize="regular" />
    <usc:ButtonUsc runat="server" ID="ButtonUsc7" Text="Small" ComponentSize="small" />
    <usc:ButtonUsc runat="server" ID="ButtonUsc8" Text="Large" ComponentSize="large" />

    <usc:ButtonUsc runat="server" ID="ButtonUsc9" Text="Round" ComponentSize="regular" ComponentStyle="Round"/>
    <usc:ButtonUsc runat="server" ID="ButtonUsc10" Text="Simple" ComponentSize="small" ComponentStyle="Simple"/>
    <usc:ButtonUsc runat="server" ID="ButtonUsc11" Text="Link" ComponentSize="large" ComponentStyle="Link"/>

    <usc:DropdownUsc  ComponentStyle="primary" runat="server" ID="dd_teste2" ReadOnly="true" />
    <usc:DropdownUsc runat="server" ID="dd_teste" />
    <div class="row">
        <usc:CardUsc runat="server" ID="card_control" Text="Testando o Componente Card" Title="O Card" BtnText="Acessar" />
        <usc:CardUsc runat="server" ID="CardUsc1" Text="Testando o Componente Card uma segunda vez" Title="O segundo Card" BtnText="Acessar"  ComponentStyle="primary Round"/>
    </div>
    <div class="form-row">
        <usc:TextBoxUsc runat="server" ID="txt_teste"/>
        <usc:TextBoxUsc runat="server" ID="txt_teste2" />
    </div>
    <usc:TableUsc runat="server" />
    <usc:AlertUsc runat="server" Title="Error" Text="Componente de alerta" />
    <asp:Label ID="lbl_teste" runat="server" Text="Label"></asp:Label>
    <div class="row">
        <usc:BigChartLineUsc runat="server" />
        <usc:ChartBarUsc runat="server" ID="chartBar_control" Text="Up"/>
        <usc:ChartLineUsc runat="server" ID="chartLine_control" Text="Views" />
    </div>
    <div class="row">
        <usc:TableTaskUsc runat="server" />
        <usc:TableSimpleUsc runat="server" />
    </div>

    <usc:LoginUsc  ID="usc_login" runat="server" />
    <usc:LabelUsc runat="server" Text="testando" ForeColor="White" FontSize="15" />
    <usc:TableCustomUsc runat="server" ID="tbl_teste" />"

    <usc:TextInputUsc runat="server" Text="testando componente" Title="Testando" Placeholder="Testando componente novo" />
</asp:Content>
