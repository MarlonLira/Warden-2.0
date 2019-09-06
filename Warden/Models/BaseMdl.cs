using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Warden.Models
{
    public abstract class BaseMdl
    {
      
    }
    
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
}