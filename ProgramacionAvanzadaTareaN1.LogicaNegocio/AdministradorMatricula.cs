﻿using System;
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
        public static void Agregar(Matricula pMatricula)
        {
            MatriculaDAL.Agregar(pMatricula);
        }

        public static void Borrar(Matricula pMatricula)
        {
            MatriculaDAL.Borrar(pMatricula);
        }
    }
}