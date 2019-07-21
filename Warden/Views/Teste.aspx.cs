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
            LoadCharBar();
        }

        private void Btn_teste_OnClick() {
            lbl_teste.Text = dd_teste.SelectedItem;
            txt_teste.Text = dd_teste2.SelectedValue;
            txt_teste2.Text = dd_teste.SelectedItem;
            
        }

        private void LoadCharBar() {
            chartBar_control.Itens = new List<ListItem>() {
                new ListItem {Text = "Opção 1", Value = "10"},
                new ListItem {Text = "Opção 2", Value = "25"},
                new ListItem {Text = "Opção 3", Value = "30"},
                new ListItem {Text = "Opção 4", Value = "46"}
            };

            chartLine_control.Itens = new List<ListItem>() {
                new ListItem {Text = "Pesquisa 1", Value = "54"},
                new ListItem {Text = "Pesquisa 2", Value = "29"},
                new ListItem {Text = "Pesquisa 3", Value = "40"},
                new ListItem {Text = "Pesquisa 4", Value = "70"}
            };
            chartBar_control.LoadDataSource();
            chartLine_control.LoadDataSource();
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