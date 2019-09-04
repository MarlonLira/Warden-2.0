<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="MessagePge.aspx.cs" Inherits="Warden.Views.Marketing.MessagePge" %>
<%@ Import Namespace="Warden.Helper" %>

<asp:Content ID="cttMessage" ContentPlaceHolderID="cph_main" runat="server">
    <usc:SmsUsc runat="server" ID="Sms_control" />
</asp:Content>
