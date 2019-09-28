using System;

namespace Warden.Models.Marketing {
    public class Lead : BaseMdl {

        #region Enuns

        public enum LeadType {
            Seeds,
            Nets,
            Spears
        }

        public enum LeadStage {
            Suspect,
            Prospect,
            Qualified
        }

        #endregion

        public String Name { get; set; }
        public String Phone { get; set; }
        public String Email { get; set; }
        public LeadType Type { get; set; }
        public LeadStage Stage { get; set; }
    }
}