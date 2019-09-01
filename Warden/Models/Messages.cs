using System;

namespace Warden.Models {
    public abstract class Messages {

        public String Title { get; set; }
        public String Text { get; set; }
        public Sender Sender { get; set; }
        public Recipient Recipient { get; set; }
        public String Status { get; set; }
        public String Return { get; set; }

        public virtual void Send() {

            if (String.IsNullOrEmpty(Title)) {
                throw new Exception("Erro: O título não foi informado!");
            }

            if (String.IsNullOrEmpty(Text)) {
                throw new Exception("Erro: O texo não foi informado!");
            }

            if (Recipient == null) {
                throw new Exception("Erro: O Destinatario não foi informado!");
            }
        }

        protected virtual void LoadAndVerify() {}
    }

    public class Recipient {
        public String Name { get; set; }
        public String PhoneNumber { get; set; }
        public String Email { get; set; }
    }

    public class Sender {
        public String User { get; set; }
        public String Pass { get; set; }
        public String Email { get; set; }
    }
}