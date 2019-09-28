using System;

namespace Warden.Components.Common {
    public partial class AlertUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }
        public Boolean Visible {
            get { return PnlControl.Visible; }
            set { this.PnlControl.Visible = value; }
        }
    }
}