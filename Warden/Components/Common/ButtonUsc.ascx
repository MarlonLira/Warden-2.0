<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ButtonUsc.ascx.cs" Inherits="Warden.Components.Common.ButtonUsc" %>

<button
    class="<%=LoadButtonStyle() %>"
    onServerClick="btn_control_Click"
    >
    <%=Text %>
</button>