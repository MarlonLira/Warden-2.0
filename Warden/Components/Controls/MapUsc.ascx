<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MapUsc.ascx.cs" Inherits="Warden.Components.Controls.MapUsc" %>

<div class="content">
    <div class="row">
        <div class="col-md-12">
        <div class="card card-plain">
            <div class="card-header">
                Google Maps
            </div>
            <div class="card-body">
            <div id="map" class="map"></div>
            </div>
        </div>
        </div>
    </div>
</div>

<script type="text/javascript">
      (function () {
        var mapOptions = {
          center: new google.maps.LatLng(-15.768466,-47.929459),
          zoom: 8,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map"),
            mapOptions);
      })
</script>