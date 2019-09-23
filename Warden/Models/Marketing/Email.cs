using System;

namespace Warden.Models {
    public class Email : Messages {

        #region Atributes

        public Service Service { get; set; }

        #endregion
    }

    #region SubClasses

    public class Service {
        public String Host { get; set; }
        public Int32 Port { get; set; }
    }

    #endregion
}