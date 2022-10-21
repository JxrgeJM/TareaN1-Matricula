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
    public class CursoDAL
    {
        public static List<Curso> Listar()
        {
            SqlCommand vCmd = new SqlCommand("SP_ListarCursos", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            try
            {
                Conexion.getCnxMatricula().Open();
                SqlDataReader vRd = vCmd.ExecuteReader();
                List<Curso> vDatos = new List<Curso>();
                while (vRd.Read())
                    vDatos.Add(new Curso(vRd.GetInt32(0), vRd.GetString(1), vRd.GetString(2), vRd.GetDecimal(3), new Escuela(vRd.GetInt32(4), "")));
                vRd.Close();
                return vDatos;
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

        public static void Agregar(Curso pCurso)
        {
            SqlCommand vCmd = new SqlCommand("SP_AgregarCurso", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pNombre", pCurso.Nombre);
            vCmd.Parameters.AddWithValue("@pDescripcion", pCurso.Descripcion);
            vCmd.Parameters.AddWithValue("@pCosto", pCurso.Costo);
            vCmd.Parameters.AddWithValue("@pTipoEscuela", pCurso.Escuela.Id);
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

