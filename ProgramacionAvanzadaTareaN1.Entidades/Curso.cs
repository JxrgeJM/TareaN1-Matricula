using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramacionAvanzadaTareaN1.Entidades
{
    public class Curso
    {
        public Curso()
        {
            Id = 0;
            Nombre = "";
            Descripcion = "";
            Costo = 0;
            Escuela = new Escuela();
        }

        public Curso(int id, string nombre, string descripcion, decimal costo, Escuela escuela)
        {
            Id = id;
            Nombre = nombre;
            Descripcion = descripcion;
            Costo = costo;
            Escuela = escuela;
        }

        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Costo { get; set; }
        public Escuela Escuela { get; set; }

        public override string ToString()
        {
            return Nombre;
        }
    }
}
