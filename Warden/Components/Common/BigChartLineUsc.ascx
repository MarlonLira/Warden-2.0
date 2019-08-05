<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BigChartLineUsc.ascx.cs" Inherits="Warden.Components.Common.BigChartLineUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<div class="col-12">
    <div class="card card-chart">
        <div class="card-header ">
            <div class="row">
                <div class="col-sm-6 text-left">
                    <h5 class="card-category">Total Shipments</h5>
                    <h2 class="card-title">Performance</h2>
                </div>
                <div class="col-sm-6">
                    <div class="btn-group btn-group-toggle float-right" data-toggle="buttons">
                        <label class="btn btn-sm btn-default btn-simple active" id="0">
                            <input type="radio" name="options" checked>
                            <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block" >Accounts</span>
                            <span class="d-block d-sm-none">
                                <i class="tim-icons icon-single-02"></i>
                            </span>
                        </label>
                        <label class="btn btn-sm btn-default btn-simple" id="1">
                            <input type="radio" class="d-none d-sm-none" name="options">
                            <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block">Purchases</span>
                            <span class="d-block d-sm-none">
                                <i class="tim-icons icon-gift-2"></i>
                            </span>
                        </label>
                        <label class="btn btn-sm btn-default btn-simple" id="2">
                            <input type="radio" class="d-none" name="options">
                            <span class="d-none d-sm-block d-md-block d-lg-block d-xl-block">Sessions</span>
                            <span class="d-block d-sm-none">
                                <i class="tim-icons icon-tap-02"></i>
                            </span>
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <div class="card-body">
        <div class="chart-area">
            <canvas id="chartBig2"></canvas>
        </div>
        </div>
    </div>
</div>

<script src="<%=Help.FormatUrl("/assets/js/core/jquery.min.js") %>"></script>
<script src="<%=Help.FormatUrl("/assets/js/plugins/chartjs.min.js")%>"></script>
<script type="text/javascript">
type = ['primary', 'info', 'success', 'warning', 'danger'];
var blue = "#1f8ef1";
var green = "#00d6b4";
var pink = "#d048b6";
var red = "#52170b";

    

    gradientChartConfiguration = {
        maintainAspectRatio: false,
        legend: {
            display: false
        },

        tooltips: {
            backgroundColor: '#f5f5f5',
            titleFontColor: '#333',
            bodyFontColor: '#666',
            bodySpacing: 4,
            xPadding: 12,
            mode: "nearest",
            intersect: 0,
            position: "nearest"
        },
        responsive: true,
        scales: {
            yAxes: [{

                gridLines: {
                    drawBorder: false,
                    color: 'rgba(29,140,248,0.1)',
                    zeroLineColor: "transparent",
                },
                ticks: {
                    suggestedMin: 60,
                    suggestedMax: 120,
                    padding: 20,
                    fontColor: "#9e9e9e"
                }
            }],

            xAxes: [{

                gridLines: {
                    drawBorder: false,
                    color: 'rgba(29,140,248,0.1)',
                    zeroLineColor: "transparent",
                },
                ticks: {
                    padding: 20,
                    fontColor: "#9e9e9e"
                }
            }]
        }
    };

   
    var chart_labels = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];
    var chart_data = [100, 70, 90, 70, 85, 60, 75, 60, 90, 80, 110, 150];


    var ctx = document.getElementById("chartBig2").getContext('2d');

    var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

      gradientStroke.addColorStop(1, 'rgba(29,140,248,0.2)');
      gradientStroke.addColorStop(0.4, 'rgba(29,140,248,0.0)');
      gradientStroke.addColorStop(0, 'rgba(29,140,248,0)'); //purple colors
    var config = {
      type: 'line',
      data: {
        labels: chart_labels,
        datasets: [{
          label: "Views",
          fill: true,
          backgroundColor: gradientStroke,
          borderColor: blue,
          borderWidth: 2,
          borderDash: [],
          borderDashOffset: 0.0,
          pointBackgroundColor: blue,
          pointBorderColor: 'rgba(255,255,255,0)',
          pointHoverBackgroundColor: blue ,
          pointBorderWidth: 20,
          pointHoverRadius: 4,
          pointHoverBorderWidth: 15,
          pointRadius: 4,
          data: chart_data,
        }]
      },
      options: gradientChartConfiguration
    };

    var ChartData = new Chart(ctx, config);
    $("#0").click(function() {
      var data = ChartData.config.data;
      data.datasets[0].data = chart_data;
      data.labels = chart_labels;
      ChartData.update();
    });
    $("#1").click(function() {
      var chart_data = [80, 120, 105, 110, 95, 105, 90, 100, 80, 95, 70, 120];
      var data = ChartData.config.data;
      data.datasets[0].data = chart_data;
      data.labels = chart_labels;
      ChartData.update();
    });

    $("#2").click(function() {
      var chart_data = [60, 80, 65, 130, 80, 105, 90, 130, 70, 115, 60, 130];
      var data = ChartData.config.data;
      data.datasets[0].data = chart_data;
      data.labels = chart_labels;
      ChartData.update();
    });

</script>