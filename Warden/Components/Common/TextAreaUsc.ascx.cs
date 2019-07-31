using System;

namespace Warden.Components.Common {
    public partial class TextAreaUsc : BaseTextUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            LoadTextArea();
        }

        public Int32 Rows { get; set; }
        public Int32 Cols { get; set; }

        public void LoadTextArea() {
            if (Rows <= 0) {
                Rows = 4;
            }
            if (Cols <= 0) {
                Cols = 80;
            }
        }
    }
}