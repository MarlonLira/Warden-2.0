using System;
using System.Collections.Generic;
using System.Data;
using Warden.Components.Common;
using Warden.Persistences;
using Warden.Persistences.Marketing;

namespace Warden.Views.Marketing {
    public partial class MktConfigPge : BasePge{
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            LoadTable();
            btnGatewayRegister.OnClick += new ButtonUsc.OnClickEvent(BtnGatewayRegister_OnClick);
        }

        private void BtnGatewayRegister_OnClick() {
            gtwCadastro.Visible = true;
            gtwCadastro.Visibled = true;
            gtwCadastro.Enabled = true;
            tblMktConfig.Visible = false;
            btnGatewayRegister.Visible = false;
            lblGateway.Visible = false;
        }

        public Boolean IsGatewayRegister {
            get { return Session["GatewayRegister"] == null ? false : Convert.ToBoolean(Session["GatewayRegister"]);}
        }

        private void LoadTable() {
            GatewayPst Gateway = new GatewayPst();
            TypePst Type = new TypePst();
            DataTable GatewayTable = Session["GatewayTable"] == null ? Gateway.Search() : (DataTable)Session["GatewayTable"];
            DataTable TypeTable = Session["TypeTable"] == null ? Type.Search() : (DataTable)Session["TypeTable"];

            tblMktConfig.TableColumns = new List<BaseTableUsc.TableColumn>() {
                new BaseTableUsc.TableColumn(){ Name = "nome", Text ="Nome"},
                new BaseTableUsc.TableColumn(){ Name = "usuario", Text ="Usuario"},
                new BaseTableUsc.TableColumn(){ Name = "senha", Text ="Senha"},
                new BaseTableUsc.TableColumn(){ Name = "saldo", Text ="Saldo"},
                new BaseTableUsc.TableColumn(){Name = "tipo_nome", Text = "Tipo"}
            };

            tblTypeConfig.TableColumns = new List<BaseTableUsc.TableColumn>() {
                new BaseTableUsc.TableColumn(){ Name = "id", Text ="ID"},
                new BaseTableUsc.TableColumn(){ Name = "nome", Text ="Nome"},
                new BaseTableUsc.TableColumn(){ Name = "status", Text ="Status"}
            };

            if (Session["GatewayTable"] == null) {
                Session.Add("GatewayTable", GatewayTable);
            }

            if (Session["TypeTable"] == null) {
                Session.Add("TypeTable", TypeTable);
            }
            
            if (IsGatewayRegister) {
                gtwCadastro.Visible = false;
                gtwCadastro.Visibled = false;
                gtwCadastro.Enabled = false;
                tblMktConfig.Visible = true;
                btnGatewayRegister.Visible = true;
                lblGateway.Visible = true;
                Session["GatewayRegister"] = null;
                Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
                
            }

            tblTypeConfig.DataSource = TypeTable;
            tblMktConfig.DataSource = GatewayTable;
        }
    }
}