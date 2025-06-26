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

          
            decimal total = 0;
            foreach (var item in items)
                total += item.Precio();

            lblTotalFinal.Text = total.ToString("C2");
       
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
            Response.Redirect("Carro.aspx");


        }


    }
    } 

