<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="MktConfigPge.aspx.cs" Inherits="Warden.Views.Marketing.MktConfigPge" %>
<asp:Content ID="cttMktConfig" ContentPlaceHolderID="cph_main" runat="server">

    <div class="row">
        <div class="col-lg-6 col-md-12">
                <div class="card">
                    <div class="card-body">
                        <usc:LabelUsc Text ="Gateways" Bold="true" FontSize="15" runat="server"/>
                        <usc:TableUsc runat="server"  ComponentId="tblMktControl"  ID="tblMktConfig"/>
                        <usc:ButtonUsc runat="server" ID="btnGatewayCadastrar" Text="Cadastrar" />
                    </div>
                </div>
            </div>

        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-body">
                    <usc:LabelUsc Text ="Empresas" Bold="true" FontSize="15" runat="server"/>
                    <usc:TableUsc runat="server"  ComponentId="tblEmpControl"  ID="tblEmpConfig"/>
                    <usc:ButtonUsc runat="server" ID="btnEmpresaCadastrar" Text="Cadastrar" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
