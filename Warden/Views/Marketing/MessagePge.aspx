<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" CodeBehind="MessagePge.aspx.cs" Inherits="Warden.Views.Marketing.MessagePge" %>
<%@ Import Namespace="Warden.Helper" %>


<asp:Content ID="cttMessage" ContentPlaceHolderID="cph_main" runat="server">

    <usc:ModalUsc runat="server" ComponentId="mdl_control" ID="mdlControl" Title="Resultado"/>
    <asp:Panel Visible="false" runat="server" ID="pnlSms">
        <usc:SmsUsc runat="server" ID="SmsControl" Visible="false" />
    </asp:Panel>
    <asp:Panel Visible="false" runat="server" ID="pnlEmail">
        <usc:EmailUsc runat="server" ID="EmailControl" Visible="false" />
    </asp:Panel>
    <%if (ResultEvent != null) {
            AlertResult.Text = ResultEvent.Text;
       %>

    <usc:AlertUsc ID="AlertResult" runat="server" Title="Resultado" Text="Aguardando..."/>
    <%} %>
</asp:Content>
