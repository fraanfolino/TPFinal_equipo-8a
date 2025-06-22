using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace TPFinal_equipo_8a
{
    public partial class Carro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CargarCarrito();
            }

            string accion = Request.QueryString["accion"];


            if (!string.IsNullOrEmpty(accion))
            {
                int productoId;

                string talle = Request.QueryString["talle"];

                if (int.TryParse(Request.QueryString["productoId"], out productoId) && !string.IsNullOrEmpty(talle))
                {
                    int idUsuario = ((Usuario)Session["usuario"]).Id;
                    CarroNegocio negocio = new CarroNegocio();

                    if (accion == "SumarCantidad")
                    {
                        negocio.SumarCantidadBD(idUsuario, productoId, talle);
                    }
                    else if (accion == "RestarCantidad")
                    {
                        negocio.RestarCantidadBD(idUsuario, productoId, talle);
                    }
                }
                Response.Redirect("Carro.aspx");
            }
        }

        private void CargarCarrito()
        {
            if (!IsPostBack)
            {
                int idUsuario = ((Usuario)Session["usuario"]).Id;
                CarroNegocio negocio = new CarroNegocio();

                List<ItemCarrito> items = negocio.ObtenerCarrito(idUsuario);
                decimal total = items.Sum(i => i.Precio());    
                lblTotal.Text = total.ToString("N2");
                rptCarrito.DataSource = items;
                rptCarrito.DataBind();

            }
        }
    }
}

