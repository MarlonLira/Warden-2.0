using System;
using System.Data;
using System.Data.SqlClient;
using Warden.Interfaces;

namespace Warden.Persistences.Marketing
{
    public class TypePst : Models.Marketing.Type, IEntitie
    {
        private const String COMMON_ATTRIBUTES = "@auditoria, @status, @nome";
        public string Delete() {
            throw new NotImplementedException();
        }

        public string Save() {
            String Result = "Falha ao tentar cadastrar o tipo, verifique os dados informados!";
            String Query = "EXEC [marketing].[stp_tipo_salvar] @id OUTPUT, ";
            Int32 NewId = (Int32)DbType.Int32;
            try {

                Sql.ExecuteNonQuery(Query, COMMON_ATTRIBUTES, new SqlParameter[] {
                     new SqlParameter("@id", NewId),
                     new SqlParameter("@auditoria", this.Audit),
                     new SqlParameter("@status", this.Status),
                     new SqlParameter("@nome", this.Name)
                });

                Result = "O tipo foi cadastrado com sucesso!";
            } catch (Exception Except) {
                throw new Exception(Result + " - " + Except.Message);
            }
            return Result;
        }

        public DataTable Search() {
            DataTable Table;
            String Query = "EXEC [marketing].[stp_tipo_pesquisar]";
          
            Table = Sql.ExecuteReader(Query);

            return Table;
        }

        public string Update() {
            throw new NotImplementedException();
        }
    }
}