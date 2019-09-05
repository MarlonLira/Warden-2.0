using System;

namespace Warden.Components.Common {
    public partial class TextInputUsc : BaseTextUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public override String Text {
            get { return txt_control.Value; }
        }

        public override void LoadDataSource() {
            base.LoadDataSource();

            if (!String.IsNullOrEmpty(TextMode)) {
                txt_control.Attributes.Add("type", TextMode);
            }

            if (!String.IsNullOrEmpty(Placeholder)) {
                txt_control.Attributes.Add("placeholder", Placeholder);
            }
        }
    }
}