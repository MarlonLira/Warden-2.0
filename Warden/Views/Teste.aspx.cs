using System;
using Warden.Components.Common;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Data;
using System.Web;

namespace Warden.Views {
    public partial class Teste : BasePge {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            btn_teste.OnClick += new ButtonUsc.OnClickEvent(Btn_teste_OnClick);
            LoadDropdown();
            LoadCharBar();
            LoadTable();
            load();
        }
        HttpCookieCollection MyCookieColl;
        HttpCookie MyCookie;

        private void Btn_teste_OnClick() {
            lbl_teste.Text = dd_teste.SelectedItem;
            txt_teste.Text = dd_teste2.SelectedValue;
            txt_teste2.Text = dd_teste.SelectedItem;
            
        }

        private void load() {
            int loop1, loop2;
            MyCookieColl = Request.Cookies;
            String[] arr1 = MyCookieColl.AllKeys;

            for(loop1 = 0; loop1 < arr1.Length; loop1++) 
{
                MyCookie = MyCookieColl[arr1[loop1]];
                
                lbl_teste.Text += "Cookie: " + MyCookie.Name + "<br>";
                lbl_teste.Text += "Secure:" + MyCookie.Secure + "<br>";
                lbl_teste.Text += "Values:" + MyCookie.Values + "<br>";
                lbl_teste.Text += "Value:" + MyCookie.Value + "<br>";

                //Grab all values for single cookie into an object array.
                String[] arr2 = MyCookie.Values.AllKeys;

                //Loop through cookie Value collection and print all values.
                for (loop2 = 0; loop2 < arr2.Length; loop2++) {
                    lbl_teste.Text += "Value" + loop2 + ": " + Server.HtmlEncode(arr2[loop2]) + "<br>";
                }
            }
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

            //dd_teste.LoadDataSource();
            //dd_teste2.LoadDataSource();
        }

        private void LoadTable() {
            tbl_teste.TableColumns = new List<BaseTableUsc.TableColumn>() {
                new BaseTableUsc.TableColumn(){ Name = "Dosage", Text ="Dosagem"},
                new BaseTableUsc.TableColumn(){ Name = "Drug", Text ="Remedio"},
                new BaseTableUsc.TableColumn(){ Name = "Patient", Text ="Paciente"},
                new BaseTableUsc.TableColumn(){ Name = "Date", Text ="Data"}
            };

            tbl_teste.LoadDataSource(GetData());
        }

        private DataTable GetData() {
            // DataTable de teste
            DataTable table = new DataTable();
            table.Columns.Add("Dosage", typeof(int));
            table.Columns.Add("Drug", typeof(string));
            table.Columns.Add("Patient", typeof(string));
            table.Columns.Add("Date", typeof(string));

            // Here we add five DataRows.
            table.Rows.Add(25, "Indocin", "David", DateTime.Now.ToShortDateString());
            table.Rows.Add(50, "Enebrel", "Sam", DateTime.Now.ToShortDateString());
            table.Rows.Add(10, "Hydralazine", "Christoff", DateTime.Now.ToShortDateString());
            table.Rows.Add(21, "Combivent", "Janet", DateTime.Now.ToShortDateString());
            table.Rows.Add(100, "Dilantin", "Melanie", DateTime.Now.ToShortDateString());
            return table;
        }
    }
}