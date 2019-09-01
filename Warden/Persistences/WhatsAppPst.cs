using System;
using System.Collections.Specialized;
using System.Net;
using System.Text;
using Warden.Models;

namespace Warden.Persistences {
    public class WhatsAppPst : WhatsApp {

        #region Enums

        public enum APIs {
            Winzap,
            WaboxApp,
            NiceApp
        }

        #endregion

        #region Atributes

        public readonly Encoding HTTP_ENCODING = Encoding.UTF8;
        private const String SUCCESS = "{\"success\"";
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
            if (this.Api == null) {
                Api = new API() {
                    Token = "b1eb8ddec2f3b81f048672d3c05fcaea5c505838db298",
                    Url = "https://www.waboxapp.com/api/send/chat?"
                };
            }
        }

        public String WebReq() {
            String Result = "";

            ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => { return true; };
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;

            using (WebClient WebPost = new WebClient()) {
                NameValueCollection WebFields = null;
                Byte[] WebResponse = null;
                String TypeSend;

                try {
                    WebFields = new NameValueCollection();
                    TypeSend = "chat";
                    this.Text = Helper.Help.WhatsMsgFormat(this.Text, this.Recipient.Name);

                    switch (SelectedAPI) {
                        case APIs.Winzap: {
                            WebFields = Winzap();
                            break;
                        }
                        case APIs.WaboxApp: {
                            WebFields = WaboxApp();
                            break;
                        }
                        case APIs.NiceApp: {
                            break;
                        }
                        default: {
                            throw new Exception("Erro!, Nenhuma Api foi selecionada para o envio.");
                        }
                    }

                    this.Api.Url += TypeSend;
                    WebResponse = WebPost.UploadValues(this.Api.Url, "POST", WebFields);
                    Result = HTTP_ENCODING.GetString(WebResponse);
                    //Result = "{\"success\":0";

                    String[] Part = Result.Split(':');

                    if (Part[0] == SUCCESS) {
                        Result = "success";
                    }
                } catch (Exception e) {

                } finally {
                    WebFields = null;
                    WebResponse = null;
                }

                return Result;
            }
        }

        private NameValueCollection Winzap() {
            NameValueCollection Result = new NameValueCollection();

            Result["token"] = this.Api.Token;
            Result["cmd"] = "chat";
            Result["id"] = Helper.Help.RandomIdGenerator();
            Result["de"] = this.Sender.PhoneNumber;
            Result["para"] = this.Recipient.PhoneNumber;
            Result["msg"] = this.Text;
            if (!String.IsNullOrEmpty(this.Image)) {
                Result["link"] = this.Image;
            }

            return Result;
        }

        private NameValueCollection WaboxApp() {
            NameValueCollection Result = new NameValueCollection();

            Result["token"] = this.Api.Token;
            Result["uid"] = this.Sender.PhoneNumber;
            Result["to"] = this.Recipient.PhoneNumber;
            Result["custom_uid"] = Helper.Help.RandomIdGenerator();
            Result["text"] = this.Text;

            if (!String.IsNullOrEmpty(this.Image)) {
                Result["url"] = this.Image;
                Result["caption"] = this.Title;
                Result["description"] = this.Description;
            }

            return Result;
        }

        #endregion
    }
}
 