<%@ Control Language="C#" CodeBehind="TextInputUsc.ascx.cs" Inherits="Warden.Components.Common.TextInputUsc" %>

<%if (!IsIcon) { %>
<div class="col-md-<%=Size %> pr-md-1">
    <div class="form-group">
        <%if (!String.IsNullOrEmpty(Title)) { %>
        <label><%=Title %></label>
        <% }%>
        <input runat="server" id="txt_control"  class="form-control" />
    </div>
</div>
<%} %>

<%else if(IsIcon){ %>
<div class="input-group">
    <div class="input-group-prepend">
        <div class="input-group-text">
            <i class="tim-icons icon-email-85" runat="server" id="icon_control"></i>
        </div>
    </div>
    <input class="form-control" placeholder="Email" id="txt_control2" runat="server">
</div>
<%} %>

