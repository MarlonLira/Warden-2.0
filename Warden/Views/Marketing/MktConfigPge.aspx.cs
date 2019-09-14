using System;
using System.Collections.Generic;
using System.Data;
using Warden.Components.Common;
using Warden.Persistences;

namespace Warden.Views.Marketing {
    public partial class MktConfigPge : BasePge{
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            LoadTable();
        }

        private void LoadTable() {
            GatewayPst Gateway = new GatewayPst();
            DataTable GatewayTable = Session["GatewayTable"] == null ? Gateway.Search() : (DataTable)Session["GatewayTable"];
            
            tblMktConfig.TableColumns = new List<BaseTableUsc.TableColumn>() {
                new BaseTableUsc.TableColumn(){ Name = "nome", Text ="Nome"},
                new BaseTableUsc.TableColumn(){ Name = "usuario", Text ="Usuario"},
                new BaseTableUsc.TableColumn(){ Name = "senha", Text ="Senha"},
                new BaseTableUsc.TableColumn(){ Name = "saldo", Text ="Saldo"}
            };

            if (Session["GatewayTable"] == null) {
                Session.Add("GatewayTable", GatewayTable);
            }
            
            tblMktConfig.DataSource = GatewayTable;
        }
    }
}