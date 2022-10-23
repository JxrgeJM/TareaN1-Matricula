using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProgramacionAvanzadaTareaN1.Entidades;
using ProgramacionAvanzadaTareaN1.LogicaNegocio;

namespace ProgramacionAvanzadaTareaN1.Presentacion.Views.Consultas
{
    public partial class ViewEstudiantesPorCurso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarCursos();
                CargarMatriculados();
            }
        }

        protected void DropDownCurso_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarMatriculados();
        }

        protected void GridViewMatriculados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewMatriculados.PageIndex = e.NewPageIndex;
            CargarMatriculados();
        }

        protected void CargarCursos()
        {
            try
            {
                DropDownCurso.DataSource = AdministradorCurso.Listar().OrderBy(p => p.Nombre).ToList();
                DropDownCurso.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void CargarMatriculados()
        {
            try
            {
                GridViewMatriculados.DataSource = AdministradorMatricula.ConsultaMatriculadosPorCurso(int.Parse(DropDownListPeriodo.SelectedValue), int.Parse(DropDownCurso.SelectedValue));
                GridViewMatriculados.DataBind();
            }
            catch (Exception)
            {
            }
        }
       
    }
}