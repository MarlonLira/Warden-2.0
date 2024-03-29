﻿<%@ Control Language="C#" CodeBehind="EmailUsc.ascx.cs" Inherits="Warden.Components.Controls.Marketing.EmailUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<usc:ModalUsc runat="server" ComponentId="mdl_email" ID="mdlControl" Title="Resultado"/>

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
                        <usc:TextAreaUsc runat="server" Placeholder="Escreva a mensagem aqui!" Title="Mensagem" Size="8" ID="txtText"/>
                        <usc:TextAreaUsc runat="server" Placeholder="Escreva aqui a lista de emails só se for usar" Title="Lista de Emails" Size="8" ID="txtEmailList"/>
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
                            <usc:LabelUsc runat="server" Text="Destinatario" ID="lblRecipient" Bold="true"  FontSize="10" />
                            <usc:DropdownUsc runat="server" ID="ddRecipient" />
                        </div>

                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px; align-content:stretch">
                            <usc:LabelUsc runat="server" Text="Unidade" ID="lblCompany" Bold="true"  FontSize="10" />
                            <usc:DropdownUsc runat="server" ID="ddCompany" />
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
                    <usc:TableUsc runat="server"  ComponentId="tblEmailControl"  ID="tblEmail"/>
                    <usc:ButtonUsc runat="server" ID="btnPesquisar" Text="Pesquisar" />
                    <usc:ButtonUsc runat="server" ID="btnEnviar" Text="Enviar"/>
                    <usc:ButtonUsc runat="server" ID="btnCancelar" Text="Cancelar" />
                </div>
            </div>
        </div>
    </div>