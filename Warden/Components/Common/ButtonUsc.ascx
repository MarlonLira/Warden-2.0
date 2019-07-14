<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ButtonUsc.ascx.cs" Inherits="Warden.Components.Common.ButtonUsc" %>

<button 
    id="btn_control"
    runat="server"
    onServerClick="btn_control_Click"
    >
    <%=Text %>
</button>

<!-- infos
    
    --Types--

    Default
    Round
    Simple
    Link

    --Sizes--
    Small
    Large
    Regular
    

    --Class--

<button class="btn btn-primary">Default</button>

<button class="btn btn-primary btn-round">Round</button>

<button class="btn btn-primary btn-round">
<i class="tim-icons icon-heart-2"></i> With Icon
</button>

<button class="btn btn-primary btn-fab btn-icon btn-round">
<i class="tim-icons icon-heart-2"></i>
</button>

<button class="btn btn-primary btn-simple">Simple</button>

<button class="btn btn-primary btn-link">Link</button>
    
-->