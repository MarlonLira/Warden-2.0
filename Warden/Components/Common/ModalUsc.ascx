<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModalUsc.ascx.cs" Inherits="Warden.Components.Common.ModalUsc" %>

<div class="modal fade" id="<%=ComponentId%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><%=Title%></h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <i class="tim-icons icon-simple-remove"></i>
                </button>
            </div>
            <asp:UpdatePanel ID="updPainel2" runat="server" UpdateMode="Conditional" >
                <ContentTemplate>
                    <div class="modal-body">
                    <%=Text%>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-primary">Ok</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    function openModal() {
        $('#<%=ComponentId%>').modal('show');
    }
</script>