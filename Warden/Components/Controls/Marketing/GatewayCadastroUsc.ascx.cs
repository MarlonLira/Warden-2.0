﻿using System;
using System.Data;
using Warden.Components.Common;
using Warden.Models;
using Warden.Persistences;
using Warden.Persistences.Marketing;

namespace Warden.Components.Controls.Marketing {
    public partial class GatewayCadastroUsc : BaseControlsUsc
    {
        #region Events
 
        public override void LoadDataSource()
        {
            base.LoadDataSource();
            VerifyAndLoad();
            ddType.OnSelectedIndexChanged += new DropdownUsc.OnSelectedIndexChangedEvent(DdType_OnSelectedIndexChanged);
        }

        private void DdType_OnSelectedIndexChanged() {
            switch (ddType.SelectedText.ToUpperInvariant()) {
                case "EMAIL": {
                        txtToken.Title = "Email";
                        txtUrl.Title = "Host";
                        txtPort.Visible = true;
                        break;
                    }
                default: {
                        txtToken.Title = "Token";
                        txtPort.Visible = false;
                        break;
                    }
            }
        }

        private void BtnBack_OnClick() {
            GatewayRegister = true;
            Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
        }

        private void BtnGatewayRegister_OnClick() {
            GatewayRegister = true;
            if (!IsRegister) {
                Register();
            }
        }

        #endregion

        #region Atributes

        public Boolean Visibled { set { this.pnlControl.Visible = value; } }
        public Boolean Enabled { set { this.pnlControl.Enabled = value; } }
        private ModalUsc ShowMessage { get { return mdlControl; } }
        private Boolean IsRegister {
            get { return Session["IsRegister"] == null ? false : Convert.ToBoolean(Session["IsRegister"]); }
            set { Session.Add("IsRegister", value); }
        }
        private Boolean GatewayRegister {
            get { return Session["GatewayRegister"] == null ? false : Convert.ToBoolean(Session["GatewayRegister"]); }
            set { Session.Add("GatewayRegister", value); }
        }

        #endregion

        #region Methods

        private void VerifyAndLoad() {
            TypePst Type = new TypePst();
            DataTable TypeTable = Session["TypeTable"] == null ? Type.Search() : (DataTable)Session["TypeTable"];

            if (Session["TypeTable"] == null) {
                Session.Add("TypeTable", TypeTable);
            }

            ddType.LoadDataSource(TypeTable);
        }
        public GatewayPst GetValues()
        {
            GatewayPst Gateway;
            try
            {
                IsRegister = true;

                Gateway = new GatewayPst();
                Gateway.Status = "AT";
                Gateway.Audit = AuthenticatedUser.RegistryCode + " - " + DateTime.UtcNow.AddHours(-3) + " - SALVAR";
                Gateway.Url = txtUrl.Text;
                Gateway.Credit = 0;
                Gateway.Name = txtName.Text;
                Gateway.Pass = txtPass.Text;
                Gateway.User = txtUser.Text;
                Gateway.Token = String.IsNullOrEmpty(txtToken.Text) ? "SEM TOKEN" : txtToken.Text;
                Gateway.Type = new TypePst() { Id = Convert.ToInt32(ddType.SelectedValue), Name = ddType.Text };

                if (Gateway.Type.Id == 2)
                {
                    Gateway.Url = txtUrl.Text + "|" + txtPort.Text;
                }

                return Gateway;

            }
            finally
            {
                Gateway = null;
            }
        }
        private void Register() {
            GatewayPst Gateway;
            IsRegister = true;
            try {

                Gateway = new GatewayPst();
                Gateway.Status = "AT";
                Gateway.Audit = AuthenticatedUser.RegistryCode + " - " + DateTime.UtcNow.AddHours(-3) + " - SALVAR";
                Gateway.Url = txtUrl.Text;
                Gateway.Credit = 0;
                Gateway.Name = txtName.Text;
                Gateway.Pass = txtPass.Text;
                Gateway.User = txtUser.Text;
                Gateway.Token = String.IsNullOrEmpty(txtToken.Text) ? "SEM TOKEN" : txtToken.Text;
                Gateway.Type = new TypePst() {Id = Convert.ToInt32(ddType.SelectedValue), Name = ddType.Text };

                if (Gateway.Type.Id == 2) {
                    Gateway.Url = txtUrl.Text + "|" + txtPort.Text;
                }

                if (!String.IsNullOrEmpty(txtUser.Text)) {
                    Gateway.Save();
                }

                ResultEvent = new ResultEvent("Cadastro Realizado com Sucesso!");
                ShowMessage.Open("Resultado", "Cadastro Realizado com Sucesso!");

            } catch (Exception Except) {
                ShowMessage.Open("Error", Except.Message);
                ResultEvent = new ResultEvent(Except.Message);
            } finally {
                Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
            }
        }

        #endregion
    }
}