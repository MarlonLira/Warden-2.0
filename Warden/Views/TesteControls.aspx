<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="TesteControls.aspx.cs" Inherits="Warden.Views.TesteControls" %>
<asp:Content ID="ctt_teste2" ContentPlaceHolderID="cph_main" runat="server">

    <div class="content">
        <div class="row">
          <usc:UserProfileUsc runat="server" />
          <usc:userAvatarUsc runat="server" />
        </div>
      </div>
</asp:Content>
