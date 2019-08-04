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
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="tim-icons icon-email-85"></i>
                      </div>
                    </div>
                    <input type="text" class="form-control" placeholder="Email">
                  </div>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <div class="input-group-text">
                        <i class="tim-icons icon-lock-circle"></i>
                      </div>
                    </div>
                    <input type="text" placeholder="Password" class="form-control">
                  </div>
                </div>
                <div class="card-footer">
                    <usc:ButtonUsc runat="server" Text="Confirmar" ComponentSize="large" ComponentStyle="block mb-3" />
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