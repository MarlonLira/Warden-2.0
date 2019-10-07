<%@ Control Language="C#" CodeBehind="GatewayCadastroUsc.ascx.cs" Inherits="Warden.Components.Controls.Marketing.GatewayCadastroUsc" %>

<usc:ModalUsc runat="server" ComponentId="mdl_gateway_cadastro" ID="mdlControl" Title="Resultado"/>

<asp:Panel ID="pnlControl" runat="server">

    <div class="card" style="padding-left:15px; padding-top:15px; padding-bottom:15px">
        <usc:LabelUsc runat="server" Text="Cadastro de Gateway" Bold="true"  FontSize="15"/>
    </div>

        <div class="col-lg-14 col-md-24">
            <div class="card">
                <div class="card-body">
                    <usc:LabelUsc runat="server" Text="Gateway" Bold="true"  FontSize="15"/>
                    <div style="padding-top:10px;padding-bottom:10px">
                        <div class="row">
                            <usc:TextInputUsc runat="server" Title="Nome" ID="txtName" Size="6" />
                            <usc:TextInputUsc runat="server" Title="Token" ID="txtToken" Size="6" />
                            <usc:TextInputUsc runat="server" Title="Usuario" ID="txtUser" Size="6" />
                            <usc:TextInputUsc runat="server" Title="Senha" ID="txtPass" Size="6" />
                            <usc:TextInputUsc runat="server" Title="Url" ID="txtUrl" Size="6" />
                            <usc:TextInputUsc runat="server" Title="Port" ID="txtPort" Size="6" Visible="false"/>
                        </div>

                        <div style="padding-left:5px; padding-right:5px;padding-top:10px; padding-bottom:10px">
                            <usc:LabelUsc runat="server" Text="Tipo" ID="lblType" Bold="true" FontSize="10" />
                            <usc:DropdownUsc runat="server" ID="ddType" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Panel>
