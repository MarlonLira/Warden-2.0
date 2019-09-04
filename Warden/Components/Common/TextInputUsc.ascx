<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextInputUsc.ascx.cs" Inherits="Warden.Components.Common.TextInputUsc" %>

<div class="col-md-<%=Size %> pr-md-1">
    <div class="form-group">
        <%if (!String.IsNullOrEmpty(Title)) { %>
        <label><%=Title %></label>
        <% }%>
        <input runat="server" id="txt_control"  class="form-control" />
    </div>
</div>
