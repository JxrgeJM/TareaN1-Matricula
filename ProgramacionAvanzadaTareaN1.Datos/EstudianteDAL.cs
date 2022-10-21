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
    public class EstudianteDAL
    {
        public static List<Estudiante> Listar()
        {
            SqlCommand vCmd = new SqlCommand("SP_ListarEstudiantes", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            try
            {
                Conexion.getCnxMatricula().Open();
                SqlDataReader vRd = vCmd.ExecuteReader();
                List<Estudiante> vCatalogo = new List<Estudiante>();
                while (vRd.Read())
                    vCatalogo.Add(new Estudiante(vRd.GetString(0), vRd.GetString(1), vRd.GetString(2), vRd.GetString(3), vRd.GetDateTime(4), vRd.GetDateTime(5)));
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

        public static void Agregar(Estudiante pEstudiante)
        {
            SqlCommand vCmd = new SqlCommand("SP_AgregarEstudiante", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pIdentificacion", pEstudiante.Identificacion);
            vCmd.Parameters.AddWithValue("@pNombre", pEstudiante.Nombre);
            vCmd.Parameters.AddWithValue("@pApellido1", pEstudiante.Apellido1);
            vCmd.Parameters.AddWithValue("@pApellido2", pEstudiante.Apellido2);
            vCmd.Parameters.AddWithValue("@pFNacimiento", pEstudiante.FNacimiento);
            vCmd.Parameters.AddWithValue("@pFIngreso", pEstudiante.FIngreso);
            try
            {
                Conexion.getCnxMatricula().Open();
                vCmd.ExecuteNonQuery();
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
