﻿using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class DatosCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["usuario"]) || Seguridad.esAdmin(Session["usuario"]))
            {
                Response.Redirect("Catalogo.aspx", false);
            }

            if (!IsPostBack) 
            {
                CargarFormasDePago();
                CargarDatosUser();
            }
        }

        protected void btnRealizarCompra_Click(object sender, EventArgs e)
        {


            if (string.IsNullOrWhiteSpace(txtNombre.Text) ||
               string.IsNullOrWhiteSpace(txtEmail.Text) ||
               string.IsNullOrWhiteSpace(txtTelefono.Text) ||
               string.IsNullOrEmpty(ddlEntrega.SelectedValue) ||
               (ddlEntrega.SelectedValue == "Envio" && string.IsNullOrWhiteSpace(txtDireccionEnvio.Text)) ||
               string.IsNullOrEmpty(ddlPago.SelectedValue))
            {
                lblError.Text = "Por favor, complete todos los campos antes de continuar.";
                lblError.Visible = true;
                return;
            }

            int idUsuario = ((Usuario)Session["usuario"]).Id;

            string modalidad = ddlEntrega.SelectedValue;
            string direccion;

            if (modalidad == "Retiro")
            {
                direccion = ddlSucursal.SelectedItem.Text;
            }
            else
            {
                direccion = txtDireccionEnvio.Text;
            }


            CarroNegocio negocio = new CarroNegocio();

            List<ItemCarrito> items = negocio.ObtenerCarrito(idUsuario);

            decimal porc = Convert.ToDecimal(ddlPago.SelectedValue);
            decimal total = items.Sum(i => i.Producto.Precio * i.Cantidad);
            decimal totalConAjuste = total * (1 + porc / 100);

            int idPedido = negocio.registrarPedidoV2(
                idUsuario, txtNombre.Text.Trim(), txtEmail.Text.Trim(), txtTelefono.Text.Trim(), modalidad, direccion, ddlPago.SelectedItem.Text, totalConAjuste);

            foreach (var item in items)
            {
                negocio.registrarDetallePedidoV2(idPedido, item);
            }
            negocio.vaciarCarrito(idUsuario);

            PedidosNegocio pedidosNeg = new PedidosNegocio();
            Pedido pedido = pedidosNeg.ObtenerPedidoPorId(idPedido);
            if (pedido != null)
            {
                
                EnviarMailPagoConfirmado(
                    txtEmail.Text.Trim(),   
                    pedido.NombreCliente,
                    pedido.Total
                );
            }
            Response.Redirect("Confirmacion.aspx?pedidoId=" + idPedido);

        }

        private void CargarFormasDePago()
        {
            ddlPago.Items.Clear();
            ddlPago.Items.Add(new ListItem("-- Seleccione --", ""));
            ddlPago.Items.Add(new ListItem("Mercado Pago (+5%)", "5"));
            ddlPago.Items.Add(new ListItem("Tarjeta de Crédito (+10%)", "10"));
            ddlPago.Items.Add(new ListItem("Transferencia (-3%)", "-3"));
        }

        private void CargarDatosUser()
        {
            Usuario usuario = Session["usuario"] as Usuario;
            txtNombre.Text = usuario.Nombre + " " + usuario.Apellido;
            txtEmail.Text = usuario.Email;
        }

        protected void ddlPago_SelectedIndexChanged(object sender, EventArgs e)
        {
          
            int idUsuario = ((Usuario)Session["usuario"]).Id;
            List<ItemCarrito> items = new CarroNegocio().ObtenerCarrito(idUsuario);

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


        public void EnviarMailPagoConfirmado(string destinatarioCliente, string nombreUsuario, decimal totalCompra)
        {
            var mail = new MailMessage();
            mail.From = new MailAddress("no-reply@demomailtrap.co", "Tu Tienda (Admin)");

            
            
            
            mail.To.Add("fraanfolino@gmail.com");

            mail.Subject = "Pago recibido ✔";
            mail.Body = $"Hola {nombreUsuario}, recibimos tu pago de ${totalCompra:N2}. ¡Gracias!";
            mail.IsBodyHtml = false;

            var smtp = new SmtpClient("live.smtp.mailtrap.io", 587);
            smtp.Credentials = new NetworkCredential("api", "6866d9e9511f1f683a64c5e187e5030e");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.EnableSsl = true;
           // smtp.Send(mail);
        }
    }
}