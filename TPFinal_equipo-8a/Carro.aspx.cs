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

            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                if (Seguridad.esAdmin(Session["usuario"]))
                {
                    Response.Redirect("Catalogo.aspx", false);
                }
            }
            else
            {
                Response.Redirect("Catalogo.aspx", false) ;
            }

            string accion = Request.QueryString["accion"];

            if (!string.IsNullOrEmpty(accion))
            {
                if (int.TryParse(Request.QueryString["productoId"], out int productoId) &&
                    int.TryParse(Request.QueryString["talleId"], out int talleId))
                {
                    int idUsuario = ((Usuario)Session["usuario"]).Id;
                    var negocio = new CarroNegocio();
                    int idCarrito = negocio.ObtenerOCrearCarrito(idUsuario);

                    if (accion == "SumarCantidad")
                        negocio.SumarCantidadBD(idCarrito, productoId, talleId);
                    else if (accion == "RestarCantidad")
                        negocio.RestarCantidadBD(idCarrito, productoId, talleId);
                }

                Response.Redirect("Carro.aspx", false);
                return;
            }

            if (!IsPostBack)
                CargarCarrito();
        }
        private void CargarCarrito()
        {
            
                int idUsuario = ((Usuario)Session["usuario"]).Id;
                CarroNegocio negocio = new CarroNegocio();

                List<ItemCarrito> items = negocio.ObtenerCarrito(idUsuario);
                decimal total = items.Sum(i => i.Precio());    
                lblTotal.Text = total.ToString("N2");
                rptCarrito.DataSource = items;
                rptCarrito.DataBind();

            
        }


        protected void btnContinuarCompra_Click(object sender, EventArgs e)
        {
            Response.Redirect("RealizarCompra.aspx");
        }
    }
}

