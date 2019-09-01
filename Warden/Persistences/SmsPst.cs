﻿using Newtonsoft.Json.Linq;
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
        private const String Login = "81999269773";
        private const String Pass = "820475";

        #endregion

        #region Methods
        public override void Send() {
            base.Send();
            WebReq();
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
                    WebFields["lgn"] = Login;
                    WebFields["pwd"] = Pass;
                    WebFields["content"] = this.Text;
                    WebFields["numbers"] = this.Recipient.PhoneNumber;
                    WebFields["type_service"] = "LONGCODE";
                    //WebFields["url_callback"] = "URL DE RETORNO";

                    WebResponse = WebPost.UploadValues(ApiUrl, "POST", WebFields);
                    Result = HTTP_ENCODING.GetString(WebResponse);

                    //String[] Part = Result.Split(':');
                    
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