using System;
using System.Data;
using System.Web.UI.WebControls;
using Warden.Interfaces;
using Warden.Persistences;
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
            Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
        }

        private void BtnGatewayRegister_OnClick() {
            Session.Add("GatewayRegister", true);
            Register();
            Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
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

        private void Register() {
            GatewayPst Gateway;
            try {

                Gateway = new GatewayPst();
                Gateway.Audit = "SALVAR";
                Gateway.Credit = 0;
                Gateway.Name = txtName.Text;
                Gateway.Pass = txtPass.Text;
                Gateway.Token = txtToken.Text;
                ListItem listItem = ddType.SelectedItem;
                Gateway.Type = new TypePst() {Id = Convert.ToInt32(ddType.SelectedValue), Name = ddType.Text };
                Gateway.Save();

            } catch (Exception Except) {

            }
        }
    }
}