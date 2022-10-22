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
    public partial class ViewEstudiantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarEstudiantes();
                LimpiarModal();
            }
        }

        protected void GridViewEstudiantes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewEstudiantes.PageIndex = e.NewPageIndex;
            CargarEstudiantes();
        }
        protected void GridViewEstudiantes_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBoxId.Text = HttpUtility.HtmlDecode(GridViewEstudiantes.SelectedRow.Cells[0].Text); 
            TextBoxNombre.Text = HttpUtility.HtmlDecode(GridViewEstudiantes.SelectedRow.Cells[1].Text);
            TextBoxApellido1.Text = HttpUtility.HtmlDecode(GridViewEstudiantes.SelectedRow.Cells[2].Text);
            TextBoxApellido2.Text = HttpUtility.HtmlDecode(GridViewEstudiantes.SelectedRow.Cells[3].Text);
            TextBoxNacimiento.Text = HttpUtility.HtmlDecode(GridViewEstudiantes.SelectedRow.Cells[4].Text);
            TextBoxIngreso.Text = HttpUtility.HtmlDecode(GridViewEstudiantes.SelectedRow.Cells[5].Text);
            TextBoxId.Enabled = false;
            TextBoxNombre.Enabled = false;
            TextBoxApellido1.Enabled = false;
            TextBoxApellido2.Enabled = false;
            TextBoxNacimiento.Enabled = false;
            ButtonAceptar.Enabled = false;
            ModalPopupExtender1.Show();
        }

        protected void CargarEstudiantes()
        {
            try
            {
                Session["ListaEstudiantes"] = AdministradorEstudiante.Listar();
                GridViewEstudiantes.DataSource = Session["ListaEstudiantes"];
                GridViewEstudiantes.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void ButtonBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                GridViewEstudiantes.DataSource = ((List<Estudiante>)Session["ListaEstudiantes"]).Where(p => p.Identificacion.Contains(TextBoxBuscar.Text)).ToList();
                GridViewEstudiantes.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void ButtonAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Estudiante vEstudiante = new Estudiante(
                    TextBoxId.Text.ToUpper(),
                    TextBoxNombre.Text.ToUpper(),
                    TextBoxApellido1.Text.ToUpper(),
                    TextBoxApellido2.Text.ToUpper(),
                    DateTime.ParseExact(TextBoxNacimiento.Text, "dd/MM/yyyy", null),
                    DateTime.Now);
                AdministradorEstudiante.Agregar(vEstudiante);
                ((Site)Page.Master).Alerta("Estudiante agregado.", 1);
                CargarEstudiantes();
                LimpiarModal();

            }
            catch (SqlException ex) when (ex.Number == 2627)
            {
                ((Site)Page.Master).Alerta("Estudiante ya existe.", 2);
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

        protected void LimpiarModal()
        {
            TextBoxId.Text = "";
            TextBoxNombre.Text = "";
            TextBoxApellido1.Text = "";
            TextBoxApellido2.Text = "";
            TextBoxNacimiento.Text = "";
            TextBoxIngreso.Text = DateTime.Now.ToString("dd/MM/yyyy");
            TextBoxIngreso.Enabled = false;
            TextBoxId.Enabled = true;
            TextBoxNombre.Enabled = true;
            TextBoxApellido1.Enabled = true;
            TextBoxApellido2.Enabled = true;
            TextBoxNacimiento.Enabled = true;
            ButtonAceptar.Enabled = true;
            GridViewEstudiantes.SelectedIndex = -1;
        }
    }
}