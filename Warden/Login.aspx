<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Warden.Login" %>
<%@ Import Namespace="Warden.Helper" %>

<asp:Content ID="ctt_login" ContentPlaceHolderID="cph_main" runat="server">
    <usc:LoginUsc  ID="usc_login" runat="server" />
</asp:Content>
