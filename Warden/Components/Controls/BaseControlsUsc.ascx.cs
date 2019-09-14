using System;
using Warden.Components.Common;

namespace Warden.Components.Controls {
    public partial class BaseControlsUsc : BaseUsc
    {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            if (Session["User"] == null) {
                this.Visible = false;
            } else {
                this.Visible = true;
            }
        }

        public ModalUsc Message {
            get {
                if (this.mdlBaseControl == null) { this.mdlBaseControl = new ModalUsc(); }
                return this.mdlBaseControl;
            }
            set { this.mdlBaseControl = value; }
        }
    }
}