using System;
using System.Web.UI;
using Warden.Persistences;

namespace Warden {
    public partial class BasePge : Page {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public DbConnect DbConnect { get; set; }

        public void ShowException(String Error) {
            mdl_control_error = new Components.Common.ModalUsc();
            mdl_control_error.Text = Error;
            mdl_control_error.Title = "Error";
            mdl_control_error.OpenModal();
        }

    }
}