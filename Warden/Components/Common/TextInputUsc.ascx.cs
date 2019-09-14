using System;

namespace Warden.Components.Common {
    public partial class TextInputUsc : BaseTextUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public override String Text {
            get {
                return String.IsNullOrEmpty(txt_control.Value) ? txt_control2.Value : txt_control.Value;
            }
        }

        public Boolean IsIcon { get; set; }
        public String Icon {
            set { icon_control.Attributes.Add("class", GetIcon(value)); }
        }

        private String GetIcon(String Icon) {
            String Result = "";

            switch (Icon.ToUpperInvariant()) {
                case "EMAIL": {
                        Result = "tim-icons icon-email-85";
                        break;
                    }
                case "PASSWORD": {
                        Result = "tim-icons icon-lock-circle";
                        break;
                    }
            }

            return Result;
        }

        public override void LoadDataSource() {
            base.LoadDataSource();

            if (!String.IsNullOrEmpty(TextMode)) {
                txt_control.Attributes.Add("type", TextMode);
                txt_control2.Attributes.Add("type", TextMode);
            }

            if (!String.IsNullOrEmpty(Placeholder)) {
                txt_control.Attributes.Add("placeholder", Placeholder);
                txt_control2.Attributes.Add("placeholder", Placeholder);
            }
        }
    }
}