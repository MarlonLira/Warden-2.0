using Newtonsoft.Json.Linq;
using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Text;
using Warden.Interfaces;
using Warden.Models;

namespace Warden.Persistences {
    public class SmsPst: Sms, IEntitie {

        #region Enums

        public enum APIs
        {
            [StringValue("http://app.smsfast.com.br/api.ashx?")]
            SmsFast,

            [StringValue("http://www.facilitamovel.com.br/api")]
            FacilitaSms
        }

        public enum SendType
        {
            [StringValue("/simpleSend.ft?")]
            Simple,
            [StringValue("/multipleSend.ft?")]
            Multiple
        }

        #endregion

        #region Constants

        private const String COMMON_ATTRIBUTES = "@auditoria, @status, @tipo, @campanha, @mensagem, @celular, @quantidade, @valor, @data_envio, @data_cadastro, @gateway_id, @resultado";
        private readonly Encoding HTTP_ENCODING = Encoding.UTF8;

        #endregion

        #region Atributes

        public APIs SelectedAPI { get; set; }
        public SendType SelectedSendType { get; set; }
        public Boolean IsFlashSms { get; set; }
        private DbConnect DbConnect { get; set; }
        private SqlCommand Sql {
            get {
                DbConnect = Connection.VerifyAndConnect(DbConnect, "WARDEN");
                return DbConnect.Sql;
            }
        }

        #endregion

        #region Methods


        public override void Send() {
            base.Send();
            LoadAndVerify();
            WebReq();
        }

        protected override void LoadAndVerify() {
            base.LoadAndVerify();
            if (this.Sender == null) {
                Sender = new Sender() {
                    //AJUSTAR
                };
            }
        }

        private dynamic WebReq() {
            dynamic Result;
            String ApiUrl = "";
            
            ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => { return true; };
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            using (WebClient WebPost = new WebClient()) {
                NameValueCollection WebFields = null;
                Byte[] WebResponse = null;

                try {
                    WebFields = new NameValueCollection();

                    switch (SelectedAPI) {
                        case APIs.SmsFast: {
                            WebFields = SmsFast();
                            ApiUrl = APIs.SmsFast.GetStringValue();
                            break;
                        }
                        case APIs.FacilitaSms: {
                            WebFields = FacilitaSms();
                            ApiUrl = APIs.FacilitaSms.GetStringValue();
                            ApiUrl += SelectedSendType.GetStringValue();
                            break;
                        }
                    }

                    WebResponse = WebPost.UploadValues(ApiUrl, "POST", WebFields);
                    Result = HTTP_ENCODING.GetString(WebResponse);

                    this.Result = Result;
                    Save();

                    if (SelectedAPI == APIs.SmsFast) {
                        dynamic Json = JValue.Parse(Result);
                        this.Status = Json.status;
                        this.Campaign = Json.data;
                        this.Return = Json.msg;
                    }

                } catch {
                    throw;
                } finally {
                    WebFields = null;
                    WebResponse = null;
                }
                return Result;
            }
        }

        private NameValueCollection SmsFast() {
            NameValueCollection Result = new NameValueCollection();

            Result = new NameValueCollection();
            Result["action"] = "sendsms";
            Result["lgn"] = this.Sender.User;
            Result["pwd"] = this.Sender.Pass;
            Result["content"] = this.Text;
            Result["numbers"] = this.Recipient.PhoneNumber;
            Result["type_service"] = "LONGCODE";
            //Result["url_callback"] = "URL DE RETORNO";

            return Result;
        }

        private NameValueCollection FacilitaSms() {
            NameValueCollection Result = new NameValueCollection();

            Result = new NameValueCollection();
            //Result["action"] = "sendsms";
            Result["user"] = this.Sender.User;
            Result["password"] = this.Sender.Pass;
            Result["msg"] = this.Text;
            Result["destinatario"] = this.Recipient.PhoneNumber;
            Result["externalkey"] = Helper.Help.RandomIdGenerator();
            if (IsFlashSms) {
                Result["flashsms"] = "1";
            } else {
                Result["flashsms"] = "0";
            }

            return Result;
        }

        public DataTable Search() {
            DataTable Table = new DataTable();
            try {
                DbConnect.OpenAdpter("EXEC [marketing].[stp_sms_pesquisar]");
                DbConnect.Adapt.Fill(Table);
            } catch {
                throw;
            } finally {
                DbConnect.CloseCon();
            }

            return Table;
        }

        public string Save() {
            String Result = "";
            Int32 NewId = (Int32)DbType.Int32;

            try {
                
                Sql.CommandText = "EXEC [marketing].[stp_sms_salvar] @id OUTPUT, " + COMMON_ATTRIBUTES;
                Sql.Parameters.AddWithValue("@id", NewId);
                Sql.Parameters.AddWithValue("@auditoria", "SALVAR");
                Sql.Parameters.AddWithValue("@status", this.Status);
                Sql.Parameters.AddWithValue("@tipo", this.SelectedSendType.GetStringValue());
                Sql.Parameters.AddWithValue("@campanha", this.Title);
                Sql.Parameters.AddWithValue("@mensagem", this.Text);
                Sql.Parameters.AddWithValue("@celular", this.Recipient.PhoneNumber);
                Sql.Parameters.AddWithValue("@quantidade", this.Amount);
                Sql.Parameters.AddWithValue("@valor", this.Credit);
                Sql.Parameters.AddWithValue("@data_envio", this.SendDate);
                Sql.Parameters.AddWithValue("@data_cadastro", this.RegistrationDate);
                Sql.Parameters.AddWithValue("@gateway_id", this.Gateway.Id);
                Sql.Parameters.AddWithValue("@resultado", this.Result);


                Sql.ExecuteNonQuery();
            } catch {
                throw;
            } finally {
                DbConnect.CloseCon();
            }

            return Result;
        }

        public string Update() {
            throw new NotImplementedException();
        }

        public string Delete() {
            throw new NotImplementedException();
        }

        #endregion
    }
}