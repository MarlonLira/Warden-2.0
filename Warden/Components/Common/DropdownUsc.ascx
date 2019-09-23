<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DropdownUsc.ascx.cs" Inherits="Warden.Components.Common.DropdownUsc" %>

<asp:Panel runat="server" ID="pnlControl">
    <asp:DropDownList ID="dd_control" runat="server" OnSelectedIndexChanged="dd_control_SelectedIndexChanged" AutoPostBack="True">
    </asp:DropDownList>
</asp:Panel>


