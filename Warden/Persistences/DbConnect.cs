using System;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;

namespace Warden.Persistences {
    public class DbConnect : DbContext {

        public DbConnect()
        : base("warden") {
        }
        
        private string CreateGestorCon = ConfigurationManager.ConnectionStrings["gestor2"].ConnectionString;
        private string CreateWardenCon = ConfigurationManager.ConnectionStrings["warden"].ConnectionString;

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

    public static class Connection {
        public static DbConnect VerifyAndConnect(DbConnect DbConnect, String Sql) {
            DbConnect NewDbConnect = DbConnect;

            if (NewDbConnect == null) {
                NewDbConnect = new DbConnect();
                if (Sql.ToUpperInvariant() == "GESTOR2") {
                    DbConnect.OpenGestorCon();
                } else {
                    DbConnect.OpenWardenCon();
                }
            }

            return NewDbConnect;
        }

    }
}