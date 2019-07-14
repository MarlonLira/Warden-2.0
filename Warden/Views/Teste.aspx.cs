using System;
using Warden.Components.Common;

namespace Warden.Views {
    public partial class Teste : BasePge {
        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            btn_teste.OnClick += new ButtonUsc.OnClickEvent(Btn_teste_OnClick);
        }

        private void Btn_teste_OnClick() {
            Label1.Text = "teste";
            
        }
    }
}