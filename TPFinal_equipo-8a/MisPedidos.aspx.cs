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
    public partial class MisPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["usuario"]) || Seguridad.esAdmin(Session["usuario"]))
            {
                Response.Redirect("Catalogo.aspx", false);
            }

            if (!IsPostBack)
            {
                cargarPedidosUser();
            }
        }

        private void cargarPedidosUser()
        {
            Usuario usuario = Session["usuario"] as Usuario;
            PedidosNegocio negocio = new PedidosNegocio();
            List<Pedido> pedidos = negocio.ObtenerPedidosUsuario(usuario.Id);
            repPedidos.DataSource = pedidos;
            repPedidos.DataBind();
        }

        protected void repPedidos_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Cancelar")
            {
                int idPedido = Convert.ToInt32(e.CommandArgument);

                HiddenField hfEstado = (HiddenField)e.Item.FindControl("hfEstado");
                string estado = hfEstado?.Value;

                if (estado == "Confirmado")
                {
                    CancelarPedido(idPedido, true);
                }
                else
                {
                    CancelarPedido(idPedido, false);
                }
            }
            cargarPedidosUser();
        }



        private void CancelarPedido(int idPedido, bool descontarStock)
        {
            try
            {
                PedidosNegocio pedidosNegocio = new PedidosNegocio();
                pedidosNegocio.CancelarPedido(idPedido);
                if (descontarStock)
                {
                    pedidosNegocio.DevolverStock(idPedido);
                }
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
    }
}