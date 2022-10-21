using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProgramacionAvanzadaTareaN1.Entidades;
using ProgramacionAvanzadaTareaN1.Datos;

namespace ProgramacionAvanzadaTareaN1.LogicaNegocio
{
    public class AdministradorCurso
    {
        public static List<Curso> Listar()
        {
            return CursoDAL.Listar();
        }

        public static void Agregar(Curso pCurso)
        {
            CursoDAL.Agregar(pCurso);
        }

    }
}
