using System;

namespace Warden.Components.Common {
    public partial class ButtonUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            LoadButtonStyle();
            CheckBtnText();
        }

        #region Atributes

        public delegate void OnClickEvent();
        public event OnClickEvent OnClick;

        #endregion

        #region Methods

        public String LoadButtonStyle() {
            String BtnStyle = "btn";
            String FormatComponentStyle = "";
            String[] StylePart;

            try {

                if (!String.IsNullOrEmpty(ComponentStyle)) {
                    FormatComponentStyle = ComponentStyle;
                } else {
                    FormatComponentStyle = "default";
                }

                StylePart = FormatComponentStyle.Split(' ');

                foreach (String Style in StylePart) {
                    BtnStyle += " btn-" + Style.ToLowerInvariant();
                }

                if (!String.IsNullOrEmpty(ComponentSize)) {
                    switch (ComponentSize.ToLowerInvariant()) {
                        case "small": {
                            BtnStyle += " btn-sm";
                            break;
                        }
                        case "large": {
                            BtnStyle += " btn-lg";
                            break;
                        }
                    }

                }

                this.btn_control.Attributes.Add("class", BtnStyle);
                
            } catch (Exception Err) {
                Session.Add("Error", Err.Message);
            }
            return BtnStyle;
        }

        public void CheckBtnText() {
            if (String.IsNullOrEmpty(Text)) {
                Text = "Button";
            }
        }

        #endregion

        #region Events

        protected void btn_control_Click(object sender, EventArgs e) {
            try {
                if (OnClick != null) {
                    OnClick();
                }
            } catch (Exception Except) {
                throw new Exception(Except.Message);
            }
        }

        #endregion
    }
}