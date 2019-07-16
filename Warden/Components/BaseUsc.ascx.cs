using System;
using System.Web.UI;

namespace Warden.Components {
    public partial class BaseUsc : UserControl {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
        }

        //Text
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
    }
}