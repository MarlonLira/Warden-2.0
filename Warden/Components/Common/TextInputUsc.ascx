<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextInputUsc.ascx.cs" Inherits="Warden.Components.Common.TextInputUsc" %>

<div class="col-md-<%=Size %> pr-md-1">
    <div class="form-group">
        <label><%=Title %></label>
        <input type="<%=TextMode%>" class="form-control" placeholder="<%=Placeholder %>" value="<%=Text %>" <%=Disabled %> >
    </div>
</div>
