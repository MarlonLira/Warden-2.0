using System;
using System.Collections.Generic;
using System.Data;
using Warden.Components.Common;
using Warden.Persistences;
using Warden.Persistences.Marketing;

namespace Warden.Views.Marketing {
    public partial class MktConfigPge : BasePge{

        #region Events

        protected override void OnLoad(EventArgs e) {
            base.OnLoad(e);
            LoadTable();
            btnGatewayRegister.OnClick += new ButtonUsc.OnClickEvent(BtnGatewayRegister_OnClick);
            btnGatewayBack.OnClick += new ButtonUsc.OnClickEvent (BtnGatewayBack_OnClick);
            btnGatewaySave.OnClick += new ButtonUsc.OnClickEvent(BtnGatewaySave_OnClick);
            btnTypeRegister.OnClick +=  new ButtonUsc.OnClickEvent(BtnTypeRegister_OnClick);
            btnTypeSave.OnClick += new ButtonUsc.OnClickEvent(BtnTypeSave_OnClick);
            btnTypeBack.OnClick += new ButtonUsc.OnClickEvent(BtnTypeBack_OnClick);
        }

        private void BtnTypeBack_OnClick()
        {
            Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
        }

        private void BtnGatewaySave_OnClick()
        {
            IsRegister = IsRegister.Gateway;
            Save();
        }

        private void BtnGatewayBack_OnClick()
        {
            Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
        }

        private void BtnTypeSave_OnClick()
        {
            if (!IsPostBack) {
                IsRegister = IsRegister.Type;
                Save();
            }
        }
        private void BtnTypeRegister_OnClick()
        {
            TypeCadastro.Visible = true;
            TypeCadastro.Visibled = true;
            TypeCadastro.Enabled = true;
            tblTypeConfig.Visible = false;
            btnTypeRegister.Visible = false;
            btnTypeSave.Visible = true;
            btnTypeBack.Visible = true;
            lblType.Visible = false;
        }

        private void BtnGatewayRegister_OnClick() {
            gtwCadastro.Visible = true;
            gtwCadastro.Visibled = true;
            gtwCadastro.Enabled = true;
            tblMktConfig.Visible = false;
            btnGatewayRegister.Visible = false;
            btnGatewaySave.Visible = true;
            btnGatewayBack.Visible = true;
            lblGateway.Visible = false;
            gtwCadastro.LoadDataSource();
        }

        #endregion

        #region Atributes

        public Boolean IsGatewayRegister {
            get { return Session["GatewayRegister"] == null ? false : Convert.ToBoolean(Session["GatewayRegister"]);}
        }

        private IsRegister IsRegister { get; set; }

        #endregion

        #region Methods

        private void Save()
        {
            try
            {
                switch (IsRegister)
                {
                    case IsRegister.Gateway:
                        {
                            GatewayPst Gateway;
                            Gateway= gtwCadastro.GetValues();
                            Gateway.Save();
                            Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
                            break;
                        }
                    case IsRegister.Type:
                        {
                            TypePst Type;
                            Type = TypeCadastro.GetValues();
                            Type.Save();
                            Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
                            break;
                        }
                }
            }
            catch(Exception Except)
            {

            }
        }

        private void LoadTable() {
            GatewayPst Gateway = new GatewayPst();
            TypePst Type = new TypePst();
            DataTable GatewayTable = Session["GatewayTable"] == null ? Gateway.Search() : (DataTable)Session["GatewayTable"];
            DataTable TypeTable = Session["TypeTable"] == null ? Type.Search() : (DataTable)Session["TypeTable"];

            tblMktConfig.TableColumns = new List<BaseTableUsc.TableColumn>() {
                new BaseTableUsc.TableColumn(){ Name = "nome", Text ="Nome"},
                new BaseTableUsc.TableColumn(){ Name = "usuario", Text ="Usuario"},
                new BaseTableUsc.TableColumn(){ Name = "senha", Text ="Senha"},
                new BaseTableUsc.TableColumn(){ Name = "saldo", Text ="Saldo"},
                new BaseTableUsc.TableColumn(){Name = "tipo_nome", Text = "Tipo"}
            };

            tblTypeConfig.TableColumns = new List<BaseTableUsc.TableColumn>() {
                new BaseTableUsc.TableColumn(){ Name = "id", Text ="ID"},
                new BaseTableUsc.TableColumn(){ Name = "nome", Text ="Nome"},
                new BaseTableUsc.TableColumn(){ Name = "status", Text ="Status"}
            };

            if (Session["GatewayTable"] == null) {
                Session.Add("GatewayTable", GatewayTable);
            }

            if (Session["TypeTable"] == null) {
                Session.Add("TypeTable", TypeTable);
            }
            
            if (IsGatewayRegister) {
                Session["GatewayTable"] = null;
                gtwCadastro.Visible = false;
                gtwCadastro.Visibled = false;
                gtwCadastro.Enabled = false;
                tblMktConfig.Visible = true;
                btnGatewayRegister.Visible = true;
                lblGateway.Visible = true;
                Session["GatewayRegister"] = null;
                Response.Redirect("~/Views/Marketing/MktConfigPge.aspx", false);
                
            }

            tblTypeConfig.DataSource = TypeTable;
            tblMktConfig.DataSource = GatewayTable;
        }

        #endregion
    }

    public enum IsRegister{
        Type,
        Gateway
    }
}