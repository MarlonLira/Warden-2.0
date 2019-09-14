using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Warden.Components.Common;

namespace Warden.Components.Controls
{
    public partial class BaseControlsUsc : BaseUsc
    {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
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