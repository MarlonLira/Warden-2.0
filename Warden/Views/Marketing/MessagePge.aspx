<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" CodeBehind="MessagePge.aspx.cs" Inherits="Warden.Views.Marketing.MessagePge" %>
<%@ Import Namespace="Warden.Helper" %>

<asp:Content ID="cttMessage" ContentPlaceHolderID="cph_main" runat="server">
    
    <asp:Panel Visible="false" runat="server" ID="pnlSms">
        <usc:SmsUsc runat="server" ID="SmsControl" Visible="false" />
    </asp:Panel>
    <asp:Panel Visible="false" runat="server" ID="pnlEmail">
        <usc:EmailUsc runat="server" ID="EmailControl" Visible="false" />
    </asp:Panel>

    <%if (ResultEvent != null) {
            AlertResult.Text = ResultEvent.Text;
       %>
        <div style="margin: -175px; margin-left:1px; float:left" class="col-lg-6 col-md-12">
            <usc:AlertUsc ID="AlertResult" runat="server" Title="Resultado:"/>
        </div>
    <%}
        if (!String.IsNullOrEmpty(AlertResult.Text) && !IsPostBack) {
            ResultEvent = null;
        }
        %>
</asp:Content>


