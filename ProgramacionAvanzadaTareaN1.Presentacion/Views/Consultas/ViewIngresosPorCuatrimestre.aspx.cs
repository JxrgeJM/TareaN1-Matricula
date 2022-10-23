using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ProgramacionAvanzadaTareaN1.LogicaNegocio;

namespace ProgramacionAvanzadaTareaN1.Presentacion.Views.Consultas
{
    public partial class ViewIngresosPorCuatrimestre : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarIngresos();
            }
        }

        protected void CargarIngresos()
        {
            try
            {
                decimal vMonto = AdministradorMatricula.ConsultaIngresos(int.Parse(DropDownListPeriodo.SelectedValue));
                LabelIngresos.Text = $"Total de ingresos: {vMonto:C}";
            }
            catch (Exception)
            {
            }
        }

    }
}