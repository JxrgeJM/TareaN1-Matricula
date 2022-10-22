using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProgramacionAvanzadaTareaN1.Entidades;
using ProgramacionAvanzadaTareaN1.LogicaNegocio;

namespace ProgramacionAvanzadaTareaN1.Presentacion.Views
{
    public partial class ViewMatricula : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarEstudiantes();
                CargarEscuelas();
                CargarCursos();
                LimpiarModal();
            }
        }

        protected void ButtonBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void GridViewMatriculados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void GridViewMatriculados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonAceptar_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonCancelar_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownListEscuela_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCursos();
            ModalPopupExtender1.Show();
        }

        protected void DropDownListCursos_SelectedIndexChanged(object sender, EventArgs e)
        {

            ModalPopupExtender1.Show();
        }

        protected void CargarEstudiantes()
        {
            try
            {
                DropDownListEstudiantes.DataSource = AdministradorEstudiante.Listar().OrderBy(p => p.NombreCompleto).ToList();
                DropDownListEstudiantes.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void CargarEscuelas()
        {
            try
            {
                DropDownListEscuela.DataSource = AdministradorEscuela.Listar();
                DropDownListEscuela.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void CargarCursos()
        {
            try
            {
                DropDownListCursos.DataSource = AdministradorCurso.Listar().Where(p => p.Escuela.Id.ToString() == DropDownListEscuela.SelectedValue.ToString());
                DropDownListCursos.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void LimpiarModal()
        {

        }
    }
}