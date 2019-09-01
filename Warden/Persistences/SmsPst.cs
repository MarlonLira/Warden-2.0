using Newtonsoft.Json.Linq;
using System;
using System.Collections.Specialized;
using System.Net;
using System.Text;
using Warden.Models;

namespace Warden.Persistences {
    public class SmsPst: Sms {

        #region Constants

        public readonly Encoding HTTP_ENCODING = Encoding.UTF8;
        private const String URL_PLATFORM = @"http://app.smsfast.com.br/api.ashx?";

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
                    WebFields["action"] = "sendsms";
                    WebFields["lgn"] = this.Sender.User;
                    WebFields["pwd"] = this.Sender.Pass;
                    WebFields["content"] = this.Text;
                    WebFields["numbers"] = this.Recipient.PhoneNumber;
                    WebFields["type_service"] = "LONGCODE";
                    //WebFields["url_callback"] = "URL DE RETORNO";

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

        #endregion
    }
}