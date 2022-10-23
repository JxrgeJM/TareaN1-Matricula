using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProgramacionAvanzadaTareaN1.Entidades
{
    public class Matricula
    {
        public Matricula()
        {
        }

        public Matricula(Estudiante pEstudiante, Curso pCurso, DateTime fMatricula, int cuatrimestre, decimal costo)
        {
            Estudiante = pEstudiante;
            Curso = pCurso;
            FMatricula = fMatricula;
            Cuatrimestre = cuatrimestre;
            Costo = costo;
        }

        public Estudiante Estudiante { get; set; }
        public Curso Curso { get; set; }
        public DateTime FMatricula { get; set; }
        public int Cuatrimestre { get; set; }
        public decimal Costo { get; set; }


        public int CursoId
        {
            get { return Curso.Id; }
        }

        public string EstudianteId
        {
            get { return Estudiante.Identificacion; }
        }

    }
}
