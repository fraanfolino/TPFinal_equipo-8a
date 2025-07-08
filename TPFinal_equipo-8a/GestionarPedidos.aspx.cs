using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPFinal_equipo_8a
{
    public partial class GestionarPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Seguridad.SesionAdmin(Session["usuario"]))
            {
                Response.Redirect("Catalogo.aspx", false);
            }


            if (!IsPostBack) {

                cargarPedidos();
            }
           


        }

        protected void repPedidos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Response.Redirect("Catalogo.aspx");
        }

       

        private void cargarPedidos()
        {
            PedidosNegocio negocio = new PedidosNegocio();
            
            List<Pedido> pedidos = negocio.ObtenerPedidos();
     

            repPedidos.DataSource = pedidos;
            repPedidos.DataBind();
        }





    }
}