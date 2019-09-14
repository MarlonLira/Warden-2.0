<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginUsc.ascx.cs" Inherits="Warden.Components.Controls.LoginUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<div class="card" style="width: 20rem;">
    <img class="card-img-top" src="<%=Help.FormatUrl("/assets/img/exemple.png") %>" alt="Card image cap">
    <div class="card-body">
        <div class="card-body px-lg-10 py-lg-10">
            <div class="text-center text-muted mb-4">
                <small>Login</small>
            </div>
            <div role="form" runat="server">
                <div class="form-group mb-3">
                    <usc:TextInputUsc ID="txt_email" runat="server" Placeholder="CPF"/>
                </div>
                <div class="form-group">
                    <usc:TextInputUsc ID="txt_password" runat="server" Placeholder="Senha" TextMode="password"/>
                </div>
                <div class="custom-control custom-control-alternative custom-checkbox">
                    <input class="custom-control-input" id=" customCheckLogin" type="checkbox">
                    <label class="custom-control-label" for=" customCheckLogin">
                        <span>Remember me</span>
                    </label>
                    <usc:ButtonUsc ID="btnLogin" runat="server" Text="Confirmar"/>
                    <usc:ButtonUsc ID="BtnTeste" runat="server" Text="Testar" />
                </div>
                
                <div class="text-center">
                    <br />
                    
                      
                </div>
            </div>
        </div>
    </div>
</div>
