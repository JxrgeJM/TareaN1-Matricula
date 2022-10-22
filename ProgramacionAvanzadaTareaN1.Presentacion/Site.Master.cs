using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProgramacionAvanzadaTareaN1.Presentacion
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void Alerta(String pMensaje, int pTipo)
        {
            string vScript = "";
            switch (pTipo)
            {
                case 1:
                    vScript = $"alertify.success('{pMensaje}', 5);";
                    break;
                case 2:
                    vScript = $"alertify.warning('{pMensaje}', 5);";
                    break;
                case 3:
                    vScript = $"alertify.error('{pMensaje}', 5);";
                    break;
            }
            if (vScript != "")
                ScriptManager.RegisterStartupScript(UpdatePanel, UpdatePanel.GetType(), "script", vScript, true);
        }
    }
}