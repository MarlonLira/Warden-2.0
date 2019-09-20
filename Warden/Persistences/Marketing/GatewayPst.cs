using System;
using System.Data;
using System.Data.SqlClient;
using Warden.Interfaces;
using Warden.Models;
using Warden.Persistences.Marketing;

namespace Warden.Persistences {
    public class GatewayPst : Gateway, IEntitie {

        private const String COMMON_ATTRIBUTES = " @auditoria, @status, @nome, @url, @saldo, @usuario, @senha, @token, @tipo_id";

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
            String Result = "Falha ao tentar cadastrar o gateway, verifique os dados informados!";
            String Query = "EXEC [marketing].[stp_gateway_salvar] @id OUTPUT, ";
            Int32 NewId = (Int32)DbType.Int32;
            try {
                DbConnect = new DbConnect();

                DbConnect.ExecuteNonQuery(Query, COMMON_ATTRIBUTES, new SqlParameter[] {
                     new SqlParameter("@id", NewId),
                     new SqlParameter("@auditoria", this.Audit),
                     new SqlParameter("@status", this.Status),
                     new SqlParameter("@nome", this.Name),
                     new SqlParameter("@url", this.Url),
                     new SqlParameter("@saldo", this.Credit),
                     new SqlParameter("@usuario", this.User),
                     new SqlParameter("@senha", this.Pass),
                     new SqlParameter("@token", this.Token),
                     new SqlParameter("@tipo_id", this.Type.Id)
                });

                Result = "O gateway foi cadastrado com sucesso!";
            } catch(Exception Except) {
                throw new Exception(Result +  " - " + Except.Message);
            }
            return Result;
        }

        public DataTable Search() {
            DataTable Table;
            String Query = "EXEC [marketing].[stp_gateway_pesquisar]";

            DbConnect = new DbConnect();
            Table = DbConnect.ExecuteReader(Query);

            return Table;
        }

        public DataRow Search(Int32 Id) {
            DataTable Table;
            String Query = "EXEC [marketing].[stp_gateway_pesquisar] " + Convert.ToString(Id);

            DbConnect = new DbConnect();
            Table = DbConnect.ExecuteReader(Query);

            return Table.Rows[0];
        }

        public DataTable Search(TypePst Type) {
            DataTable Table;
            String Query = "EXEC [marketing].[stp_gateway_pesquisar] NULL, " + Convert.ToString(Type.Id);

            DbConnect = new DbConnect();
            Table = DbConnect.ExecuteReader(Query);

            return Table;
        }

        public string Update() {
            throw new NotImplementedException();
        }
    }
}