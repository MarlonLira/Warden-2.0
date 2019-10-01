<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlertUsc.ascx.cs" Inherits="Warden.Components.Common.AlertUsc" %>

<asp:Panel ID="PnlControl" runat="server">
    <div class="alert alert-info alert-dismissible fade show" role="alert">
      <strong><%=Title %></strong> <%=Text %>
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <i class="tim-icons icon-simple-remove"></i>
      </button>
    </div>
</asp:Panel>

<!--
    alert-info == blue
    alert-dark == black
    alert-primary == pink
    alert-secondary == white
    alert == transparent
    alert-danger == lightpink
    alert-warning == orange
    alert-light == lightgrey
    alert-success == green
    -->