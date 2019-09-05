using System;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;

namespace Warden.Persistences
{
    public class DbConnect : DbContext
    {

        public DbConnect()
        : base("warden") {
        }
        
        public string CreateGestorCon = ConfigurationManager.ConnectionStrings["gestor2"].ConnectionString;
        public string CreateWardenCon = ConfigurationManager.ConnectionStrings["warden"].ConnectionString;

        public SqlConnection Con;
        public SqlCommand Sql;
        public SqlDataAdapter Adapt;

        public void OpenGestorCon() {
            Con = new SqlConnection(CreateGestorCon);
            Sql = new SqlCommand();
            Sql.CommandType = CommandType.Text;
            Sql.CommandTimeout = 600;
            Con.Open();
        }
      
        public void OpenWardenCon() {
            Con = new SqlConnection(CreateWardenCon);
            Sql = new SqlCommand();
            Sql.CommandType = CommandType.Text;
            Sql.CommandTimeout = 600;
            Con.Open();
        }

        public void OpenAdpter(String Script) {
            Adapt = new SqlDataAdapter(Script, Con);
            Adapt.SelectCommand.CommandTimeout = 600;
        }

        public void CloseCon() {
            Con.Close();
        }
    }
}