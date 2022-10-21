using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramacionAvanzadaTareaN1.Entidades
{
    public class Matricula
    {
        public string IdEstudiante { get; set; }
        public int IdCurso { get; set; }
        public DateTime FMatricula { get; set; }
        public int Cuatrimestre { get; set; }
        public decimal Costo { get; set; }
    }
}
