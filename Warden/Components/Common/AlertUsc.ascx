<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlertUsc.ascx.cs" Inherits="Warden.Components.Common.AlertUsc" %>

<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=Title %></strong> <%=Text %>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <i class="tim-icons icon-simple-remove"></i>
  </button>
</div>

