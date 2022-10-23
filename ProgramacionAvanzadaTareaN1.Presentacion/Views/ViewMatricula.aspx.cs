using System;
using System.Collections.Generic;
using System.Data.SqlClient;
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
                CargarCursosMatriculados();
                LimpiarModal();
            }
        }

        protected void ButtonBuscar_Click(object sender, EventArgs e)
        {
            CargarCursosMatriculados();
        }

        protected void GridViewMatriculados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewMatriculados.SelectedIndex = e.NewPageIndex;
            CargarCursosMatriculados();
        }

        protected void GridViewMatriculados_SelectedIndexChanged(object sender, EventArgs e)
        {
            int vCursoId = (int)GridViewMatriculados.SelectedDataKey.Value;
            Curso vCurso = ((List<Curso>)Session["ListaCursos"]).Where(p => p.Id == vCursoId).FirstOrDefault();
            if (vCurso != null)
            {
                DropDownListEscuela.SelectedValue = vCurso.Escuela.Id.ToString();
                CargarCursos();
                DropDownListCursos.SelectedValue = vCurso.Id.ToString();
                TextBoxDescripcion.Text = vCurso.Descripcion;
                TextBoxCosto.Text = vCurso.Costo.ToString();
                DropDownListEscuela.Enabled = false;
                DropDownListCursos.Enabled = false;
                TextBoxDescripcion.Enabled = false;
                TextBoxCosto.Enabled = false;
                ButtonAceptar.Enabled = false;
                ModalPopupExtender1.Show();
            }
        }

        protected void GridViewMatriculados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                string vCommandName = e.CommandName;
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewMatriculados.SelectedIndex = index;
                if (vCommandName == "Borrar")
                {
                    Matricula vMatricula = new Matricula()
                    {
                        Estudiante = new Estudiante() { Identificacion = DropDownListEstudiantes.SelectedValue },
                        Curso = new Curso() { Id = (int)GridViewMatriculados.SelectedDataKey.Value },
                        Cuatrimestre = int.Parse(DropDownListPeriodo.SelectedValue)
                    };
                    AdministradorMatricula.Borrar(vMatricula);
                    ((Site)Page.Master).Alerta("Curso quitado.", 1);
                    CargarCursosMatriculados();
                }
            }
            catch (Exception)
            {
            }
        }

        protected void ButtonAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Curso vCurso = ((List<Curso>)Session["ListaCursos"]).Where(p => p.Id == int.Parse(DropDownListCursos.SelectedValue)).FirstOrDefault();
                Matricula vMatricula = new Matricula( new Estudiante() { Identificacion = DropDownListEstudiantes.SelectedValue },
                    vCurso,
                    DateTime.Now,
                    int.Parse(DropDownListPeriodo.SelectedValue),
                    vCurso.Costo);
                AdministradorMatricula.Agregar(vMatricula);
                ((Site)Page.Master).Alerta("Curso matriculado.", 1);
                CargarCursosMatriculados();
                LimpiarModal();
            }
            catch (SqlException ex) when (ex.Number == 2627)
            {
                ((Site)Page.Master).Alerta("Curso ya matriculado.", 2);
            }
            catch (Exception)
            {
                ((Site)Page.Master).Alerta("Error al agregar.", 3);
            }
        }

        protected void ButtonCancelar_Click(object sender, EventArgs e)
        {
            LimpiarModal();
        }

        protected void DropDownListEscuela_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCursos();
            ModalPopupExtender1.Show();
        }

        protected void DropDownListCursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarDetalleCurso();
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
                if (Session["ListaCursos"] == null)
                    Session["ListaCursos"] = AdministradorCurso.Listar();
                DropDownListCursos.DataSource = ((List<Curso>)Session["ListaCursos"]).Where(p => p.Escuela.Id.ToString() == DropDownListEscuela.SelectedValue.ToString()).ToList();
                DropDownListCursos.DataBind();

                CargarDetalleCurso();
            }
            catch (Exception)
            {
            }
        }

        protected void CargarDetalleCurso()
        {
            try
            {
                Curso vCurso = ((List<Curso>)Session["ListaCursos"]).Where(p => p.Id == int.Parse(DropDownListCursos.SelectedValue)).FirstOrDefault();
                TextBoxDescripcion.Text = vCurso.Descripcion;
                TextBoxCosto.Text = vCurso.Costo.ToString();
            }
            catch (Exception)
            {
                TextBoxDescripcion.Text = "";
                TextBoxCosto.Text = "";
            }
        }


        protected void CargarCursosMatriculados()
        {
            try
            {
                List<Matricula> vMatriculados = AdministradorMatricula.ListarPorEstudiante(int.Parse(DropDownListPeriodo.SelectedValue), DropDownListEstudiantes.SelectedValue);
                GridViewMatriculados.DataSource = vMatriculados;
                GridViewMatriculados.DataBind();

                CalcularCostoTotal(vMatriculados);
            }
            catch (Exception)
            {
            }
        }

        protected void CalcularCostoTotal(List<Matricula> pMatriculados)
        {
            try
            {
                decimal vCostoTotal = pMatriculados.Sum(p => p.Costo);
                LabelCTotal.Text = $"Costo Total: {vCostoTotal:C}";
            }
            catch (Exception)
            {
            }
        }

        protected void LimpiarModal()
        {
            GridViewMatriculados.SelectedIndex = -1;
            DropDownListEscuela.SelectedIndex = -1;
            DropDownListCursos.SelectedIndex = -1;
            TextBoxDescripcion.Text = "";
            TextBoxCosto.Text = "";
            DropDownListEscuela.Enabled = true;
            DropDownListCursos.Enabled = true;
            TextBoxDescripcion.Enabled = true;
            TextBoxCosto.Enabled = true;
            ButtonAceptar.Enabled = true;
            CargarDetalleCurso();
        }

    }
}