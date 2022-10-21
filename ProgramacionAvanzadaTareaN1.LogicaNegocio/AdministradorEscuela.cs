using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProgramacionAvanzadaTareaN1.Entidades;
using ProgramacionAvanzadaTareaN1.Datos;

namespace ProgramacionAvanzadaTareaN1.LogicaNegocio
{
    public class AdministradorEscuela
    {
        public static List<Escuela> Listar()
        {
            return EscuelaDAL.Listar();
        }
    }
}
