﻿using System;
using Warden.Persistences.Administration;

namespace Warden.Components.Controls {
    public partial class UserLoginUsc : BaseUsc {

        #region Events

        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            btnConfirm.OnClick += new Common.ButtonUsc.OnClickEvent(BtnConfirm_OnClick);
        }

        private void BtnConfirm_OnClick() {
            if (!String.IsNullOrEmpty(txtEmail.Text)) {
                if (txtEmail.Text.ToUpperInvariant() == "ADMIN") {
                    if (txtPassword.Text == "Root1526") {
                        UserPst Teste = new UserPst() {
                            Name = "Administrator",
                            Id = 1,
                            Email = "Admin",
                            Pass = "Root1526",
                            Status = "AT",
                            RegistryCode = "000.111.333-44"
                        };
                        Session.Add("User", Teste);
                        Response.Redirect("~/Default.aspx", false);
                    } else {
                        txtError.Visible = true;
                        txtError.Text = "Erro: a senha está incorreta!";
                    }
                } else {
                    txtError.Visible = true;
                    txtError.Text = "Erro: O login está incorreto!";
                }
            } else {
                txtError.Visible = true;
                txtError.Text = "Erro: O login está Vazio!";
            } 
        }

        #endregion
    }
}