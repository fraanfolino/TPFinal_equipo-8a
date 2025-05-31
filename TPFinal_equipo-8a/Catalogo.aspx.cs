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


                //List<Producto> productos = new List<Producto>
                //{
                //    new Producto { Nombre = "NEWELS LOCURA", Precio = 800,  ImagenUrl = new List<string> {"https://acdn-us.mitiendanube.com/stores/002/872/034/products/e1d87ca91-97468f782db022a61116777916343707-1024-1024.jpg" } },
                //    new Producto { Nombre = "NEWELS ROSARIO", Precio = 500, ImagenUrl = new List<string> {"https://acdn-us.mitiendanube.com/stores/002/872/034/products/e1d87ca91-97468f782db022a61116777916343707-1024-1024.jpg"} },
                //    new Producto { Nombre = "CHICHO SIESTA", Precio = 150, ImagenUrl = new List<string> {"https://indumentarialegolf.com/wp-content/uploads/2024/10/IMG_20241003_105825.jpg" } },
                //    new Producto { Nombre = "RIQUELME MATE", Precio = 300, ImagenUrl = new List<string> {"https://indumentarialegolf.com/wp-content/uploads/2024/10/IMG_20241003_105825.jpg" } }
                //};

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