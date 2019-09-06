using System;

namespace Warden.Models {
    public class Email : Messages {
        public Service Service { get; set; }
    }

    public class Service {
        public String Host { get; set; }
        public Int32 Port { get; set; }
    }
}