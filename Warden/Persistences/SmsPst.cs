using Newtonsoft.Json.Linq;
using System;
using System.Collections.Specialized;
using System.Net;
using System.Text;
using Warden.Models;

namespace Warden.Persistences {
    public class SmsPst: Sms {

        #region Enums

        public enum APIs
        {
            SmsFast,
            FacilitaSms
        }

        #endregion

        #region Constants

        public readonly Encoding HTTP_ENCODING = Encoding.UTF8;
        private const String URL_PLATFORM = @"http://app.smsfast.com.br/api.ashx?";
        private const String URL_PLATFORM2 = @"http://www.facilitamovel.com.br/api";

        #endregion

        #region Atributes

        public APIs SelectedAPI { get; set; }

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
                    User = "81999269773",
                    Pass = "820475"
                };
            }
        }

        private dynamic WebReq() {
            dynamic Result;
            String ApiUrl = URL_PLATFORM;
            
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
                            break;
                        }
                        case APIs.FacilitaSms: {
                            WebFields = FacilitaSms();
                                ApiUrl += "multipleSend.ft?";
                            break;
                        }
                    }

                    WebResponse = WebPost.UploadValues(ApiUrl, "POST", WebFields);
                    Result = HTTP_ENCODING.GetString(WebResponse);
                    
                    dynamic Json = JValue.Parse(Result);
                    this.Status = Json.status;
                    this.Campaign = Json.data;
                    this.Return = Json.msg;

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
            Result["action"] = "sendsms";
            Result["user"] = this.Sender.User;
            Result["password"] = this.Sender.Pass;
            Result["msg"] = this.Text;
            Result["destinatario"] = this.Recipient.PhoneNumber;
            Result["externalkey"] = "URL DE RETORNO";
            Result["flashsms"] = "0";

            return Result;
        }

        #endregion
    }
}