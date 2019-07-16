<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextBoxUsc.ascx.cs" Inherits="Warden.Components.Common.TextBoxUsc" %>

<asp:Panel ID="pnl_control" runat="server">
    <div style="padding-left:10px; padding-top:10px">
        <label for="exampleInputEmail1"><b><%=Title %></b></label>
        <%if (!IsTextArea) { %>
            <input type="email" class="form-control" id="<%=ComponentId %>" aria-describedby="emailHelp" placeholder="Enter Text" title="<%=Text %>" style="color:slategray" >
        <%} else {%>
            <textarea rows="3" cols="30" class="form-control" id="<%=ComponentId %>" aria-describedby="emailHelp" placeholder="Enter text" title="<%=Text %>" style="color:slategray" ></textarea>
        <%} %>
        <small id="emailHelp" class="form-text text-muted"><%=HelpText %></small>
    </div>
</asp:Panel>