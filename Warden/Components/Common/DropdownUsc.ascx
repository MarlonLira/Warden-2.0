<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropdownUsc.ascx.cs" Inherits="Warden.Components.Common.DropdownUsc" %>


<div class="btn-group">
  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Action
  </button>
  <div class="dropdown-menu" id="dd_control" runat="server">
      <%
          String[] Itens = new String[] { "Action", "Another action", "Something else here","divider" ,"Separated link" };

          foreach (String item in Itens) {

              if (item.ToLowerInvariant() == "divider") {
              %>
                <div class="dropdown-divider"></div>
            <%} else { %>
                <a class="dropdown-item" href="#"><%=item %></a>
            <%} %>
 
      <%   } %>
  </div>
</div>

