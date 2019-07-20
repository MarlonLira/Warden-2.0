using System;
using Warden.Components.Common;
using System.Collections.Generic;
using System.Web.UI.WebControls;

namespace Warden.Views {
    public partial class Teste : BasePge {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            btn_teste.OnClick += new ButtonUsc.OnClickEvent(Btn_teste_OnClick);
            LoadDropdown();
        }

        private void Btn_teste_OnClick() {
            lbl_teste.Text = dd_teste.SelectedItem;
            txt_teste.Text = dd_teste2.SelectedValue;
            txt_teste2.Text = dd_teste.SelectedItem;
            
        }

        private void LoadDropdown() {
            dd_teste.ItemList = new List<ListItem>() {
                new ListItem { Text = "Selecione uma opção", Value="0" },
                new ListItem {Text = "Opção 1", Value = "1"},
                new ListItem {Text = "Opção 2", Value = "2"},
                new ListItem {Text = "Opção 3", Value = "3"},
                new ListItem {Text = "Opção 4", Value = "4"}
            };
            dd_teste2.ItemList = new List<ListItem>();
            dd_teste2.ItemList = dd_teste.ItemList;

            dd_teste.LoadDataSource();
            dd_teste2.LoadDataSource();
        }
    }
}