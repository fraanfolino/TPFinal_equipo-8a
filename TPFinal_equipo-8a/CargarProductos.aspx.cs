using System;
using System.Collections.Generic;
using System.Data;
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


                ddlCategoria.DataSource = CargarCategorias();
                ddlCategoria.DataBind();

                ddlMarca.DataSource = CargarMarcas();
                ddlMarca.DataBind();

                ActualizarListaProductos();

                //ddlTalles.DataSource = CargarTalles();
                //ddlTalles.DataTextField = "etiqueta";
                //ddlTalles.DataBind();

                ddlTalles2.DataSource = CargarTalles();
                ddlTalles2.DataTextField = "etiqueta";
                ddlTalles2.DataBind();

                txtUnidades.Attributes["min"] = "1";
            }
            else
            {
                MostrarStock();
            }


        }
















        public List<string> CargarCategorias()
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            List<string> listaCategorias = new List<string>();
            listaCategorias.Add("Todas");

            foreach (var marca in categoriaNegocio.ListarCategorias())
            {
                listaCategorias.Add(marca.Nombre);
            }
            return listaCategorias;
        }

        public List<string> CargarMarcas()
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            List<string> listaMarcas = new List<string>();
            listaMarcas.Add("Todas");

            foreach (var marca in marcaNegocio.ListarMarcas())
            {
                listaMarcas.Add(marca.Nombre);
            }
            return listaMarcas;
        }

        public List<Talle> CargarTalles()
        {
            TalleNegocio talleNegocio = new TalleNegocio();
            return talleNegocio.ListarTalles();
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarListaProductos();
        }

        private void ActualizarListaProductos()
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();

            string categoria = ddlCategoria.SelectedValue.ToString();
            string marca = ddlMarca.SelectedValue.ToString();

            if (categoria == "Todas")
                categoria = null;
            if (marca == "Todas")
                marca = null;

            List<Producto> productos = productoNegocio.ListarProductos(marca, categoria);

            if (productoSeleccionado.Items.Count > 0)
            { productoSeleccionado.Items.Clear(); }

            foreach (var item in productos)
            {
                productoSeleccionado.Items.Add(item.Nombre);
            }

            MostrarStock();
        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarListaProductos();
        }

        public void MostrarStock()
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            DataTable tablaStock = productoNegocio.ListarStock(productoSeleccionado.Value);
            TablaStock.DataSource = tablaStock;
            TablaStock.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            foreach (ListItem item in ddlTalles2.Items)
            {
                if (item.Selected)
                {
                    string talleSeleccionado = item.Value;
                }
            }
        }
    }
}