using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Warden.Persistences.Administration;

namespace Warden.Components {
    public partial class BaseUsc : UserControl {

        #region Atributes

        protected UserPst AuthenticatedUser { get { return Session["User"] == null ? null : (UserPst)Session["User"]; } }

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

        #endregion

        #region Methods

        public virtual void LoadDataSource() {
            //Carregamento de dados dos Componentes
        }

        public virtual void LoadDataSource(List<ListItem> Itens) {
            //Carregamento de dados dos Componentes
        }

        public virtual void LoadDataSource(DataTable Table) {
            //Carregamento de dados dos Componentes
        }

        #endregion
    }
}