using System;
using System.Data;
using System.Data.SqlClient;
using Warden.Interfaces;
using Warden.Models;

namespace Warden.Persistences {
    public class GatewayPst : Gateway, IEntitie {

        private DbConnect DbConnect { get; set; }
        private SqlCommand Sql {
            get {
                return Connection.VerifyAndConnect(DbConnect, "WARDEN").Sql;
            }
        }
        public string Delete() {
            throw new NotImplementedException();
        }

        public string Save() {
            throw new NotImplementedException();
        }

        public DataTable Search() {
            DataTable Table;
            String Query = "EXEC [marketing].[stp_gateway_pesquisar]";
            DbConnect = new DbConnect();
            Table = DbConnect.ExecuteReader(Query);
            
            /*
            DbConnect.OpenWardenCon();
            Table = new DataTable();
            DbConnect.OpenAdpter("EXEC [marketing].[stp_gateway_pesquisar]");
            DbConnect.Adapt.Fill(Table);
            DbConnect.CloseCon();*/

            return Table;
            
        }

        public DataRow Search(Int32 Id) {
            DataTable Table;
            String Query = "EXEC [marketing].[stp_gateway_pesquisar] " + Convert.ToString(Id);
            DbConnect = new DbConnect();
            Table = DbConnect.ExecuteReader(Query);

            /*
            DbConnect.OpenWardenCon();
            Table = new DataTable();
            DbConnect.OpenAdpter("EXEC [marketing].[stp_gateway_pesquisar]");
            DbConnect.Adapt.Fill(Table);
            DbConnect.CloseCon();*/

            return Table.Rows[0];

        }

        public string Update() {
            throw new NotImplementedException();
        }
    }
}