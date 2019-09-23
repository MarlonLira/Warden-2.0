using System;
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

                ListItem Column = new ListItem() {
                    Text = "mes",
                    Value = "quantidade_total"
                };

                chartLineControl.LoadDataSource(Sms.SearchAmount(), Column);
            } catch {
                throw;
            }
        }
    }
}