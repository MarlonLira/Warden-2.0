using System;

namespace Warden.Models {
    public class Sms : Messages {

        #region Atributes

        public String Campaign { get; set; }
        public DateTime SendDate { get; set; }
        public DateTime RegistrationDate { get; set; }

        #endregion

    }
}