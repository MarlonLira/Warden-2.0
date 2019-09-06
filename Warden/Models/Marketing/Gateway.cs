using System;

namespace Warden.Models {
    public abstract class Gateway : BaseMdl {

        #region Atributes

        public Int32 Id { get; set; }
        public String Name { get; set; } 
        public String Status { get; set; }
        public String Audit { get; set; }
        public String Url { get; set; }
        public Single Credit { get; set; }

        #endregion
    }
}