using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramacionAvanzadaTareaN1.Entidades
{
    public class Matricula
    {
        public Matricula(string idEstudiante, int idCurso, DateTime fMatricula, int cuatrimestre, decimal costo)
        {
            IdEstudiante = idEstudiante;
            IdCurso = idCurso;
            FMatricula = fMatricula;
            Cuatrimestre = cuatrimestre;
            Costo = costo;
        }

        public string IdEstudiante { get; set; }
        public int IdCurso { get; set; }
        public DateTime FMatricula { get; set; }
        public int Cuatrimestre { get; set; }
        public decimal Costo { get; set; }
    }
}
