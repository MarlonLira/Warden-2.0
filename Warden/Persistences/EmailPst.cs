using System;
using System.Net;
using System.Net.Mail;
using Warden.Models;

namespace Warden.Persistences {
    public class EmailPst: Email {

        public override void Send() {
            base.Send();
            LoadAndVerify();
            WebReq();

        }

        protected override void LoadAndVerify() {

            if (this.Sender == null) {
                Sender = new Sender() {
                    Email = "mailing@hiacademia.com.br",
                    User = "vitoriag1",
                    Pass = "AcYNvtHU9360"
                };
            }

            if (this.Service == null) {
                Service = new Service() {
                    Host = "smtplw.com.br",
                    Port = 587
                };
            }
        }

        public void WebReq() {
            String Body = "";

            try {
                using (SmtpClient Smtp = new SmtpClient()) {

                    //Config Servidor Email
                    Smtp.Host = this.Service.Host;
                    Smtp.Port = this.Service.Port;
                    Smtp.EnableSsl = true;
                    Smtp.UseDefaultCredentials = false;
                    Smtp.Credentials = new NetworkCredential(Sender.User, Sender.Pass);

                    Body = Helper.Help.MsgFormat(this.Text, this.Recipient.Name, this.Recipient.Email);

                    using (MailMessage Mail = new MailMessage()) {
                        //Armazenamento dos dados
                        Mail.From = new MailAddress(Sender.Email);
                        Mail.To.Add(new MailAddress(this.Recipient.Email));
                        Mail.Subject = this.Title;
                        Mail.IsBodyHtml = true;
                        Mail.Body = Body;

                        Smtp.Send(Mail);
                        Mail.Dispose();
                        Smtp.Dispose();

                    }
                }
            } catch {
                throw;
            } finally {
            }
        }
    }
}