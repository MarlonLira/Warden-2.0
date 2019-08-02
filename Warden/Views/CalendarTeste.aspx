<%@ Page Title="" Language="C#" MasterPageFile="~/WebMst.Master" AutoEventWireup="true" CodeBehind="CalendarTeste.aspx.cs" Inherits="Warden.Views.CalendarTeste" %>
<%@ Import Namespace="Warden.Helper" %>
<asp:Content ID="ctt_teste5" ContentPlaceHolderID="cph_main" runat="server">
    <usc:CssUsc runat="server" ID="css_control" />
    <usc:CalendarCssUsc runat="server" />

    <div class="content">
        <div class="row">
          <div class="col-md-10 ml-auto mr-auto">
            <div class="card card-calendar">
              <div class="card-body">
                <div id="fullCalendar"></div>
              </div>
            </div>
          </div>
        </div>
      </div>

     <usc:JsUsc runat="server" ID="js_control" />
    <usc:CalendarJsUsc runat="server" />
    <script src="<%=Help.FormatUrl("/assets/js/calendar/calendar2.js") %>" type="text/javascript"></script>

    <script>
        $(document).ready(function() {
          demo.initFullCalendar();
    });
  </script>
</asp:Content>
