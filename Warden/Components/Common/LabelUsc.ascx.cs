using System;
using System.Web.UI.WebControls;

namespace Warden.Components.Common {
    public partial class LabelUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public new String Text {
            get { return this.lbl_control.Text; }
            set { this.lbl_control.Text = value; }
        }
        public Boolean Bold { set { this.lbl_control.Font.Bold = value; } }
        public String ForeColor { set { lbl_control.Style.Add("Color", value); } }
        public String BackColor { set { lbl_control.Style.Add("BackColor", value); } }
        public Int32 FontSize { set { lbl_control.Font.Size = new FontUnit(value); } }
    }
}