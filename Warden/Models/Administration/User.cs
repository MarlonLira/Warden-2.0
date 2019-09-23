using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Warden.Models.Administration {
    public abstract class User : BaseMdl{

        public String Name { get; set; }
        public String RegistryCode { get; set; }
        public String Email { get; set; }
        public String Pass { get; set; }
    }
}