﻿using System;
using System.Data;
using System.Web.UI.WebControls;

namespace Warden.Components.Common {
    public partial class BaseChartUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public String[] ArrayValues { get; set; }
        public String[] ArrayTitles { get; set; }
        public String Titles;
        public String Values;
        protected Int32 TotalValue { get; set; }
        public String Labels {
            get { return "'" + Text + "'"; }
            set { this.Labels = "'" + Text + "'"; }
        }
        public String Icon { get; set; }

        protected String LoadIcon() {
            String Result = "";
            this.Icon = String.IsNullOrEmpty(Icon) ? " " : Icon.ToUpperInvariant();

            switch (Icon) {
                case "MESSAGE": {
                        Result = "tim-icons icon-send text-success";
                        break;
                    }
                case "BELLS": {
                        Result = "tim-icons icon-bell-55 text-primary";
                        break;
                    }
                case "DELIVERY": {
                        Result = "tim-icons icon-delivery-fast text-info";
                        break;
                    }
                default: {
                        Result = "tim-icons icon-delivery-fast text-info";
                        break;
                    }
            }
            return Result;

        }

        public override void LoadDataSource() {
            base.LoadDataSource();

            if (ArrayTitles != null) {
                Titles = Helper.Help.ConvertToJsArray(ArrayTitles);
                Values = Helper.Help.ConvertToJsArray(ArrayValues);
            } else if (Itens != null) {
                String Result = Helper.Help.ConvertToJsArray(Itens);
                String[] ResultPart = Result.Split('/');
                Titles = ResultPart[0];
                Values = ResultPart[1];
            } else {
                Titles = "Views";
                Values = "0";
            }
        }

        public void LoadDataSource(DataTable Table, ListItem Column) {

            if(Table != null) {
                Itens = new System.Collections.Generic.List<ListItem>();
                foreach (DataRow Row in Table.Rows) {
                    Itens.Add( new ListItem {
                        Text = Convert.ToString(Row[Column.Text]),
                        Value = Convert.ToString(Row[Column.Value])
                    });
                    TotalValue += Convert.ToInt32(Row[Column.Value]);
                }
            }
            if (Itens != null) {
                String Result = Helper.Help.ConvertToJsArray(Itens);
                String[] ResultPart = Result.Split('/');
                Titles = ResultPart[0];
                Values = ResultPart[1];
            }
        }
    }
}