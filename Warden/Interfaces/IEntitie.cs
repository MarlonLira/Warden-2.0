using System;
using System.Data;
using Warden.Persistences;

namespace Warden.Interfaces
{
    interface IEntitie
    {
        DataTable Search();
        String Save();
        String Update();
        String Delete();
    }
}
