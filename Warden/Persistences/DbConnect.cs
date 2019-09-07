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

        #region Atributes

        private string CreateGestorCon = ConfigurationManager.ConnectionStrings["gestor2"].ConnectionString;
        private string CreateWardenCon = ConfigurationManager.ConnectionStrings["warden"].ConnectionString;

        public SqlConnection Con;
        public SqlCommand Sql;
        public SqlDataAdapter Adapt;

        #endregion

        #region Methods

        public void ExecuteNonQuery(String Query, String Atributes, SqlParameter [] SqlParameters) {
            Sql = new SqlCommand();
            OpenCon();
            Sql.Connection = Con;
            Sql.CommandText = Query + Atributes;
            Sql.Parameters.AddRange(SqlParameters);
            
            Sql.ExecuteNonQuery();
            CloseCon();

        }

        public void ExecuteNonQuery(String Query) {
            Sql = new SqlCommand();
            OpenCon();
            Sql.CommandText = Query;
            Sql.ExecuteNonQuery();
            CloseCon();
        }

        public DataTable ExecuteReader(String Query, String Atributes, SqlParameter[] SqlParameters) {
            DataTable Result = new DataTable();
            Sql = new SqlCommand();

            OpenCon();
            Sql.CommandText = Query + Atributes;
            Sql.Parameters.AddRange(SqlParameters);
            OpenAdpter(Sql.CommandText);
            Adapt.Fill(Result);
            CloseCon();

            return Result;
        }

        public DataTable ExecuteReader(String Query) {
            DataTable Result = new DataTable();
            Sql = new SqlCommand();

            OpenCon();
            Sql.CommandText = Query;
            OpenAdpter(Sql.CommandText);
            Adapt.Fill(Result);
            CloseCon();

            return Result;
        }
    
        public void OpenCon() {
            Con = new SqlConnection(CreateWardenCon);
            Sql = new SqlCommand();
            Sql.CommandType = CommandType.Text;
            Sql.CommandTimeout = 600;
            Con.Open();
        }

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

        #endregion
    }

    #region SubClasses
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
            NewDbConnect = DbConnect;
            return NewDbConnect;
        }
    }

    public static class SqlParameters {

        public static SqlParameter CreateVarcharParameter(String ParamName, Int32 Size, String Value) {
            SqlParameter Parameter = new SqlParameter();
            if (String.IsNullOrEmpty(Value)) {
                Parameter.DbType = DbType.String;
                Parameter.ParameterName = ParamName;
                Parameter.SqlValue = Value;
                Parameter.Value = Value;
                Parameter.Size = Size;
            } else {
                Parameter.DbType = DbType.String;
                Parameter.ParameterName = ParamName;
                Parameter.SqlValue = DBNull.Value;
                Parameter.Value = DBNull.Value;
                Parameter.Size = Size;
            }

            return Parameter;
        }


        public static SqlParameter CreateIntegerParameter(String ParamName, Int32 Value) {

            SqlParameter Parameter = new SqlParameter();
            if (Value > 0) {
                Parameter.DbType = DbType.Int32;
                Parameter.ParameterName = ParamName;
                Parameter.SqlValue = Value;
                Parameter.Value = Value;

            } else {
                Parameter.DbType = DbType.Int32;
                Parameter.ParameterName = ParamName;
                Parameter.SqlValue = 0;
                Parameter.Value = 0;

            }

            return Parameter;
        }

        public static SqlParameter CreateSingleParameter(String ParamName, Single Value) {
            SqlParameter Parameter = new SqlParameter();
            if (Value > 0) {
                Parameter.DbType = DbType.Single;
                Parameter.ParameterName = ParamName;
                Parameter.SqlValue = Value;
                Parameter.Value = Value;

            } else {
                Parameter.DbType = DbType.Single;
                Parameter.ParameterName = ParamName;
                Parameter.SqlValue = 0;
                Parameter.Value = 0;

            }

            return Parameter;
        }

        public static SqlParameter CreateDateTimeParameter(String ParamName, DateTime Value) {
            SqlParameter Parameter = new SqlParameter();
            if (Value != null) {
                Parameter.DbType = DbType.DateTime;
                Parameter.ParameterName = ParamName;
                Parameter.SqlValue = Value;
                Parameter.Value = Value;

            } else {
                Parameter.DbType = DbType.DateTime;
                Parameter.ParameterName = ParamName;
                Parameter.SqlValue = DbType.DateTime;
                Parameter.Value = DbType.DateTime;

            }

            return Parameter;
        }
    }

    #endregion
}