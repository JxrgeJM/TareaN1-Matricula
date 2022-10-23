using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProgramacionAvanzadaTareaN1.Entidades;
using ProgramacionAvanzadaTareaN1.Datos;

namespace ProgramacionAvanzadaTareaN1.LogicaNegocio
{
    public class AdministradorMatricula
    {
        public static List<Matricula> ListarPorEstudiante(int pCuatrimestre, string pIdEstudiante)
        {
            return MatriculaDAL.ListarPorEstudiante(pCuatrimestre, pIdEstudiante);
        }

        public static List<Matricula> Listar(int pCuatrimestre)
        {
            return MatriculaDAL.Listar(pCuatrimestre);
        }

        public static void Agregar(Matricula pMatricula)
        {
            MatriculaDAL.Agregar(pMatricula);
        }

        public static void Borrar(Matricula pMatricula)
        {
            MatriculaDAL.Borrar(pMatricula);
        }

        #region CONSULTAS

        public static List<Estudiante> ConsultaMatriculadosPorCurso(int pCuatrimestre, int pIdCurso)
        {
            return MatriculaDAL.ConsultaMatriculadosPorCurso(pCuatrimestre, pIdCurso);
        }

        public static decimal ConsultaIngresos(int pCuatrimestre)
        {
            return MatriculaDAL.ConsultaIngresos(pCuatrimestre);
        }

        public static int ConsultaCantidadCursosMatriculados(int pCuatrimestre)
        {
            return MatriculaDAL.ConsultaCantidadCursosMatriculados(pCuatrimestre);
        }

        #endregion

    }
}
