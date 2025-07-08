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
            if (e.CommandName == "Confirmar")
            {
                int idPedido = Convert.ToInt32(e.CommandArgument);
                ConfirmarPedido(idPedido);
            }

            if (e.CommandName == "Cancelar")
            {
                int idPedido = Convert.ToInt32(e.CommandArgument);
                CancelarPedido(idPedido);
            }

            if (e.CommandName == "Enviado")
            {
                int idPedido = Convert.ToInt32(e.CommandArgument);
                ConfirmarEnvio(idPedido);
            }

            if (e.CommandName == "ConfirmarEntrega")
            {
                int idPedido = Convert.ToInt32(e.CommandArgument);
                ConfirmarEntrega(idPedido);
            }

            cargarPedidos();

        }

       
        private void ConfirmarPedido(int idPedido)
        {
            try
            {
                PedidosNegocio pedidosNegocio = new PedidosNegocio();
                pedidosNegocio.ConfirmarPedido(idPedido);
                pedidosNegocio.DescontarStock(idPedido);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void CancelarPedido(int idPedido)
        {
            try
            {
                PedidosNegocio pedidosNegocio = new PedidosNegocio();
                pedidosNegocio.CancelarPedido(idPedido);
                pedidosNegocio.DevolverStock(idPedido);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void ConfirmarEnvio(int idPedido)
        {
            try
            {
                PedidosNegocio pedidosNegocio = new PedidosNegocio();
                pedidosNegocio.ConfirmarEnvio(idPedido);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void ConfirmarEntrega(int idPedido)
        {
            try
            {
                PedidosNegocio pedidosNegocio = new PedidosNegocio();
                pedidosNegocio.ConfirmarEntrega(idPedido);
            }
            catch (Exception ex)
            {
                throw ex;
            }
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