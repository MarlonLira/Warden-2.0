﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Warden.Components.Common
{
    public partial class MenuButtonUsc : BaseUsc
    {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public String Url { get; set; }
        public String SmallText { get; set; }
    }
}