using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;

namespace ProgramacionAvanzadaTareaN1.Datos
{
    public class Conexion
    {
        private static SqlConnection _cnxMatricula = null;
        public static SqlConnection getCnxMatricula()
        {
            if (_cnxMatricula == null)
                _cnxMatricula = new SqlConnection(ConfigurationManager.ConnectionStrings["CnxMaricula"].ConnectionString);
            return _cnxMatricula;
        }
    }
}
