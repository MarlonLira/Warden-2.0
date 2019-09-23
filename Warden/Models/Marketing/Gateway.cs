using System;
using Warden.Persistences.Marketing;

namespace Warden.Models {
    public abstract class Gateway : BaseMdl {

        #region Atributes

        public String Name { get; set; }
        public String Url { get; set; }
        public Single Credit { get; set; }
        public String User { get; set; }
        public String Pass { get; set; }
        public String Token { get; set; }
        public TypePst Type { get; set; }

        #endregion
    }
}