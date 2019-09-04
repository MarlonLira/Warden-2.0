using System;

namespace Warden.Models {
    public class Sms : Messages {
      
        public String Campaign { get; set; }
        public Boolean MultipleSend { get; set; }
        
    }
}