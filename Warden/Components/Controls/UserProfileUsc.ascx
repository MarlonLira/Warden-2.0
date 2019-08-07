<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserProfileUsc.ascx.cs" Inherits="Warden.Components.Controls.UserProfileUsc" %>

<div class="col-md-8">
    <div class="card">
        <div class="card-header">
            <usc:LabelUsc Text="Perfil" FontSize="9" runat="server" Bold="true"/>
        </div>
        <div class="card-body">
            <form>
                <div class="row">
                    <usc:TextInputUsc runat="server" Text="Creative Code Inc." Title="Company (disabled)" Placeholder="Company" Size="5" IsDisabled="true"/>
                    <usc:TextInputUsc runat="server" Text="michael23" Title="Username" Placeholder="Username" Size="3" IsDisabled="false" Type="text"/>
                    <usc:TextInputUsc runat="server" Text="mike@email.com" Title="Email address" Placeholder="email" Size="4" Type="email"/>
                </div>
                <div class="row">
                    <usc:TextInputUsc runat="server" Text="Mike" Title="First Name" Placeholder="First Name" Size="6" Type="text"/>
                    <usc:TextInputUsc runat="server" Text="Andrew" Title="Last Name" Placeholder="Last Name" Size="6" Type="text"/>
                </div>
                <div class="row">
                    <usc:TextInputUsc runat="server" Text="Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09" Title="Address" Placeholder="Home Address" Size="12" Type="text"/>
                </div>
                <div class="row">
                    <usc:TextInputUsc runat="server" Text="NewYork" Title="City" Placeholder="City" Size="4" Type="text"/>
                    <usc:TextInputUsc runat="server" Text="EUA" Title="Country" Placeholder="Country" Size="4" Type="text"/>
                    <usc:TextInputUsc runat="server" Text="54180070" Title="Postal Code" Placeholder="ZIP Code" Size="4" Type="text"/>
                </div>
                <div class="row">
                    <usc:TextAreaUsc runat="server" Text="Lamborghini Mercy, Your chick she so thirsty, I'm in that two seat Lambo." Placeholder="Here can be your description" Title="About Me" Size="8" />
                </div>
            </form>
        </div>
        <div class="card-footer">
            <usc:ButtonUsc Text="Editar" runat="server" />
        </div>
    </div>
</div>