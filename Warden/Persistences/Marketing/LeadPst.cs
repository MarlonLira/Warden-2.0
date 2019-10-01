using System;
using System.Data;
using Warden.Interfaces;
using Warden.Models.Marketing;

namespace Warden.Persistences.Marketing {
    public class LeadPst : Lead, IEntitie {

        private const String COMMON_ATTRIBUTES = "@auditoria, @status, @nome, @telefone, @email, @tipo, @estagio, @data_cadastro, @observacao";

        public string Delete() {
            throw new NotImplementedException();
        }

        public string Save() {
            throw new NotImplementedException();
        }

        public DataTable Search() {
            throw new NotImplementedException();
        }

        public string Update() {
            throw new NotImplementedException();
        }
    }
}