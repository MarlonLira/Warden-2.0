using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Warden.Components.Common {
    public partial class DropdownUsc : BaseUsc {
         
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public List<ListItem> ItemList { get; set; }
        public String SelectedItem {
            get { return dd_control.SelectedItem.Text; }
            set { this.dd_control.SelectedItem.Text = value; }
        }

        public String SelectedValue {
            get { return dd_control.SelectedValue; }
            set { this.dd_control.SelectedValue = value; }
        }

        public override void LoadDataSource() {
            base.LoadDataSource();
            if (!IsPostBack) {

                if (String.IsNullOrEmpty(ComponentStyle)) {
                    ComponentStyle = "default";
                }
                dd_control.Attributes.Add("class", "btn btn-" + ComponentStyle.ToLower() + " dropdown - toggle");

                if (ItemList != null) {
                    foreach (ListItem Item in ItemList) {
                        dd_control.Items.Add(Item);
                    }
                }
            }
        }
    }
}