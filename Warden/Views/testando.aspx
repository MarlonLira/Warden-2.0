<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testando.aspx.cs" Inherits="Warden.Views.testando" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <usc:CssUsc runat="server" ID="css_control" />
</head>
<body>
    
    <usc:CardUsc runat="server" ID="card_control" Text="Testando o Componente Card" Title="O Card" BtnText="Acessar" />
        <usc:CardUsc runat="server" ID="CardUsc1" Text="Testando o Componente Card uma segunda vez" Title="O segundo Card" BtnText="Acessar"  ComponentStyle="primary Round"/>
    <usc:JsUsc runat="server" ID="js_control" />
</body>
</html>
