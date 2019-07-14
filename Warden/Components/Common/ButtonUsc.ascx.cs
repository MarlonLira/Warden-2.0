using System;

namespace Warden.Components.Common {
    public partial class ButtonUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            CheckBtnText();
        }

        public delegate void OnClickEvent();
        public event OnClickEvent OnClick;

        public String LoadButtonStyle() {
            String BtnStyle = "";
            if (String.IsNullOrEmpty(ComponentStyle)) {
                ComponentStyle = "DEFAULT";
            }

            switch (ComponentStyle.ToUpper()) {
                case "DEFAULT": {
                    BtnStyle = "btn btn-primary";
                    break;
                }
            }

            return BtnStyle;
        }

        public void CheckBtnText() {
            if (String.IsNullOrEmpty(Text)) {
                Text = "Button";
            }
        }

        protected void btn_control_Click(object sender, EventArgs e) {
            try {
                if (OnClick != null) {
                    OnClick();
                }
            } catch (Exception Except) {
                throw new Exception(Except.Message);
            }
        }
    }
}