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
    public class MatriculaDAL
    {
        public static List<Matricula> ListarPorEstudiante(int pCuatrimestre, string pIdEstudiante)
        {
            SqlCommand vCmd = new SqlCommand("SP_ListarMatriculaEstudiante", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pCuatrimestre", pCuatrimestre);
            vCmd.Parameters.AddWithValue("@pEstudiante", pIdEstudiante);
            try
            {
                Conexion.getCnxMatricula().Open();
                SqlDataReader vRd = vCmd.ExecuteReader();
                List<Matricula> vDatos = new List<Matricula>();
                Estudiante vEstudiante = null;
                Curso vCurso = null;
                while (vRd.Read())
                {
                    vEstudiante = new Estudiante() { Identificacion = vRd.GetString(0) };
                    vCurso = new Curso() { Id = vRd.GetInt32(1), Nombre = vRd.GetString(5), Descripcion = vRd.GetString(6) };
                    vDatos.Add(new Matricula(vEstudiante, vCurso, vRd.GetDateTime(3), vRd.GetInt32(2), vRd.GetDecimal(4)));
                }
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

        public static List<Matricula> Listar(int pCuatrimestre)
        {
            SqlCommand vCmd = new SqlCommand("SP_ListarMatricula", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pCuatrimestre", pCuatrimestre);
            try
            {
                Conexion.getCnxMatricula().Open();
                SqlDataReader vRd = vCmd.ExecuteReader();
                List<Matricula> vDatos = new List<Matricula>();
                while (vRd.Read())
                    vDatos.Add(new Matricula(new Estudiante() { Identificacion = vRd.GetString(0) }, new Curso() { Id = vRd.GetInt32(1) } , vRd.GetDateTime(3), vRd.GetInt32(2), vRd.GetDecimal(4)));
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

        public static void Agregar(Matricula pMatricula)
        {
            SqlCommand vCmd = new SqlCommand("SP_AgregarMatricula", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pEstudiante", pMatricula.Estudiante.Identificacion);
            vCmd.Parameters.AddWithValue("@pCurso", pMatricula.Curso.Id);
            vCmd.Parameters.AddWithValue("@pCuatrimestre", pMatricula.Cuatrimestre);
            vCmd.Parameters.AddWithValue("@pFMatricula", pMatricula.FMatricula);
            vCmd.Parameters.AddWithValue("@pCosto", pMatricula.Costo);
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

        public static void Borrar(Matricula pMatricula)
        {
            SqlCommand vCmd = new SqlCommand("SP_BorrarMatricula", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pEstudiante", pMatricula.Estudiante.Identificacion);
            vCmd.Parameters.AddWithValue("@pCurso", pMatricula.Curso.Id);
            vCmd.Parameters.AddWithValue("@pCuatrimestre", pMatricula.Cuatrimestre);
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


        #region CONSULTAS

        public static List<Estudiante> ConsultaMatriculadosPorCurso(int pCuatrimestre, int pIdCurso)
        {
            SqlCommand vCmd = new SqlCommand("SP_ConsultaMatriculadosCuatrimestre", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pCuatrimestre", pCuatrimestre);
            vCmd.Parameters.AddWithValue("@pIdCurso", pIdCurso);
            try
            {
                Conexion.getCnxMatricula().Open();
                SqlDataReader vRd = vCmd.ExecuteReader();
                List<Estudiante> vDatos = new List<Estudiante>();
                while (vRd.Read())
                {
                    vDatos.Add(new Estudiante(vRd.GetString(0), vRd.GetString(1), vRd.GetString(2), vRd.GetString(3), vRd.GetDateTime(4), vRd.GetDateTime(5)));
                }
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

        public static decimal ConsultaIngresos(int pCuatrimestre)
        {
            SqlCommand vCmd = new SqlCommand("SP_ConsultaIngresosCuatrimestre", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pCuatrimestre", pCuatrimestre);
            try
            {
                Conexion.getCnxMatricula().Open();
                SqlDataReader vRd = vCmd.ExecuteReader();
                decimal vDato = 0;
                while (vRd.Read())
                {
                    vDato = vRd.GetDecimal(0);
                }
                vRd.Close();
                return vDato;
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

        public static int ConsultaCantidadCursosMatriculados(int pCuatrimestre)
        {
            SqlCommand vCmd = new SqlCommand("SP_ConsultaCantidadCursosMatriculados", Conexion.getCnxMatricula());
            vCmd.CommandType = CommandType.StoredProcedure;
            vCmd.Parameters.Clear();
            vCmd.Parameters.AddWithValue("@pCuatrimestre", pCuatrimestre);
            try
            {
                Conexion.getCnxMatricula().Open();
                SqlDataReader vRd = vCmd.ExecuteReader();
                int vDato = 0;
                while (vRd.Read())
                {
                    vDato = vRd.GetInt32(0);
                }
                vRd.Close();
                return vDato;
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

        #endregion

    }
}
