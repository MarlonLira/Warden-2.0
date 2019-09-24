using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using Warden.Interfaces;
using Warden.Models;

namespace Warden.Persistences {
    public class EmailPst: Email, IEntitie {

        public override void Send() {
            base.Send();
            LoadAndVerify();
            WebReq();

        }

        private const String COMMON_ATTRIBUTES = "@auditoria, @status, @tipo, @campanha, @mensagem, @email, @quantidade, @valor, @data_envio, @data_cadastro, @gateway_id, @resultado";

        protected override void LoadAndVerify() {
        }

        public void WebReq() {
            String Body = "";
            String[] FoundEmails = this.Recipient.Email.Split(new[] { ";" }, StringSplitOptions.RemoveEmptyEntries);
            String Email = "";
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
                        foreach (String FindEmail in FoundEmails) {
                            Email = FindEmail.Trim();
                            Mail.Bcc.Add(new MailAddress(Email));
                        }
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
            } 
        }

        public DataTable Search() {
            throw new NotImplementedException();
        }

        public string Save() {
            String Result = "";
            Int32 NewId = (Int32)DbType.Int32;
            String Query = "EXEC[marketing].[stp_email_salvar] @id OUTPUT, ";

            try {

                Sql.ExecuteNonQuery(Query, COMMON_ATTRIBUTES, new SqlParameter[] {
                     new SqlParameter("@id", NewId),
                     new SqlParameter("@auditoria", this.Audit),
                     new SqlParameter("@status", this.Status),
                     new SqlParameter("@campanha", this.Title),
                     new SqlParameter("@mensagem", this.Text),
                     new SqlParameter("@email", this.Recipient.Email),
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
    }
}