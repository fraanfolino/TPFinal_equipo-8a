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
    public partial class CargarProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Simulamos datos, reemplazá por tu fuente real
                ProductoNegocio productoNegocio = new ProductoNegocio();

                List<Producto> productos = productoNegocio.ListarProductosEnStock();

                foreach (var item in productos)
                    productoSeleccionado.Items.Add(item.Nombre);

                ddlCategoria.DataSource = CargarCategorias();
                ddlCategoria.DataTextField = "nombre";
                ddlCategoria.DataBind();

                tallesSeleccionados.Items.Add("XL");
                tallesSeleccionados.Items.Add("L");
                tallesSeleccionados.Items.Add("S");
            }
        }

        public List<Categoria> CargarCategorias()
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            return categoriaNegocio.ListarCategorias();
        }








    }
}