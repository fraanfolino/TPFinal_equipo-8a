using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
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

            if (e.CommandName == "ConfirmarRetiro") 
            {
                int idPedido = Convert.ToInt32(e.CommandArgument);
                ConfirmarRetiro(idPedido);
            }

            cargarPedidos();

        }


        private void ConfirmarRetiro(int idPedido)
        {
            try
            {
                PedidosNegocio pedidosNegocio = new PedidosNegocio();
                pedidosNegocio.ConfirmarRetiro(idPedido);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }



        private void ConfirmarPedido(int idPedido)
        {
            try
            {
                PedidosNegocio pedidosNegocio = new PedidosNegocio();
                pedidosNegocio.ConfirmarPedido(idPedido);
                pedidosNegocio.DescontarStock(idPedido);


                Pedido pedido = pedidosNegocio.ObtenerPedidoPorId(idPedido);
                if (pedido != null)
                {
                    EnviarMailConfirmacion(
                        "fraanfolino@gmail.com",
                        pedido.NombreCliente,
                        pedido.Total
                    );
                }



            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void EnviarMailConfirmacion(string destinatario, string nombreUsuario, decimal totalCompra)
        {
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("no-reply@demomailtrap.co", "Tu Tienda");
            mail.To.Add(destinatario);
            mail.Subject = "Compra confirmada";
            mail.Body = $"Hola {nombreUsuario},\n\nTu compra fue confirmada exitosamente.\nTotal: ${totalCompra:N2}\n\nGracias por elegirnos.";
            mail.IsBodyHtml = false;

            SmtpClient smtp = new SmtpClient("live.smtp.mailtrap.io", 587);
            smtp.Credentials = new NetworkCredential("api", "6866d9e9511f1f683a64c5e187e5030e");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;

            //smtp.Send(mail);
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






        protected void chkEstado_CheckedChanged(object sender, EventArgs e)
        {
            PedidosNegocio negocio = new PedidosNegocio();
            List<Pedido> todos = negocio.ObtenerPedidos();

            List<string> estadosSeleccionados = new List<string>();

            if (chkPendiente.Checked) estadosSeleccionados.Add("Pendiente");
            if (chkConfirmado.Checked) estadosSeleccionados.Add("Confirmado");
            if (chkEnviado.Checked) estadosSeleccionados.Add("Enviado");
            if (chkEntregado.Checked) estadosSeleccionados.Add("Entregado");
            if (chkCancelado.Checked) estadosSeleccionados.Add("Cancelado");

            List<Pedido> resultado;

            if (estadosSeleccionados.Count > 0)
            {
                resultado = todos.Where(p => estadosSeleccionados.Contains(p.Estado)).ToList();
            }
            else
            {
                resultado = todos;
            }

            repPedidos.DataSource = resultado;
            repPedidos.DataBind();
        }


        protected void txtIdPedido_TextChanged(object sender, EventArgs e)
        {
            PedidosNegocio negocio = new PedidosNegocio();
            List<Pedido> todos = negocio.ObtenerPedidos();
            List<Pedido> filtrados = new List<Pedido>();

            int idBuscado;
            int.TryParse(txtIdPedido.Text, out idBuscado);

            filtrados = todos.Where(p => idBuscado == p.IdPedido).ToList();

            repPedidos.DataSource = filtrados;
            repPedidos.DataBind();

            lblSinResultadosPorId.Visible = filtrados.Count == 0;
        }


        private void cargarPedidos()
        {
            PedidosNegocio negocio = new PedidosNegocio();
            List<Pedido> pedidos = negocio.ObtenerPedidos();
            repPedidos.DataSource = pedidos;
            repPedidos.DataBind();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            PedidosNegocio pedidosNegocio = new PedidosNegocio();
            List<Pedido> pedidos = pedidosNegocio.ObtenerPedidos();

            string filtro = TextBox1.Text.ToLower();

            List<Pedido> filtrado = pedidos.Where(p => p.NombreCliente.ToLower().Contains(filtro)).ToList();
                           

            repPedidos.DataSource = filtrado;
            repPedidos.DataBind();
        }
    }
}