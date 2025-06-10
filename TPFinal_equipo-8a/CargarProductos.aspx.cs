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
                ProductoNegocio productoNegocio = new ProductoNegocio();
                List<Producto> productos = productoNegocio.ListarProductosEnStock();

                foreach (var item in productos)
                    productoSeleccionado.Items.Add(item.Nombre);

                ddlCategoria.DataSource = CargarCategorias();
                ddlCategoria.DataTextField = "nombre";
                ddlCategoria.DataBind();

                ddlMarca.DataSource = CargarMarcas();
                ddlMarca.DataTextField = "nombre";
                ddlMarca.DataBind();

                ddlTalles.DataSource = CargarTalles();
                ddlTalles.DataTextField = "etiqueta";
                ddlTalles.DataBind();



                txtUnidades.Attributes["min"] = "1";

            }
        }

        public List<Categoria> CargarCategorias()
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            return categoriaNegocio.ListarCategorias();
        }

        public List<Marca> CargarMarcas()
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            return marcaNegocio.ListarMarcas();
        }

        public List<Talle> CargarTalles()
        {
            TalleNegocio talleNegocio = new TalleNegocio();
            return talleNegocio.ListarTalles();
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}