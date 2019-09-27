using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Warden.Models
{
    public class ResultEvent
    {
        public ResultEvent(String Text) {
            this.Text = Text;
        }

        public ResultEvent() { }
        public String Text { get; set; }
    }
}