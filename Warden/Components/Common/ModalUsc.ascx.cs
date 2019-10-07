using System;
using System.Web.UI;

namespace Warden.Components.Common {
    public partial class ModalUsc : BaseUsc {

        #region Constructor

        public ModalUsc() { }
        public ModalUsc(String Title, String Text, String Component) {
            this.Text = Text;
            this.Title = Title;
            this.ComponentId = Component;
        }

        #endregion

        #region Methods

        public void Open() {
            if (!String.IsNullOrEmpty(ComponentId)) {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), ComponentId, "$(function() {Open();});", true);
            }
        }

        public void Open(String Title, String Text, String Component) {
            this.Text = Text;
            this.Title = Title;

            if (!String.IsNullOrEmpty(Component)) {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), Component, "$(function() {Open();});", true);
            }
        }

        public void Open(String Title, String Text) {
            this.Text = Text;
            this.Title = Title;

            if (!String.IsNullOrEmpty(ComponentId)) {
                ScriptManager.RegisterStartupScript(this, GetType(), Guid.NewGuid().ToString(), "$('#"+ ComponentId +"').modal('show');", true);
            }
        }

        #endregion
    }
}