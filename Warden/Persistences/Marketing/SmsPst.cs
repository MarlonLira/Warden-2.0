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
    public class SmsPst : Sms, IEntitie {

        #region Enums

        public enum APIs {
            [StringValue("http://www.facilitamovel.com.br/api")]
            FacilitaSms = 1,

            [StringValue("http://app.smsfast.com.br/api.ashx?")]
            SmsFast = 2
        }

        public enum SendType {
            [StringValue("/simpleSend.ft?")]
            Simple = 1,
            [StringValue("/multipleSend.ft?")]
            Multiple = 2
        }

        public enum Type {
            [StringValue("SHORTCODE")]
            ShortCode = 1,
            [StringValue("LONGCODE")]
            LongCode = 2,
            [StringValue("FLASH")]
            Flash = 3
        }

        #endregion

        #region Constants

        private const String COMMON_ATTRIBUTES = "@auditoria, @status, @tipo, @campanha, @mensagem, @celular, @quantidade, @valor, @data_envio, @data_cadastro, @gateway_id, @resultado";
        private readonly Encoding HTTP_ENCODING = Encoding.UTF8;

        #endregion

        #region Atributes

        public APIs SelectedAPI { get; set; }
        public SendType SelectedSendType { get; set; }
        public Type SelectedType { get; set; }
        public Boolean IsFlashSms { get; set; }

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

                    if (SelectedAPI == APIs.SmsFast) {
                        dynamic Json = JValue.Parse(Result);
                        this.Status = Json.status;
                        this.Campaign = Json.data;
                        this.Return = Json.msg;
                        this.Result = this.Return;
                    } else if(SelectedAPI == APIs.FacilitaSms) {
                        String[] ResultPart = this.Result.Split(';');
                        String[] ResultAmount = this.Result.Split('-');
                        Int32 FindResultId = Convert.ToInt32(ResultPart[0]);
                        Int32 FindResultAmount = ResultAmount.Length - 1;
                        this.Result = FindResultId == 6 ? "SUCESSO " + Convert.ToInt32(FindResultAmount) + " ENVIOS" : "FALHA";
                    }

                    Save();

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

            this.SelectedType = SelectedType == Type.Flash ? Type.LongCode : SelectedType;

            Result = new NameValueCollection();
            Result["action"] = "sendsms";
            Result["lgn"] = this.Sender.User;
            Result["pwd"] = this.Sender.Pass;
            Result["content"] = this.Text;
            Result["numbers"] = this.Recipient.PhoneNumber.Replace(";", ",");
            Result["type_service"] = SelectedType.GetStringValue();
            
            //Result["url_callback"] = "URL DE RETORNO";

            return Result;
        }

        private NameValueCollection FacilitaSms() {
            NameValueCollection Result = new NameValueCollection();

            Result = new NameValueCollection();
            Result["user"] = this.Sender.User;
            Result["password"] = this.Sender.Pass;
            Result["msg"] = this.Text;
            Result["destinatario"] = this.Recipient.PhoneNumber;
            Result["externalkey"] = Helper.Help.RandomIdGenerator();
            Result["flashsms"] = SelectedType == Type.Flash ? "1" : "0";

            return Result;
        }

        public DataTable Search() {
            DataTable Table = new DataTable();
            String Query = "EXEC [marketing].[stp_sms_pesquisar]";
            try {

                Table = Sql.ExecuteReader(Query);

            } catch {
                throw;
            } 

            return Table;
        }

        public DataTable SearchAmount() {
            DataTable Table = new DataTable();
            String Query = "EXEC [marketing].[stp_sms_pesquisar_quantidade]";
            try {
                Table = Sql.ExecuteReader(Query);

            } catch {
                throw;
            } 

            return Table;
        }

        public string Save() {
            String Result = "";
            Int32 NewId = (Int32)DbType.Int32;
            String Query = "EXEC[marketing].[stp_sms_salvar] @id OUTPUT, ";

            try {

                Sql.ExecuteNonQuery(Query, COMMON_ATTRIBUTES, new SqlParameter[] {
                     new SqlParameter("@id", NewId),
                     new SqlParameter("@auditoria", this.Audit),
                     new SqlParameter("@status", this.Status),
                     new SqlParameter("@tipo", this.SelectedSendType.ToString() + " - " + this.SelectedType.GetStringValue()),
                     new SqlParameter("@campanha", this.Title),
                     new SqlParameter("@mensagem", this.Text),
                     new SqlParameter("@celular", this.Recipient.PhoneNumber),
                     new SqlParameter("@quantidade", this.Amount),
                     new SqlParameter("@valor", this.Credit),
                     new SqlParameter("@data_envio", this.SendDate),
                     new SqlParameter("@data_cadastro", this.RegistrationDate),
                     new SqlParameter("@gateway_id", this.Gateway.Id),
                     new SqlParameter("@resultado", this.Result)
                });

            } catch {
                throw;
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