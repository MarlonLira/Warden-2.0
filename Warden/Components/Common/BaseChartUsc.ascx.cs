using System;

namespace Warden.Components.Common {
    public partial class BaseChartUsc : BaseUsc {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public String[] ArrayValues { get; set; }
        public String[] ArrayTitles { get; set; }
        public String Titles;
        public String Values;
        public String Labels {
            get { return "'" + Text + "'"; }
            set { this.Labels = "'" + Text + "'"; }
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
            }
        }
    }
}