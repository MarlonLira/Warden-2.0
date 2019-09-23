using System;

namespace Warden.Views.Marketing {
    public partial class MessagePge : BasePge {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            VerifyAndLoad();
        }

        public void VerifyAndLoad() {
            String Result = Request.QueryString["page"];
            if (!String.IsNullOrEmpty(Result)) {
                switch (Result.ToUpperInvariant()) {
                    case "SMS": {
                            SmsControl.Visible = true;
                            pnlSms.Visible = true;
                            break;
                        }
                    case "EMAIL": {
                            EmailControl.Visible = true;
                            pnlEmail.Visible = true;
                            break;
                        }
                    case "WHATSAPP": {
                            break;
                        }
                    default: {
                            break;
                        }

                }
            }
        }

    }
}