<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TextAreaUsc.ascx.cs" Inherits="Warden.Components.Common.TextAreaUsc" %>

<div class="col-md-<%=Size %> pr-md-1">
    <div class="form-group">
        <label><%=Title %></label>
        <textarea rows="<%=Rows %>" cols="<%=Cols %>" class="form-control" <%=Disabled %> placeholder="<%=Placeholder %>" > <%=Text %> </textarea>
    </div>
</div>