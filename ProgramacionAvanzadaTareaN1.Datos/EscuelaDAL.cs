using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using ProgramacionAvanzadaTareaN1.Entidades;


namespace ProgramacionAvanzadaTareaN1.Datos
{
    public class EscuelaDAL
    {
        public static List<Escuela> Listar()
        {
            SqlCommand vCmd = new SqlCommand("SP_ListarTipoEscuela", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            try
            {
                Conexion.getCnxMatricula().Open();
                SqlDataReader vRd = vCmd.ExecuteReader();
                List<Escuela> vCatalogo = new List<Escuela>();
                while (vRd.Read())
                    vCatalogo.Add(new Escuela(vRd.GetInt32(0), vRd.GetString(1)));
                vRd.Close();
                return vCatalogo;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                Conexion.getCnxMatricula().Close();
            }
        }

    }
}
