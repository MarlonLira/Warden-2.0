using System;

namespace Warden.Components.Common {
    public partial class BaseTextUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            ComponentTextLoad();
        }
        public String HelpText { get; set; }
        public Boolean IsTextArea { get; set; }
        public String Placeholder { get; set; }
        public String TextMode { get; set; }
        public String Type {
            set { this.TextMode = value.ToLowerInvariant(); }
            get { return this.TextMode; }
        }
        public Int32 Size { get; set; }
        public Boolean IsDisabled {
            set {
                if (value == true) {
                    Disabled = "disabled";
                } else {
                    Disabled = "";
                }
            }
        }
        protected String Disabled { get; set; }

        protected void ComponentTextLoad() {
            if (Size <= 0) {
                Size = 5;
            }

            if (String.IsNullOrEmpty(this.Type)) {
                Type = "text";
            }

            LoadDataSource();
        }
    }
}