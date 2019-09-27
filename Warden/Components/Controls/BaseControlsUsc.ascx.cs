using System;
using Warden.Components.Common;
using Warden.Models;

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
        public ResultEvent ResultEvent {
            get { return Session["ResultEvent"] != null ? (ResultEvent)Session["ResultEvent"] : null; }
            set { Session.Add("ResultEvent", value); }
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