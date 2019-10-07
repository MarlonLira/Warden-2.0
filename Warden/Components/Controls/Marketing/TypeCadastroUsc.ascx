<%@ Control Language="C#" CodeBehind="TypeCadastroUsc.ascx.cs" Inherits="Warden.Components.Controls.Marketing.TypeCadastroUsc" %>

<asp:Panel ID="pnlControl" runat="server">

    <div class="card" style="padding-left:15px; padding-top:15px; padding-bottom:15px">
        <usc:LabelUsc runat="server" Text="Cadastro do Tipo de Gateway" Bold="true"  FontSize="15"/>
    </div>

        <div class="col-lg-14 col-md-24">
            <div class="card">
                <div class="card-body">
                    <usc:LabelUsc runat="server" Text="Gateway" Bold="true"  FontSize="15"/>
                    <div style="padding-top:10px;padding-bottom:10px">
                        <div class="row">
                            <usc:TextInputUsc runat="server" Title="Nome" ID="txtName" Size="6" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Panel>