using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Warden.Components {
    public partial class BaseUsc : UserControl {

        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        public List<ListItem> Itens { get; set; }
        //Text
        public Boolean ReadOnly { get; set; }
        public String Title { get; set; }
        public virtual String Text { get; set; }

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

        public virtual void LoadDataSource(DataTable Table) {
            //Carregamento de dados dos Componentes
        }
    }
}