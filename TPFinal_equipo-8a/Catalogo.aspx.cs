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
    public partial class Catalogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                ProductoNegocio productoNegocio = new ProductoNegocio();
                List<Producto> productos = productoNegocio.ListarProductosEnStock();

                rptProductos.DataSource = productos;
                rptProductos.DataBind();
            }


        }
        public void rptProductos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Producto producto = (Producto)e.Item.DataItem;
                Repeater rptImagenes = (Repeater)e.Item.FindControl("rptImagenes");
                rptImagenes.DataSource = producto.ImagenUrl;
                rptImagenes.DataBind();
            }
        }

        public string ObtenerPrimeraImagen(object imagenesObj)
        {
            var lista = imagenesObj as List<string>;
            if (lista != null && lista.Count > 0)
                return lista[0];

            return "~/img/no-disponible.png"; // Ruta relativa a una imagen por defecto
        }

        protected void btnFiltrarMarca_Click(object sender, EventArgs e)
        {
            string marca = ddlMarca.SelectedValue; 
            ProductoNegocio productoNegocio = new ProductoNegocio();

            
            List<Producto> productosFiltrados = productoNegocio.FiltrarProductosPorMarca(marca);

            rptProductos.DataSource = productosFiltrados;
            rptProductos.DataBind();
        }

    }
}