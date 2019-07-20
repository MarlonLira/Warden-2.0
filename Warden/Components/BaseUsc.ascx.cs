using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Warden.Components {
    public partial class BaseUsc : UserControl {

        public class Item {
            public String Value { get; set; }
            public String Text { get; set; }
        }

        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }


        //Text
        public Boolean ReadOnly { get; set; }
        public String Title { get; set; }
        public String Text { get; set; }

        //Style
        public String ComponentId { get; set; }
        public String ComponentStyle { get; set; }
        public String ComponentSize { get; set; }
        public String ComponentColor { get; set; }

        public virtual void LoadDataSource() {
            //Carregamento de dados dos Componentes
        }

        public virtual void LoadDataSource(List<ListItem> Itens) {
            //Carregamento de dados dos Componentes
        }
    }
}