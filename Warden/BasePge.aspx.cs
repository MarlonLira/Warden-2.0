using System;
using System.Web.UI;
using Warden.Models;
using Warden.Persistences;
using Warden.Persistences.Administration;

namespace Warden {
    public partial class BasePge : Page {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            /*UserPst Teste = new UserPst() {
                Name = "Administrator",
                Id = 1,
                Email = "Admin",
                Pass = "000000",
                Status = "AT",
                RegistryCode = "000.111.333-44"
            };*/

            //Session.Add("User", Teste);
            UserVerify();
        }

        public ResultEvent ResultEvent {
            get { return Session["ResultEvent"] != null ? (ResultEvent)Session["ResultEvent"] : null; }
            set { Session.Add("ResultEvent", value); }
        }

        private UserPst UserLogin {
            get {
                object Result = Session["User"] == null ? null : Session["User"];
                return (UserPst)Result;
            }
        }

        public DbConnect DbConnect { get; set; }

        public void ShowException(String Error) {
            mdl_control_error = new Components.Common.ModalUsc();
            mdl_control_error.Text = Error;
            mdl_control_error.Title = "Error";
            mdl_control_error.OpenModal();
        }

        public void UserVerify() {
            if (UserLogin == null) {
                Response.Redirect("~/Login.aspx", false);
            }
        }

    }
}