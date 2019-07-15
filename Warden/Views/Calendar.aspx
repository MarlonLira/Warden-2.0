<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="Warden.Views.Calendar" %>
<%@ Import Namespace="Warden.Helper" %>

<!DOCTYPE html">
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Language" content="pt-br">
    <title>Calendario</title>
    <usc:CssUsc runat="server" ID="css_control" />
    <usc:CalendarCssUsc runat="server" />
</head>
<body>
    <form id="frm_calendar" runat="server" class="wrapper" >
        <asp:ScriptManager ID="spt_calendar" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <usc:SidebarUsc runat="server" />
        
        <div class="main-panel">
            <div class="content">
                <div id="calendar">
                </div>

                <div id="updatedialog" title="Atualizar ou Apagar Evento" style="text-align:left">
                    <div class="style1">
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc1" ComponentId="eventName" Title="Testando"/>
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc6" ComponentId="eventDesc" Title="Descrição" IsTextArea="true"/>
                        <label class="alignRight" title="Inicio: "> Inicio: <span class="alignLeft" id="eventStart"></span></label>
                        <label class="alignRight" title="Final: ">Final: <span class="alignLeft" id="eventEnd"></span></label>
                        <input type="hidden" id="eventId"/>
                    </div>
                </div>
                
                <div id="addDialog" title="Adicionar Evento" style="text-align:left">
                    <div class="style1">
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc3" ComponentId="addEventName" Title="Nome"/>
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc2" ComponentId="addEventDesc" Title="Descrição" IsTextArea="true"/>
                        <label class="alignRight" title="Inicio: "> Inicio: <span class="alignLeft" id="addEventStartDate"></span></label>
                        <label class="alignRight" title="Final: ">Final: <span class="alignLeft" id="addEventEndDate"></span></label>
                    </div>
                </div>
                <div runat="server" id="jsonDiv" />
                <input type="hidden" id="hdClient" runat="server" />
            </div>
        </div>
    </form>
    <usc:FooterUsc runat="server" />
    <usc:JsUsc runat="server" ID="js_control" />
    <usc:CalendarJsUsc runat="server" />
</body>
</html>
