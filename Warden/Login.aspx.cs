using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Warden {
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["User"] != null && Convert.ToString(Session["User"]) == "ADMIN") {
                Response.Redirect("~/Default.aspx", false);
            }
        }
    }
}