using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class DatosCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRealizarCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalogo.aspx");
        }
        protected void ddlEntrega_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            bool esEnvio = ddlEntrega.SelectedValue == "Envio";
            pnlEnvio.Visible = esEnvio;
            pnlRetiro.Visible = !esEnvio;
        }
    }
}