using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Warden.Components.Common;
using Warden.Persistences.Marketing;

namespace Warden.Components.Controls.Marketing
{
    public partial class TypeCadastroUsc : BaseControlsUsc
    {
        public TypePst GetValues()
        {
            try
            {
                if (String.IsNullOrEmpty(txtName.Text)) { throw new Exception("O nome está em branco!"); }
                TypePst Type = new TypePst();
                Type.Audit = AuthenticatedUser.RegistryCode + " - " + DateTime.UtcNow.AddHours(-3) + " - SALVAR";
                Type.Status = "AT";
                Type.Name = txtName.Text;
                return Type;
            }
            finally
            {
                txtName.Text = null;
            }
        }
        public Boolean Visibled { set { this.pnlControl.Visible = value; } }
        public Boolean Enabled { set { this.pnlControl.Enabled = value; } }
        
    }
}