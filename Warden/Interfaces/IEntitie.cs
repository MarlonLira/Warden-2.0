using System;
using System.Data;

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
