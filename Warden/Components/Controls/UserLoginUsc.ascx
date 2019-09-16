<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserLoginUsc.ascx.cs" Inherits="Warden.Components.Controls.UserLoginUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<div class="wrapper wrapper-full-page ">
    <div class="full-page login-page ">
      <!--   you can change the color of the filter page using: data-color="blue | purple | green | orange | red | rose " -->
      <div class="content">
        <div class="container">
          <div class="col-lg-4 col-md-6 ml-auto mr-auto">
            <form class="form">
              <div class="card card-login card-white">
                <div class="card-header">
                  <img src="<%=Help.FormatUrl("/assets/img/card-black.png") %>" alt="">
                  <h1 class="card-title">Log in</h1>
                </div>
                <div class="card-body">
                    <usc:TextInputUsc Placeholder="Email" ComponentStyle="form-control" ID="txtEmail" Type="text" runat="server" IsIcon="true" Icon="Email" />
                    <usc:TextInputUsc Placeholder="Password" ComponentStyle="form-control" ID="txtPassword" Type="password" runat="server" IsIcon="true" Icon="Password" />
                  
                </div>
                <div class="card-footer">
                    <usc:ButtonUsc runat="server" Text="Confirmar" ComponentSize="large" ComponentStyle="block mb-3"  ID="btnConfirm"/>
                  <div class="pull-left">
                    <h6>
                      <a href="javascript:void(0)" class="link footer-link">Criar Conta</a>
                    </h6>
                  </div>
                  <div class="pull-right">
                    <h6>
                      <a href="javascript:void(0)" class="link footer-link">Precisa de Ajuda?</a>
                    </h6>
                  </div>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
</div>