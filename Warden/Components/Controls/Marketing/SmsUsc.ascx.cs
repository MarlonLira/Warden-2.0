using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI.WebControls;
using Warden.Components.Common;
using Warden.Models;
using Warden.Persistences;
using Warden.Persistences.Marketing;

namespace Warden.Components.Controls
{
    public partial class SmsUsc : BaseControlsUsc
    {
       
        #region Events

        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            VerifyAndLoad();
            
            if (IsDispatch != true) {
                btnEnviar.OnClick += new ButtonUsc.OnClickEvent(BtnEnviar_OnClick);
            } else {
                IsDispatch = false;
            }
            btnPesquisar.OnClick += new ButtonUsc.OnClickEvent(BtnPesquisar_OnClick);
        }

        private void BtnEnviar_OnClick() {
            btnEnviar.OnClick -= new ButtonUsc.OnClickEvent(BtnEnviar_OnClick);
            if (IsDispatch == false) {
                IsDispatch = true;
                Send();
            }
        }

        private void BtnPesquisar_OnClick() {
            //LoadTable();
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

        private void VerifyAndLoad() {
            GatewayPst Gateway = new GatewayPst();
            TypePst Type = new TypePst() {
                Id = 1,
                Name = "SMS"
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

            ddType.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "ShortCode", Value = "1"},
                new ListItem {Text = "LongCode", Value = "2"},
                new ListItem {Text = "Flash", Value = "3"}
            };

            ddCompany.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "Empresa 1", Value = "1"},
                new ListItem {Text = "Empresa 2", Value = "2"},
                new ListItem {Text = "Empresa 3", Value = "3"}
            };

            ddSendType.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "Simples", Value = "1"},
                new ListItem {Text = "Multiplo", Value = "2"}
            };

            ddRecipient.LoadDataSource();
            ddType.LoadDataSource();
            ddCompany.LoadDataSource();
            ddSendType.LoadDataSource();

            ddSendType.SelectedValue = "2";
            ddCompany.Enabled = false;
            ddSendType.Enabled = false;
            ddRecipient.Enabled = false;
            ddRecipient.SelectedValue = "1";

            ddGateway.LoadDataSource(GatewayTable);
        }

        private void Send() {
            DataRow SelectedGateway;
            SmsPst Sms;
            DateTime CurrentDate = DateTime.UtcNow.AddHours(-3);
            Int32 GatewayId = Convert.ToInt32(ddGateway.SelectedValue);
            Int32 SendTypeId = Convert.ToInt32(ddSendType.SelectedValue);
            Int32 TypeId = Convert.ToInt32(ddType.SelectedValue);
            String[] AmountEdit = String.IsNullOrEmpty(txtNumberList.Text) ? null : txtNumberList.Text.Split(';');
            try {
                if (AmountEdit == null || AmountEdit.Length == 0) { throw new Exception("Porfavor informe um número!"); }

                IsDispatch = true;
                Sms = new SmsPst();
                Sms.Title = txtTitle.Text;
                Sms.Text = txtText.Text;
                Sms.Status = "AT";
                Sms.SelectedSendType = SmsPst.SendType.Multiple;
                Sms.RegistrationDate = CurrentDate;
                Sms.SendDate = CurrentDate;
                Sms.Amount = AmountEdit.Length;
                Sms.Credit = 0.7f;
                Sms.Audit = AuthenticatedUser.RegistryCode + " - " + DateTime.UtcNow.AddHours(-3) + " - Enviar";
                Sms.IsFlashSms = TypeId < 3 ? false : true;

                Sms.Gateway = new GatewayPst() { Id = GatewayId };
                SelectedGateway = Sms.Gateway.Search(GatewayId);
                Sms.Gateway.Url = Convert.ToString(SelectedGateway["url"]);
                Sms.Sender = new Sender() {
                    User = Convert.ToString(SelectedGateway["usuario"]),
                    Pass = Convert.ToString(SelectedGateway["senha"])
                };

                Sms.SelectedSendType = (SmsPst.SendType)SendTypeId;
                Sms.SelectedAPI = (SmsPst.APIs)GatewayId;
                Sms.SelectedType = (SmsPst.Type)TypeId;

                Sms.Recipient = new Recipient() {
                    Name = Convert.ToString("Lista"),
                    PhoneNumber = txtNumberList.Text
                };

                Sms.Send();
                ResultEvent =  new ResultEvent("Envio Concluido com Sucesso!");
                ShowMessage.Open("Resultado", "Envio Concluido com Sucesso!");
            } catch (Exception Except) {
                ShowMessage.Open("Error", Except.Message);
                ResultEvent = new ResultEvent(Except.Message);
            }
        }

        private DataTable GetData() {
            // DataTable de teste
            DataTable table = new DataTable();
            table.Columns.Add("Dosage", typeof(int));
            table.Columns.Add("Drug", typeof(string));
            table.Columns.Add("Patient", typeof(string));
            table.Columns.Add("Date", typeof(string));

            // Here we add five DataRows.
            table.Rows.Add(25, "Indocin", "David", DateTime.Now.ToShortDateString());
            table.Rows.Add(50, "Enebrel", "Sam", DateTime.Now.ToShortDateString());
            table.Rows.Add(10, "Hydralazine", "Christoff", DateTime.Now.ToShortDateString());
            table.Rows.Add(21, "Combivent", "Janet", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            return table;
        }

        private void LoadTable() {
            tblSms.TableColumns = new List<BaseTableUsc.TableColumn>() {
                new BaseTableUsc.TableColumn(){ Name = "Dosage", Text ="Dosagem"},
                new BaseTableUsc.TableColumn(){ Name = "Drug", Text ="Remedio"},
                new BaseTableUsc.TableColumn(){ Name = "Patient", Text ="Paciente"},
                new BaseTableUsc.TableColumn(){ Name = "Date", Text ="Data"}
            };

            tblSms.DataSource = GetData();
        }

        #endregion

    }
}