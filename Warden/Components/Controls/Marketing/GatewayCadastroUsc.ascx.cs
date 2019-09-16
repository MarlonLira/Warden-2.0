using System;
using System.Data;
using Warden.Persistences.Marketing;

namespace Warden.Components.Controls.Marketing
{
    public partial class GatewayCadastroUsc : BaseControlsUsc
    {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            VerifyAndLoad();
        }

        private void VerifyAndLoad() {
            TypePst Type = new TypePst();
            DataTable TypeTable = Session["TypeTable"] == null ? Type.Search() : (DataTable)Session["TypeTable"];

            if (Session["TypeTable"] == null) {
                Session.Add("TypeTable", TypeTable);
            }

            ddType.LoadDataSource(TypeTable);
        }
    }
}