using System;
using Warden.Persistences;

namespace Warden.Models {
    public abstract class BaseMdl
    {
        #region Atributes

        private DbConnect DbConnect { get; set; }
        protected DbConnect Sql {
            get {
                DbConnect SqlConnection = null;
                SqlConnection = DbConnect == null ? new DbConnect() : DbConnect;
                return SqlConnection;
            }
        }

        public Int32 Id { get; set; }
        public String Audit { get; set; }
        public String Status { get; set; }

        #endregion
    }

    #region SubClasses

    public static class StringValue
    {
        public static string GetStringValue(this Enum value) {
            var type = value.GetType();

            var fieldInfo = type.GetField(value.ToString());

            var attributes = fieldInfo.GetCustomAttributes(
                typeof(StringValueAttribute), false) as StringValueAttribute[];

            var stringvalue = attributes != null && attributes.Length > 0 ? attributes[0].StringValue : value.ToString();
            return stringvalue;
        }
    }


    public class StringValueAttribute : Attribute
    {
        public string StringValue { get; protected set; }

        public StringValueAttribute(string value) {
            StringValue = value;
        }
    }

    #endregion
}