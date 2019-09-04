using System;

namespace Warden.Components.Common {
    public partial class TextAreaUsc : BaseTextUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }
        public override String Text {
            get { return txta_control.Value; }
        }
        public Int32 Rows { get; set; }
        public Int32 Cols { get; set; }

        public override void LoadDataSource() {
            base.LoadDataSource();
            LoadTextArea();
        }

        public void LoadTextArea() {
            if (Rows <= 0) {
                Rows = 4;
            }
            if (Cols <= 0) {
                Cols = 80;
            }
            txta_control.Attributes.Add("rows", Convert.ToString(Rows));
            txta_control.Attributes.Add("cols", Convert.ToString(Cols));
        }
    }
}