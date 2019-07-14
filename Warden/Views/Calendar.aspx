<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calendar.aspx.cs" Inherits="Warden.Views.Calendar" %>
<%@ Import Namespace="Warden.Helper" %>

<!DOCTYPE html">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <usc:CssUsc runat="server" ID="css_control" />
    <usc:CalendarCssUsc runat="server" />
    
</head>
<body>
    <form id="frm_calendar" runat="server" class="wrapper">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>
        <usc:SidebarUsc runat="server" />
        
        <div class="main-panel">
            <div class="content">
                <div id="calendar">
                </div>

                <div id="updatedialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 50px;"
                    title="Update or Delete Event">
                    <table cellpadding="0" class="style1">
                        <tr>
                            <td class="alignRight">
                                name:</td>
                            <td class="alignLeft">
                                <input id="eventName" type="text" /><br /></td>
                        </tr>
                        <tr>
                            <td class="alignRight">
                                description:</td>
                            <td class="alignLeft">
                                <textarea id="eventDesc" cols="30" rows="3" ></textarea></td>
                        </tr>
                        <tr>
                            <td class="alignRight">
                                start:</td>
                            <td class="alignLeft">
                                <span id="eventStart"></span></td>
                        </tr>
                        <tr>
                            <td class="alignRight">
                                end: </td>
                            <td class="alignLeft">
                                <span id="eventEnd"></span><input type="hidden" id="eventId" /></td>
                        </tr>
                    </table>
                </div>
                <div id="addDialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 50px;" title="Add Event">
                <table cellpadding="0" class="style1">
                        <tr>
                            <td class="alignRight">
                                name:</td>
                            <td class="alignLeft">
                                <input id="addEventName" type="text" size="50" /><br /></td>
                        </tr>
                        <tr>
                            <td class="alignRight">
                                description:</td>
                            <td class="alignLeft">
                                <textarea id="addEventDesc" cols="30" rows="3" ></textarea></td>
                        </tr>
                        <tr>
                            <td class="alignRight">
                                start:</td>
                            <td class="alignLeft">
                                <span id="addEventStartDate" ></span></td>
                        </tr>
                        <tr>
                            <td class="alignRight">
                                end:</td>
                            <td class="alignLeft">
                                <span id="addEventEndDate" ></span></td>
                        </tr>
                    </table>
        
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
