<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="JsUsc.ascx.cs" Inherits="Warden.Components.Styles.JsUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<!--   Core JS Files   -->
<script src="<%=Help.FormatUrl("/assets/js/core/jquery.min.js") %>"></script>
<script src="<%=Help.FormatUrl("/assets/js/core/popper.min.js")%>"></script>
<script src="<%=Help.FormatUrl("/assets/js/core/bootstrap.min.js")%>"></script>
<script src="<%=Help.FormatUrl("/assets/js/core/sidebar.js")%>"></script>
<script src="<%=Help.FormatUrl("/assets/js/plugins/perfect-scrollbar.jquery.min.js")%>"></script>

<!--  Google Maps Plugin    -->
<!-- Place this tag in your head or just before your close body tag. -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCsl60c0tt8gzuglZxUALA0T89NWavDGI0"></script>

<!-- Chart JS -->
<script src="<%=Help.FormatUrl("/assets/js/plugins/chartjs.min.js")%>"></script>

<!--  Notifications Plugin    -->
<script src="<%=Help.FormatUrl("/assets/js/plugins/bootstrap-notify.js")%>"></script>

<!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
<script src="<%=Help.FormatUrl("/assets/js/black-dashboard.min.js?v=1.0.0")%>"></script>
<script src="<%=Help.FormatUrl("/assets/demo/demo.js")%>"></script>

<script>
    $(document).ready(function() {
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

    });
</script>
