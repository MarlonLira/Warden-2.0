<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CardUsc.ascx.cs" Inherits="Warden.Components.Common.CardUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<div style="padding-top:10px; padding-right:10px">
<div class="card" style="width: 20rem">
  <img class="card-img-top" src="<%=Help.FormatUrl("/assets/img/exemple.png") %>" alt="Card image cap">
  <div class="card-body">
    <h4 class="card-title"><%=Title%></h4>
    <p class="card-text"><%=Text%></p>
    <a href="#" runat="server" id="btn_control" onServerClick="btn_control_Click"><%=BtnText %></a>
  </div>
</div>
</div>

