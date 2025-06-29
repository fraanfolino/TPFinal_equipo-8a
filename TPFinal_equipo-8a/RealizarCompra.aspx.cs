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
    public partial class RealizarCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("Catalogo.aspx");
                return;
            }

            if (!IsPostBack)
            {
                cargarCarrito();
                CargarFormasDePago();
            }
        }


       

        private void cargarCarrito()
        {
            CarroNegocio negocio = new CarroNegocio();
            int idUsuario = ((Usuario)Session["usuario"]).Id;

            
            List<ItemCarrito> items = negocio.ObtenerCarrito(idUsuario);


            rptItems.DataSource = items;
            rptItems.DataBind();

          
            
        }

        private void CargarFormasDePago()
        {
            ddlFormaPago.Items.Clear();
            ddlFormaPago.Items.Add(new ListItem("Mercado Pago (+5%)", "5"));
            ddlFormaPago.Items.Add(new ListItem("Tarjeta de Crédito (+10%)", "10"));
            ddlFormaPago.Items.Add(new ListItem("Transferencia (-3%)", "-3"));
        }


        protected void ddlFormaPago_SelectedIndexChanged(object sender, EventArgs e)
        {
            
                int idUsuario = ((Usuario)Session["usuario"]).Id;
                CarroNegocio negocio = new CarroNegocio();
                List<ItemCarrito> items = negocio.ObtenerCarrito(idUsuario);

                decimal subtotal = items.Sum(item => item.Precio());
                decimal porcentaje = Convert.ToDecimal(ddlFormaPago.SelectedValue);
                decimal totalConAjuste = subtotal + (subtotal * porcentaje / 100);

                lblTotalFinal.Text = totalConAjuste.ToString("C2");
          
           
        }


        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            int idUsuario = ((Usuario)Session["usuario"]).Id;
            CarroNegocio negocio = new CarroNegocio();
            List<ItemCarrito> carrito = negocio.ObtenerCarrito(idUsuario);


            
            decimal subtotal = carrito.Sum(i => i.Producto.Precio * i.Cantidad);

            string metodoValorText = ddlFormaPago.SelectedItem.Text;



            string metodoValor = ddlFormaPago.SelectedValue;
            decimal porcentaje = Convert.ToDecimal(metodoValor);

          
            decimal totalConAjuste = subtotal + (subtotal * porcentaje / 100);

           
            int idPedido = negocio.RegistrarPedido(idUsuario, totalConAjuste);

            foreach (var item in carrito)
                negocio.RegistrarDetallePedido(idPedido, item);


            foreach (var item in carrito)
                negocio.DescontarStock(item.Producto.Id, item.Producto.Talle.Id, item.Cantidad);


            negocio.vaciarCarrito(idUsuario);
           
            Response.Redirect("Confirmacion.aspx?pedidoId=" + idPedido + "&metodo=" + metodoValorText);
        }


    }
    } 

