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
        }

        private void CargarCarrito()
        {
            int idUsuario = ((Usuario)Session["usuario"]).Id;
            CarroNegocio carroNegocio = new CarroNegocio();
            List<ItemCarrito> carrito = carroNegocio.ObtenerCarrito(idUsuario);
            rptCarrito.DataSource = carrito;
            rptCarrito.DataBind();
        }
    }
}


