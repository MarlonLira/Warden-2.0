using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Warden.Persistences;

namespace Warden.Components.Controls {
    public partial class MainUsc : BaseControlsUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            LoadAndVerify();
        }

        private void LoadAndVerify() {
            SmsPst Sms = new SmsPst();
            try {

                ListItem Column = new ListItem() {Text = "gateway_nome", Value = "quantidade" };

                chartLineControl.LoadDataSource(Sms.Search());
            } catch {
                throw;
            }
        }
    }
}