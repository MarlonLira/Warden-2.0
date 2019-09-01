using System;

namespace Warden.Models {
    public class WhatsApp: Messages {
        public String Description { get; set; }
        public API Api { get; set; }
    }

    public class API {
        public String Token { get; set; }
        public String Url { get; set; }
    }
}