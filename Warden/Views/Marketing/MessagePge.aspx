<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="MessagePge.aspx.cs" Inherits="Warden.Views.Marketing.MessagePge" %>

<%@ Import Namespace="Warden.Helper" %>
<asp:Content ID="cttMessage" ContentPlaceHolderID="cph_main" runat="server">
    <div class="card" style="padding-left:15px; padding-top:15px; padding-bottom:15px">
        <usc:LabelUsc runat="server" Text="Envio de Mensagens" Bold="true"  FontSize="15"/>
    </div>
    <div class="row mt-5">
        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-body">
                    <usc:LabelUsc runat="server" Text="Mensagem" Bold="true"  FontSize="15"/>
                    <div style="padding-top:10px;padding-bottom:10px">
                        <usc:TextInputUsc runat="server" Title="Titulo" ID="txtTitle" Size="4" Text="teste" />
                        <usc:TextAreaUsc runat="server" Placeholder="Escreva a mensagem aqui!" Title="Mensagem" Size="8" ID="txtText" Text="Teste"/>
                        <usc:TextAreaUsc runat="server" Placeholder="Escreva aqui a lista de números só se for usar" Title="Lista de Números" Size="8" ID="txtNumberList" Text="81983460962"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-body" >
                    <usc:LabelUsc runat="server" Text="Filtros de Busca" FontSize="15"  Bold="true"/>
                    <div class="row" style="justify-content:center">
                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px">
                            <usc:LabelUsc runat="server" Text="Tipo" ID="lblType" Bold="true"  FontSize="10" />
                            <usc:DropdownUsc runat="server" ID="ddType" />
                        </div>

                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px">
                            <usc:LabelUsc runat="server" Text="Destinatario" ID="lblRecipient" Bold="true"  FontSize="10" />
                            <usc:DropdownUsc runat="server" ID="ddRecipient" />
                        </div>

                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px; align-content:stretch">
                            <usc:LabelUsc runat="server" Text="Unidade" ID="lblCompany" Bold="true"  FontSize="10" />
                            <usc:DropdownUsc runat="server" ID="ddCompany" />
                        </div>

                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px; align-content:stretch">
                            <usc:LabelUsc runat="server" Text="Tipo de Envio" ID="lblSendType" Bold="true"  FontSize="10" />
                            <usc:DropdownUsc runat="server" ID="ddSendType" />
                        </div>

                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px; align-content:stretch">
                            <usc:LabelUsc runat="server" Text="Gateway" ID="lblGateway" Bold="true"  FontSize="10" />
                            <usc:DropdownUsc runat="server" ID="ddGateway" />
                        </div>
                    </div>
                    <div class="row" style="justify-content:center">
                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px">
                            <usc:LabelUsc runat="server" Text="Data Inicial" ID="LabelUsc1" Bold="true"  FontSize="10" />
                            <usc:TextInputUsc runat="server" TextMode="date" ID="txtDataInicial"  Size="20"/>
                        </div>
                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px">
                            <usc:LabelUsc runat="server" Text="Data Final" ID="LabelUsc2" Bold="true"  FontSize="10" />
                            <usc:TextInputUsc runat="server" TextMode="date" ID="txtDataFinal"  Size="20"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-md-12">
            <div class="card">
                <div class="card-body">
                    <usc:TableUsc runat="server"  ComponentId="tableControl2"  ID="tblMessage"/>
                    <usc:ButtonUsc runat="server" ID="btnPesquisar" Text="Pesquisar" />
                    <usc:ButtonUsc runat="server" ID="btnEnviar" Text="Enviar" />
                    <usc:ButtonUsc runat="server" ID="btnCancelar" Text="Cancelar" />
                </div>
            </div>
        </div>
    </div>
    
    

</asp:Content>
