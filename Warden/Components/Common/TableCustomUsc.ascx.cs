using System;

namespace Warden.Components.Common {
    public partial class TableCustomUsc : BaseTableUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            if (!IsPostBack) {
                if (!String.IsNullOrEmpty(HtmlDataSource)) {
                    tbl_control.Text = HtmlDataSource;
                }
            }
        }
    }
}