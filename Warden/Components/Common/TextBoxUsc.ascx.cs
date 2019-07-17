using System;

namespace Warden.Components.Common {
    public partial class TextBoxUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public String HelpText { get; set; }
        public Boolean IsTextArea { get; set; }
        public String Placeholder { get; set; }
        public String TextMode { get; set; }

        public override void LoadDataSource() {
            base.LoadDataSource();
        }
    }
}