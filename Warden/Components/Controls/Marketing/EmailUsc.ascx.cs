using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;
using Warden.Components.Common;
using Warden.Models;
using Warden.Persistences;
using Warden.Persistences.Marketing;

namespace Warden.Components.Controls.Marketing {
    public partial class EmailUsc : BaseControlsUsc {

        #region Events

        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            VerifyAndLoad();

            if (IsDispatch != true) {
                btnEnviar.OnClick += new ButtonUsc.OnClickEvent(BtnEnviar_OnClick);
            } else {
                IsDispatch = false;
            }
        }

        private void BtnEnviar_OnClick() {
            btnEnviar.OnClick -= new ButtonUsc.OnClickEvent(BtnEnviar_OnClick);
            if (IsDispatch == false) {
                IsDispatch = true;
                Send();
            }
        }

        #endregion

        #region Atributes

        private DataTable UserTable { get; set; }
        DataTable GatewayTable { get; set; }
        private ModalUsc ShowMessage { get { return mdlControl; } }
        private Boolean IsDispatch {
            get { return Session["IsDispatch"] == null ? false : Convert.ToBoolean(Session["IsDispatch"]); }
            set { Session.Add("IsDispatch", value); }
        }
        #endregion

        #region Methods
        //Temporario
        public void VerifyAndLoad() {
            GatewayPst Gateway = new GatewayPst();
            TypePst Type = new TypePst() {
                Id = 2,
                Name = "EMAIL"
            };

            if (GatewayTable == null) {
                GatewayTable = new DataTable();
                GatewayTable = Gateway.Search(Type);
            }

            ddRecipient.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "Leads", Value = "1"},
                new ListItem {Text = "Visitante", Value = "2"}
            };

            ddCompany.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "Empresa 1", Value = "1"},
                new ListItem {Text = "Empresa 2", Value = "2"},
                new ListItem {Text = "Empresa 3", Value = "3"}
            };

            ddRecipient.LoadDataSource();
            ddCompany.LoadDataSource();
            ddGateway.LoadDataSource(GatewayTable);
            ddRecipient.SelectedValue = "1";
            ddCompany.Enabled = false;
            ddRecipient.Enabled = false;
        }

        private void Send() {
            DataRow SelectedGateway;
            EmailPst Email;
            DateTime CurrentDate = DateTime.UtcNow.AddHours(-3);
            Int32 GatewayId = Convert.ToInt32(ddGateway.SelectedValue);
            String[] AmountEdit = String.IsNullOrEmpty(txtEmailList.Text) ? null : txtEmailList.Text.Split(';');
            try {
                if (AmountEdit == null || AmountEdit.Length == 0) { throw new Exception("Porfavor Informe um email!"); }


                IsDispatch = true;
                Email = new EmailPst();
                Email.Title = txtTitle.Text;
                Email.Text = txtText.Text;
                Email.Status = "AT";
                Email.RegistrationDate = CurrentDate;
                Email.SendDate = CurrentDate;
                Email.Amount = AmountEdit.Length;
                Email.Credit = 0.7f;
                Email.Audit = AuthenticatedUser.RegistryCode + " - " + DateTime.UtcNow.AddHours(-3) + " - Enviar";

                Email.Gateway = new GatewayPst() { Id = GatewayId };
                SelectedGateway = Email.Gateway.Search(GatewayId);
                Email.Gateway.Url = Convert.ToString(SelectedGateway["url"]);

                Email.Sender = new Sender() {
                    User = Convert.ToString(SelectedGateway["usuario"]),
                    Pass = Convert.ToString(SelectedGateway["senha"]),
                    Email = Convert.ToString(SelectedGateway["token"])
                };

                String[] ServicePart = Convert.ToString(SelectedGateway["url"]).Split('|');
                Email.Service = new Service() {
                    Host = ServicePart[0],
                    Port = Convert.ToInt32(ServicePart[1])

                };

                Email.Recipient = new Recipient() {
                    Name = Convert.ToString("Lista"),
                    Email = txtEmailList.Text
                };

                Email.Send();

                ShowMessage.OpenModal("Resultado", "Envio Concluido com Sucesso!");
            } catch (Exception Except) {
                ShowMessage.OpenModal("Error", Except.Message);
            } 
        }

        #endregion

    }
}