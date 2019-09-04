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
            <a data-toggle="collapse" href="#pagesExamples">
              <i class="tim-icons icon-image-02"></i>
              <p>
                Marketing
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="pagesExamples">
              <ul class="nav">
                <li>
                  <a href="#">
                    <span class="sidebar-mini-icon">P</span>
                    <span class="sidebar-normal"> Pricing </span>
                  </a>
                </li>
                <li>
                  <a href="<%=Help.FormatUrl("/Views/Marketing/MessagePge.aspx") %>">
                    <span class="sidebar-mini-icon">MK</span>
                    <span class="sidebar-normal"> Mensagens </span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li>
          <li>
            <a data-toggle="collapse" href="#pagesExamples">
              <i class="tim-icons icon-image-02"></i>
              <p>
                Pages
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="pagesExamples">
              <ul class="nav">
                <li>
                  <a href="#">
                    <span class="sidebar-mini-icon">P</span>
                    <span class="sidebar-normal"> Pricing </span>
                  </a>
                </li>
                <li>
                  <a href="<%=Help.FormatUrl("/Views/Marketing/MessagePge.aspx") %>">
                    <span class="sidebar-mini-icon">MK</span>
                    <span class="sidebar-normal"> Marketing </span>
                  </a>
                </li>
                <li>
                  <a href="<%=Help.FormatUrl("/Views/Teste.aspx") %>">
                    <span class="sidebar-mini-icon">T</span>
                    <span class="sidebar-normal"> Testes </span>
                  </a>
                </li>
                <li>
                  <a href="<%=Help.FormatUrl("/Login.aspx") %>">
                    <span class="sidebar-mini-icon">L</span>
                    <span class="sidebar-normal"> Login </span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <span class="sidebar-mini-icon">R</span>
                    <span class="sidebar-normal"> Register </span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <span class="sidebar-mini-icon">LS</span>
                    <span class="sidebar-normal"> Lock Screen </span>
                  </a>
                </li>
                <li>
                  <a href="<%=Help.FormatUrl("/Views/TesteControls.aspx") %>">
                    <span class="sidebar-mini-icon">UP</span>
                    <span class="sidebar-normal"> User Profile </span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li>
            <a data-toggle="collapse" href="#mapsExamples">
              <i class="tim-icons icon-pin"></i>
              <p>
                Maps
                <b class="caret"></b>
              </p>
            </a>
            <div class="collapse" id="mapsExamples">
              <ul class="nav">
                <li>
                  <a href="<%=Help.FormatUrl("/Views/TesteMap.aspx") %>">
                    <span class="sidebar-mini-icon">GM</span>
                    <span class="sidebar-normal"> Google Maps </span>
                  </a>
                </li>
              </ul>
            </div>
          </li>
          <li>
            <a href="<%=Help.FormatUrl("/Views/CalendarTeste.aspx") %>">
              <i class="tim-icons icon-time-alarm"></i>
              <p>Calendar</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
