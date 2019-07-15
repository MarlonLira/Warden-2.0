<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="Warden.Views.Calendar" %>
<%@ Import Namespace="Warden.Helper" %>

<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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

                <div id="updatedialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 50px;"
                    title="Atualizar ou Apagar Evento">

                    <div class="style1">
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc1" ComponentId="eventName" Title="Testando"/>
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc6" ComponentId="eventDesc" Title="Descrição" IsTextArea="true"/>
                        
                        <label class="alignRight" title="Inicio: "> Inicio: <span class="alignLeft" id="eventStart"></span></label>
                        <label class="alignRight" title="Final: ">Final: <span class="alignLeft" id="eventEnd"></span></label>
                        
                        
                        <input type="hidden" id="eventId"/>
                    </div>
                </div>
                <div id="addDialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 50px;" title="Adicionar Evento">
                    <div class="style1">
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc3" ComponentId="addEventName" Title="Nome"/>
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc2" ComponentId="addEventDesc" Title="Descrição" IsTextArea="true"/>
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc4" ComponentId="addEventStartDate" Title="Inicio"/>
                        <usc:TextBoxUsc runat="server" ID="TextBoxUsc5" ComponentId="addEventEndDate" Title="Final"/>
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
