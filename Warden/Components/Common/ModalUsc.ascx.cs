using System;
using System.Web.UI;

namespace Warden.Components.Common {
    public partial class ModalUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public void OpenModal() {
            if (!String.IsNullOrEmpty(ComponentId)) {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), ComponentId, "$(function() {openModal();});", true);
            }
        }
    }
}