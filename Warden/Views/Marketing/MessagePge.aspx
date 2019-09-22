<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="MessagePge.aspx.cs" Inherits="Warden.Views.Marketing.MessagePge" %>
<%@ Import Namespace="Warden.Helper" %>

<asp:Content ID="cttMessage" ContentPlaceHolderID="cph_main" runat="server">
    <usc:ModalUsc runat="server" ComponentId="mdl_control" ID="mdlControl" Title="Resultado"/>
    <asp:Panel Visible="false" runat="server" ID="pnlSms">
        <usc:SmsUsc runat="server" ID="Sms_control" Visible="false" />
    </asp:Panel>
</asp:Content>
