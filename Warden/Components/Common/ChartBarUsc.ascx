<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChartBarUsc.ascx.cs" Inherits="Warden.Components.Common.ChartBarUsc" %>
<%@ Import Namespace="Warden.Helper" %>

<div class="col-lg-4">
    <div class="card card-chart">
        <div class="card-header">
            <h5 class="card-category">Daily Sales</h5>
            <h3 class="card-title"><i class="tim-icons icon-delivery-fast text-info"></i> 3,500€</h3>
        </div>
        <div class="card-body">
            <div class="chart-area">
                <canvas id="CountryChart1"></canvas>
            </div>
        </div>
    </div>
</div>

<script src="<%=Help.FormatUrl("/assets/js/plugins/chartjs.min.js")%>"></script>
<script type="text/javascript">
type = ['primary', 'info', 'success', 'warning', 'danger'];
var blue = "#1f8ef1";
var green = "#00d6b4";
var pink = "#d048b6";
var red = "#52170b"

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

    var ctx = document.getElementById("CountryChart1").getContext("2d");

    var gradientStroke = ctx.createLinearGradient(0, 230, 0, 50);

    gradientStroke.addColorStop(1, 'rgba(29,140,248,0.2)');
    gradientStroke.addColorStop(0.4, 'rgba(29,140,248,0.0)');
    gradientStroke.addColorStop(0, 'rgba(29,140,248,0)'); //blue colors


    var myChart = new Chart(ctx, {
        type: 'bar',
        responsive: true,
        legend: {
            display: false
        },
        data: {
            labels: <%=Titles%>,
            datasets: [{
                label: <%=Labels%>,
                fill: true,
                backgroundColor: gradientStroke,
                hoverBackgroundColor: gradientStroke,
                borderColor: '#1f8ef1',
                borderWidth: 2,
                borderDash: [],
                borderDashOffset: 0.0,
                data: <%=Values%>,
            }]
        },
        options: gradientChartConfiguration
    });

</script>