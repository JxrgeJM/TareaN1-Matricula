using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramacionAvanzadaTareaN1.Entidades
{
    public class Estudiante
    {
        public Estudiante(string identificacion, string nombre, string apellido1, string apellido2, DateTime fnacimiento, DateTime fingreso)
        {
            Identificacion = identificacion;
            Nombre = nombre;
            Apellido1 = apellido1;
            Apellido2 = apellido2;
            FNacimiento = fnacimiento;
            FIngreso = fingreso;
        }

        public string Identificacion { get; set; }
        public string Nombre { get; set; }
        public string Apellido1 { get; set; }
        public string Apellido2 { get; set; }
        public DateTime FNacimiento { get; set; }
        public DateTime FIngreso { get; set; }

        public string NombreCompleto
        {
            get { return $"{Nombre} {Apellido1} {Apellido2}"; }
        }

    }
}
