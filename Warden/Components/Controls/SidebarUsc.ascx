<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SidebarUsc.ascx.cs" Inherits="Warden.Components.Controls.SidebarUsc" %>
<%@ Import Namespace="Warden.Helper" %>
    
<div class="sidebar" data="blue">
      <!--
        Tip 1: You can change the color of the sidebar using: data-color="blue | green | orange | red"
    -->
      <div class="sidebar-wrapper">
        <div class="logo">
          <a href="javascript:void(0)" class="simple-text logo-mini">
            Wn
          </a>
          <a href="javascript:void(0)" class="simple-text logo-normal">
            Warden
          </a>
        </div>
        <ul class="nav">
          <li class="active">
            <a href="<%=Help.FormatUrl("/Default.aspx") %>">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Dashboard</p>
            </a>
          </li>
            <li>
            <a data-toggle="collapse" href="#marketing">
              <i class="tim-icons icon-image-02"></i>
              <p>
                Marketing
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="marketing">
              <ul class="nav">
                  <usc:MenuButtonUsc runat="server" ID="mnuPricing" Url="#" Text="Princing" SmallText="PG" />
                  <usc:MenuButtonUsc runat="server" ID="mnuSms" Url="/Views/Marketing/MessagePge.aspx?page=sms" Text="SMS" SmallText="SMS" />
                  <usc:MenuButtonUsc runat="server" ID="mnuEmail" Url="/Views/Marketing/MessagePge.aspx?page=email" Text="EMAIL" SmallText="EML" />
              </ul>
            </div>
          </li>
        </ul>
      </div>
    </div>
