using Dominio;
using Negocio;
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
            if (!IsPostBack)
                CargarFormasDePago();
        }

        protected void btnRealizarCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("Catalogo.aspx");
        }

        private void CargarFormasDePago()
        {
            ddlPago.Items.Clear();
            ddlPago.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlPago.Items.Add(new ListItem("Mercado Pago (+5%)", "5"));
            ddlPago.Items.Add(new ListItem("Tarjeta de Crédito (+10%)", "10"));
            ddlPago.Items.Add(new ListItem("Transferencia (-3%)", "-3"));
        }

        protected void ddlPago_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            int idUsuario = ((Usuario)Session["usuario"]).Id;
            var items = new CarroNegocio().ObtenerCarrito(idUsuario);

            decimal subtotal = items.Sum(i => i.Precio());
            decimal porc = Convert.ToDecimal(ddlPago.SelectedValue);
            decimal totalAju = subtotal * (1 + porc / 100);

            lblTotalFinal.Text = totalAju.ToString("C2");
        }



        protected void ddlEntrega_SelectedIndexChanged(object sender, EventArgs e)
        {
            
            bool esEnvio = ddlEntrega.SelectedValue == "Envio";
            pnlEnvio.Visible = esEnvio;
            pnlRetiro.Visible = !esEnvio;
        }
    }
}