using System;
using System.Web.UI;

namespace Warden.Components {
    public partial class BaseUsc : UserControl {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public String Text { get; set; }
        public String ComponentStyle { get; set; }
    }
}