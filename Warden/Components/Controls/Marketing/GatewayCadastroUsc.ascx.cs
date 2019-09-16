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
            btnGatewayRegister.OnClick += new Common.ButtonUsc.OnClickEvent(BtnGatewayRegister_OnClick);
            btnBack.OnClick += new Common.ButtonUsc.OnClickEvent(BtnBack_OnClick);
        }

        private void BtnBack_OnClick() {
            Session.Add("GatewayRegister", true);
        }

        private void BtnGatewayRegister_OnClick() {
            Session.Add("GatewayRegister", true);
        }

        public Boolean Visibled { set { this.pnlControl.Visible = value; } }
        public Boolean Enabled { set { this.pnlControl.Enabled = value; } }


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