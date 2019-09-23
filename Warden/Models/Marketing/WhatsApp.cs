using System;

namespace Warden.Models {
    public class WhatsApp: Messages {

        #region Atributes

        public String Description { get; set; }
        public API Api { get; set; }

        #endregion
    }

    #region SubClasses

    public class API {
        public String Token { get; set; }
        public String Url { get; set; }
    }

    #endregion
}