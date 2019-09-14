using System;
using Warden.Components.Common;

namespace Warden.Components.Controls
{
    public partial class LoginUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            btnLogin.OnClick += new ButtonUsc.OnClickEvent(BtnLogin_OnClick1);
            
        }

        private void BtnLogin_OnClick1() {
            throw new NotImplementedException();
        }

        public Boolean IsUser { get; set; }
        private void BtnLogin_OnClick() {
            IsUser = LoginVerify();
        }

        public Boolean LoginVerify() {
            Boolean Result = false;
            if (!String.IsNullOrEmpty(txt_email.Text)) {
                if (txt_email.Text.ToUpperInvariant() =="ADMIN") {
                    if (txt_password.Text == "Root1526") {
                        Session.Add("User", "ADMIN");
                        Result = true;
                    } else {
                        Result = false;
                    }
                }
            } else {
                Result = false;
            }
            return Result;
        }

        protected void btnLogin_OnClick1() {
            LoginVerify();
        }
    }
}