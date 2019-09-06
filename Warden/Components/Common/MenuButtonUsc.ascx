<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuButtonUsc.ascx.cs" Inherits="Warden.Components.Common.MenuButtonUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<li>
    <a href="<%=Help.FormatUrl(Url) %>">
        <span class="sidebar-mini-icon"><%=SmallText %></span>
        <span class="sidebar-normal"> <%=Text %> </span>
    </a>
</li>