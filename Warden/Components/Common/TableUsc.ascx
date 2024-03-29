﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TableUsc.ascx.cs" Inherits="Warden.Components.Common.TableUsc" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Warden.Helper" %>

 <script src="<%=Help.FormatUrl("/assets/js/core/jquery.min.js") %>"></script>

<%if (this.TableColumns != null) {%>
<div class="row mt-5">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
            <div class="toolbar">
                <!--        Here you can write extra buttons/actions for the toolbar              -->
            </div>
            <table id="<%=ComponentId%>" class="table table-striped">
                <thead>
                <tr>
                    <%foreach (TableColumn Column in this.TableColumns) {%>
                        <th><%=Column.Text %></th>
                    <%} %>
                    <th class="sorting_desc_disabled sorting_asc_disabled text-right">Actions</th>
                </tr>
                </thead>
                <tbody>
            <%
                foreach (DataRow Row in this.DataSource.Rows) { %>
                <tr>

                    <% foreach (TableColumn Column in this.TableColumns) { %>
                        <td><%=Convert.ToString(Row[Column.Name])%></td>
                    <%  } %>
                       
                    <td class="text-right">
                        <a href="javascript:void(0)" class="btn btn-link btn-info btn-icon btn-sm like"><i class="tim-icons icon-heart-2"></i></a>
                        <a href="javascript:void(0)" class="btn btn-link btn-warning btn-icon btn-sm edit"><i class="tim-icons icon-pencil"></i></a>
                        <a href="javascript:void(0)" class="btn btn-link btn-danger btn-icon btn-sm remove"><i class="tim-icons icon-simple-remove"></i></a>
                    </td>
                </tr>
                    <%} %>
                
                </tbody>
                <tfoot>
                <tr>
                    <%foreach (TableColumn Column in this.TableColumns) {%>
                        <th><%=Column.Text %></th>
                    <%} %>
                    <th class="disabled-sorting text-right">Actions</th>
                </tr>
                </tfoot>
            </table>
            </div>
            <!-- end content-->
        </div>
        <!--  end card  -->
    </div>
    <!-- end col-md-12 -->
</div>
<%} %>

<script>
    $(document).ready(function() {
        var table1 = $('#<%=ComponentId%>').DataTable({
        "pagingType": "full_numbers",
        "lengthMenu": [
          [10, 25, 50, -1],
          [10, 25, 50, "All"]
        ],
        responsive: true,
        language: {
          search: "_INPUT_",
          searchPlaceholder: "Search records",
        }

        });

        var table = $('#<%=ComponentId%>').DataTable();
       
      // Edit record
        table1.on('click', '.edit', function() {
        $tr = $(this).closest('tr');

            var data = table1.row($tr).data();
            alert('You press on Row: ' + '\'s row.');
      });

      // Delete a record
        table1.on('click', '.remove', function(e) {
        $tr = $(this).closest('tr');
        table1.row($tr).remove().draw();
          e.preventDefault();
          alert('You press on Row: ' + '\'s row.');
      });

      //Like record
        table1.on('click', '.like', function() {
        alert('You clicked on Like button');
      });
    });
  </script>