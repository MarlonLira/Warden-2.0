using System;

namespace Warden.Models {
    public class Sms : Messages {
      
        public String Campaign { get; set; }
        public DateTime SendDate { get; set; }
        public DateTime RegistrationDate { get; set; }
        
    }
}