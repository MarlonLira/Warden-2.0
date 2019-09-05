using System;

namespace Warden.Views.Marketing {
    public partial class MessagePge : BasePge {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            VerifyAndLoad();
        }

        public void VerifyAndLoad() {
            String Result = Request.QueryString["page"];

            switch (Result) {
                case "SMS": {
                        Sms_control.Visible = true;
                        break;
                    }
                case "EMAIL": {
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