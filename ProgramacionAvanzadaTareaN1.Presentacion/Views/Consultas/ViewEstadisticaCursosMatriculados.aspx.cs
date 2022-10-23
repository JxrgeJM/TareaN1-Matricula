using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProgramacionAvanzadaTareaN1.LogicaNegocio;

namespace ProgramacionAvanzadaTareaN1.Presentacion.Views.Consultas
{
    public partial class ViewEstadisticaCursosMatriculados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEstadisticaMatricula();
            }
        }

        protected void CargarEstadisticaMatricula()
        {
            try
            {
                int vCantCursos = AdministradorCurso.Listar().Count();
                int vCantMatriculados = AdministradorMatricula.ConsultaCantidadCursosMatriculados(int.Parse(DropDownListPeriodo.SelectedValue));
                decimal vPorcentaje = (vCantMatriculados * 100) / vCantCursos;
                LabelEstadistica.Text = $"De un total de {vCantCursos} cursos disponibles, se matricularon en {vCantMatriculados}, para un {vPorcentaje}% de la cartera curricular.";
            }
            catch (Exception)
            {
            }
        }
    }
}