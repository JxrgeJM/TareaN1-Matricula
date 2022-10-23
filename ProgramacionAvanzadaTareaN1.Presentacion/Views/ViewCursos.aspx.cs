using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProgramacionAvanzadaTareaN1.Entidades;
using ProgramacionAvanzadaTareaN1.LogicaNegocio;

namespace ProgramacionAvanzadaTareaN1.Presentacion.Views
{
    public partial class ViewCursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                CargarEscuelas();
                CargarCursos();
                LimpiarModal();
            }
        }

        protected void CargarCursos()
        {
            try
            {
                GridViewCursos.DataSource = AdministradorCurso.Listar()
                    .Where(p => p.Escuela.Id == int.Parse(DropDownListEscuela1.SelectedValue) &&
                            (p.Id.ToString().Contains(TextBoxBuscar.Text) ||
                            p.Nombre.ToLower().Contains(TextBoxBuscar.Text.ToLower()))).ToList();
                GridViewCursos.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void CargarEscuelas()
        {
            try
            {
                List<Escuela> vEscuelas = AdministradorEscuela.Listar();
                DropDownListEscuela1.DataSource = vEscuelas;
                DropDownListEscuela1.DataBind();
                DropDownListEscuela2.DataSource = vEscuelas;
                DropDownListEscuela2.DataBind();
            }
            catch (Exception)
            {
            }
        }

        protected void GridViewCursos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string vCosto = HttpUtility.HtmlDecode(GridViewCursos.SelectedRow.Cells[3].Text);
            DropDownListEscuela2.SelectedIndex = DropDownListEscuela1.SelectedIndex;
            TextBoxId.Text = HttpUtility.HtmlDecode(GridViewCursos.SelectedRow.Cells[0].Text);
            TextBoxNombre.Text = HttpUtility.HtmlDecode(GridViewCursos.SelectedRow.Cells[1].Text);
            TextBoxDescripcion.Text = HttpUtility.HtmlDecode(GridViewCursos.SelectedRow.Cells[2].Text);
            TextBoxCosto.Text = vCosto;
            TextBoxId.Enabled = false;
            TextBoxNombre.Enabled = false;
            TextBoxDescripcion.Enabled = false;
            TextBoxCosto.Enabled = false;
            DropDownListEscuela2.Enabled = false;
            ButtonAceptar.Enabled = false;
            ModalPopupExtender1.Show();
        }

        protected void GridViewCursos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridViewCursos.PageIndex = e.NewPageIndex;
            CargarCursos();
        }

        protected void ButtonAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Curso vCurso = new Curso(
                    int.Parse(TextBoxId.Text), 
                    TextBoxNombre.Text.ToUpper(), 
                    TextBoxDescripcion.Text.ToUpper(), 
                    decimal.Parse(TextBoxCosto.Text.Replace(',', '.'), CultureInfo.InvariantCulture), 
                    new Escuela(int.Parse(DropDownListEscuela2.SelectedValue), ""));
                AdministradorCurso.Agregar(vCurso);
                ((Site)Page.Master).Alerta("Curso agregado.", 1);
                CargarCursos();
                LimpiarModal();
            }
            catch (SqlException ex) when (ex.Number == 2627)
            {
                ((Site)Page.Master).Alerta("Id de curso ya existe.", 2);
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

        protected void FiltrarCursos_Event(object sender, EventArgs e)
        {
            CargarCursos();
        }

        protected void LimpiarModal()
        {
            TextBoxId.Text = "";
            TextBoxNombre.Text = "";
            TextBoxDescripcion.Text = "";
            TextBoxCosto.Text = "";
            DropDownListEscuela2.SelectedIndex = -1;
            TextBoxId.Enabled = true;
            TextBoxNombre.Enabled = true;
            TextBoxDescripcion.Enabled = true;
            TextBoxCosto.Enabled = true;
            DropDownListEscuela2.Enabled = true;
            ButtonAceptar.Enabled = true;  
            GridViewCursos.SelectedIndex = -1;
        }
    }
}