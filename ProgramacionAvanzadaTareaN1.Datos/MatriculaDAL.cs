﻿using System;
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
                    vDatos.Add(new Matricula(vRd.GetString(0), vRd.GetInt32(1), vRd.GetDateTime(2), vRd.GetInt32(3), vRd.GetDecimal(4)));
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
            vCmd.Parameters.AddWithValue("@pEstudiante", pMatricula.IdEstudiante);
            vCmd.Parameters.AddWithValue("@pCurso", pMatricula.IdCurso);
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
            vCmd.Parameters.AddWithValue("@pEstudiante", pMatricula.IdEstudiante);
            vCmd.Parameters.AddWithValue("@pCurso", pMatricula.IdCurso);
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

    }
}
