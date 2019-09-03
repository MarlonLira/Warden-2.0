using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Warden.Components.Common;
using Warden.Models;
using Warden.Persistences;

namespace Warden.Views.Marketing {
    public partial class MessagePge : BasePge {

        private DataTable UserTable { get; set; }
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            Loading();
            btnPesquisar.OnClick += new ButtonUsc.OnClickEvent(BtnPesquisar_OnClick);
        }

        private void BtnPesquisar_OnClick() {
            LoadTable();
        }

        private void Enviar() {
            SmsPst Sms;
            try {
                Sms = new SmsPst();
                Sms.Title = txtTitle.Text;
                Sms.Text = txtText.Text;
                Sms.Status = "AT";

                foreach (DataRow Row in UserTable.Rows) {
                    Sms.Recipient = new Recipient() {
                        Name = Convert.ToString(Row["name"]),
                        PhoneNumber = Convert.ToString(Row["PhoneNumber"])
                    };

                    Sms.Send();
                }

            } catch (Exception Except) {

            }
        }

        public void Loading() {
            ddRecipient.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "Aluno", Value = "1"},
                new ListItem {Text = "Visitante", Value = "2"}
            };

            ddType.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "SMS", Value = "1"},
                new ListItem {Text = "Email", Value = "2"},
                new ListItem {Text = "WhatsApp", Value = "3"}
            };

            ddCompany.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "Empresa 1", Value = "1"},
                new ListItem {Text = "Emrpesa 2", Value = "2"},
                new ListItem {Text = "Emrpesa 3", Value = "3"}
            };

            ddRecipient.LoadDataSource();
            ddType.LoadDataSource();
            ddCompany.LoadDataSource();
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
            tblMessage.TableColumns = new List<BaseTableUsc.TableColumn>() {
                new BaseTableUsc.TableColumn(){ Name = "Dosage", Text ="Dosagem"},
                new BaseTableUsc.TableColumn(){ Name = "Drug", Text ="Remedio"},
                new BaseTableUsc.TableColumn(){ Name = "Patient", Text ="Paciente"},
                new BaseTableUsc.TableColumn(){ Name = "Date", Text ="Data"}
            };

            tblMessage.DataSource = GetData();
        }
    }
}