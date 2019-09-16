<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="MktConfigPge.aspx.cs" Inherits="Warden.Views.Marketing.MktConfigPge" %>
<asp:Content ID="cttMktConfig" ContentPlaceHolderID="cph_main" runat="server">

    <div class="row">
        <div class="col-lg-6 col-md-12">
                <div class="card">
                    <div class="card-body">
                        <usc:LabelUsc Text ="Gateways" Bold="true" FontSize="15" runat="server" ID="lblGateway"/>
                        <usc:TableUsc runat="server"  ComponentId="tblMktControl"  ID="tblMktConfig"/>
                        <usc:GatewayCadastroUsc runat="server" ComponentId="gtwCadastro" ID="gtwCadastro" visible="false"/>
                        <usc:ButtonUsc runat="server" ID="btnGatewayRegister" Text="Cadastrar" />
                    </div>
                </div>
            </div>

        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-body">
                    <usc:LabelUsc Text ="Tipos" Bold="true" FontSize="15" runat="server" ID="lblType"/>
                    <usc:TableUsc runat="server"  ComponentId="tbltypeControl"  ID="tblTypeConfig"/>
                    <usc:ButtonUsc runat="server" ID="btnTypeRegister" Text="Cadastrar" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
