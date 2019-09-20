using System;
using System.Data;
using System.Web.UI;
using Warden.Components.Common;
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

        private ModalUsc ShowMessage { get { return mdlControl; } }
        private Boolean IsRegister {
            get { return Session["IsRegister"] == null ? false : Convert.ToBoolean(Session["IsRegister"]); }
            set { Session.Add("IsRegister", value); }
        }

       private Boolean GatewayRegister {
            get { return Session["GatewayRegister"] == null ? false : Convert.ToBoolean(Session["GatewayRegister"]); }
            set { Session.Add("GatewayRegister", value); }
        }

        private void BtnBack_OnClick() {
            GatewayRegister = true;
            Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
        }

        private void BtnGatewayRegister_OnClick() {
            GatewayRegister = true;
            if (!IsRegister) {
                Register();
            }
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
            IsRegister = true;
            try {

                Gateway = new GatewayPst();
                Gateway.Status = "AT";
                Gateway.Audit = "SALVAR";
                Gateway.Url = txtUrl.Text;
                Gateway.Credit = 0;
                Gateway.Name = txtName.Text;
                Gateway.Pass = txtPass.Text;
                Gateway.User = txtUser.Text;
                Gateway.Token = String.IsNullOrEmpty(txtToken.Text) ? "SEM TOKEN" : txtToken.Text;
                Gateway.Type = new TypePst() {Id = Convert.ToInt32(ddType.SelectedValue), Name = ddType.Text };
               
                if (!String.IsNullOrEmpty(txtUser.Text)) {
                    Gateway.Save();
                }
                
                ShowMessage.OpenModal("Resultado", "Cadastro Realizado com Sucesso!");

            } catch (Exception Except) {
                ShowMessage.OpenModal("Error", Except.Message);
            } finally {
                btnGatewayRegister = null;
                Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
            }
        }
    }
}