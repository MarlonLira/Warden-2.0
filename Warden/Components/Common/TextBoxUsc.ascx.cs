using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Warden.Components.Common {
    public partial class TextBoxUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public String HelpText { get; set; }
        public String Title { get; set; }
        public Boolean IsTextArea { get; set; }

        public void LoadTextBox() {

        }
    }
}