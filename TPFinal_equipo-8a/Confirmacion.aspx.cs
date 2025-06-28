using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace TPFinal_equipo_8a
{
    public partial class Confirmacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack && int.TryParse(Request.QueryString["pedidoId"], out int idPedido))
            {
                CargarDetalles(idPedido);
                CargarTotal(idPedido);
            }

        }

        private void CargarDetalles(int idPedido)
        {
            CarroNegocio negocio = new CarroNegocio();
            List<ItemCarrito> detalles = negocio.ObtenerDetallesPedido(idPedido);

            repDetalles.DataSource = detalles;
            repDetalles.DataBind();

            string metodo = Request.QueryString["metodo"];
            lblMetodoPago.Text = metodo;



        }

        private void CargarTotal(int idPedido)
        {
            CarroNegocio negocio = new CarroNegocio();
            decimal total = negocio.ObtenerTotalPedido(idPedido); 
            lblTotal.Text = total.ToString("C2");
        }
    }
}