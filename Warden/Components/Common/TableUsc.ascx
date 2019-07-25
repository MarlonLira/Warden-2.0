<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TableUsc.ascx.cs" Inherits="Warden.Components.Common.TableUsc" %>

<table class="table" id="tbl_control">
    <thead>
        <tr>
            <th class="text-center">#</th>
            <th>Name</th>
            <th>Job Position</th>
            <th>Since</th>
            <th class="text-right">Salary</th>
            <th class="text-right">Actions</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td class="text-center">1</td>
            <td>Andrew Mike</td>
            <td>Develop</td>
            <td>2013</td>
            <td class="text-right">&euro; 99,225</td>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" class="btn btn-info btn-sm btn-icon">
                    <i class="tim-icons icon-single-02"></i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-success btn-sm btn-icon">
                    <i class="tim-icons icon-settings"></i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-danger btn-sm btn-icon">
                    <i class="tim-icons icon-simple-remove"></i>
                </button>
            </td>
        </tr>
        <tr>
            <td class="text-center">2</td>
            <td>John Doe</td>
            <td>Design</td>
            <td>2012</td>
            <td class="text-right">&euro; 89,241</td>
            <td class="td-actions text-right">
              <button type="button" rel="tooltip" class="btn btn-info btn-sm btn-round btn-icon">
                  <i class="tim-icons icon-single-02"></i>
              </button>
              <button type="button" rel="tooltip" class="btn btn-success btn-sm btn-round btn-icon">
                  <i class="tim-icons icon-settings"></i>
              </button>
              <button type="button" rel="tooltip" class="btn btn-danger btn-sm btn-round btn-icon">
                  <i class="tim-icons icon-simple-remove"></i>
              </button>
            </td>
        </tr>
        <tr>
            <td class="text-center">3</td>
            <td>Alex Mike</td>
            <td>Design</td>
            <td>2010</td>
            <td class="text-right">&euro; 92,144</td>
            <td class="td-actions text-right">
                <button type="button" rel="tooltip" class="btn btn-info btn-link btn-icon btn-sm">
                    <i class="tim-icons icon-single-02"></i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-success btn-link btn-icon btn-sm">
                    <i class="tim-icons icon-settings"></i>
                </button>
                <button type="button" rel="tooltip" class="btn btn-danger btn-link btn-icon btn-sm">
                    <i class="tim-icons icon-simple-remove"></i>
                </button>
            </td>
        </tr>
    </tbody>
</table>

