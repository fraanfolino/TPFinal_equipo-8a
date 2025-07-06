using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using System.Web.UI.WebControls.WebParts;

namespace TPFinal_equipo_8a
{
    public partial class Confirmacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]) && Seguridad.esAdmin(Session["usuario"]))
            {
                Response.Redirect("Catalogo.aspx", false);
            }

            if (!IsPostBack && int.TryParse(Request.QueryString["pedidoId"], out int idPedido))
            {
                CarroNegocio negocio = new CarroNegocio();

                Pedido pedido = new Pedido();

                pedido = negocio.ObtenerPedidoCompleto(idPedido);

                lblCliente.Text = pedido.NombreCliente;
                lblPago.Text = pedido.FormaPago;
                lblTotal.Text = pedido.Total.ToString("C");
                lblEstado.Text = pedido.Estado;
                lblFecha.Text = pedido.FechaCreacion.ToString("dd/MM/yyyy");


                repDetalles.DataSource = pedido.Items;
                repDetalles.DataBind();







            }

        }

     

      
        
    }
}