<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropdownUsc.ascx.cs" Inherits="Warden.Components.Common.DropdownUsc" %>
<%@ Import Namespace="Warden.Helper" %>

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
                <li><a class="dropdown-item" href="#"><%=item %></a></li>
            <%} %>
 
      <%   } %>
  </div>
</div>

<script src="<%=Help.FormatUrl("/assets/js/core/jquery.min.js") %>"></script>
<script src="<%=Help.FormatUrl("/assets/js/core/popper.min.js")%>"></script>
<script src="<%=Help.FormatUrl("/assets/js/core/bootstrap.min.js")%>"></script>


<script type="text/javascript">
$('.dropdown-toggle').click(function(e) {
    e.preventDefault();
    e.stopPropagation();

    return false;
});
$('.dropdown-menu').click(function(e) {
    e.preventDefault();
    e.stopPropagation();

    return false;
});
 $(document).ready(function () {
         $('.dropdown-toggle').dropdown();
     });

</script>
