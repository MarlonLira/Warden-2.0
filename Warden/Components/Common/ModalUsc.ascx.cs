using System;
using System.Web.UI;

namespace Warden.Components.Common {
    public partial class ModalUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        #region Constructor

        public ModalUsc() { }
        public ModalUsc(String Title, String Text, String Component) {
            this.Text = Text;
            this.Title = Title;
            this.ComponentId = Component;
        }

        #endregion

        #region Methods

        public void OpenModal() {
            if (!String.IsNullOrEmpty(ComponentId)) {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), ComponentId, "$(function() {openModal();});", true);
            }
        }

        public void OpenModal(String Title, String Text, String Component) {
            this.Text = Text;
            this.Title = Title;

            if (!String.IsNullOrEmpty(Component)) {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), Component, "$(function() {openModal();});", true);
            }
        }

        public void OpenModal(String Title, String Text) {
            this.Text = Text;
            this.Title = Title;

            if (!String.IsNullOrEmpty(ComponentId)) {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), ComponentId, "$(function() {openModal();});", true);
            }
        }

        #endregion
    }
}