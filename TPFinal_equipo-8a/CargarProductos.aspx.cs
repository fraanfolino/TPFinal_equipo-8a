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
                exitoMensaje.Visible = false;
                errorMensaje.Visible = false;

                ddlCategoria.DataSource = CargarCategorias();
                ddlCategoria.DataBind();

                ddlMarca.DataSource = CargarMarcas();
                ddlMarca.DataBind();

                ActualizarListaProductos();

                ddlTalles2.DataSource = CargarTalles();
                ddlTalles2.DataTextField = "etiqueta";
                ddlTalles2.DataBind();

                txtCantidad.Attributes["min"] = "1";
            }
            else
            {
                MostrarStock();
                exitoMensaje.Visible = false;
                errorMensaje.Visible = false;
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
            var codigo = tablaStock.Rows[0]["Id"];

            MostrarImagenes((int)codigo);

            lblNombre.Text = "  " + productoSeleccionado.Value;
            TablaStock.DataSource = tablaStock;
            TablaStock.DataBind();
        }


        private void MostrarImagenes(int codigo)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            var imagenes = productoNegocio.ObtenerProducto(codigo).ImagenUrl;

            rptImagenes.DataSource = imagenes;
            rptImagenes.DataBind();

            rptIndicadores.DataSource = imagenes;
            rptIndicadores.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (productoSeleccionado.Value == "")
            {
                errorMensaje.Visible = true;
                errorMensaje.Text = "Debe seleccionar un producto.";
                return;
            }

            List<string> talles = new List<string>();  

            foreach (ListItem item in ddlTalles2.Items)
            {
                if (item.Selected)
                {
                    talles.Add(item.Value);
                }
            }

            ProductoNegocio productoNegocio = new ProductoNegocio();

            try
            {
                int cantidad = int.Parse(txtCantidad.Text);
                int resultado = productoNegocio.AgregarStock(cantidad, productoSeleccionado.Value, talles);

                if (resultado == 1)
                {
                    exitoMensaje.Visible = true;
                    exitoMensaje.Text = "Stock agregado correctamente.";
                    MostrarStock();
                }
                else if (resultado == 0)
                {
                    errorMensaje.Visible = true;
                    errorMensaje.Text = "No se agrego ningun producto.";
                }
                else if (resultado == -1)
                {
                    errorMensaje.Visible = true;
                    errorMensaje.Text = "Error al eliminar stock.";
                }
            }
            catch (Exception ex)
            {
                errorMensaje.Visible = true;
                errorMensaje.Text = ex.ToString();
                throw;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            List<string> talles = new List<string>();

            foreach (ListItem item in ddlTalles2.Items)
            {
                if (item.Selected)
                {
                    talles.Add(item.Value);
                }
            }

            ProductoNegocio productoNegocio = new ProductoNegocio();

            try
            {
                int cantidad = int.Parse(txtCantidad.Text);
                int resultado = productoNegocio.DescontarStock(cantidad, productoSeleccionado.Value, talles);

                if (resultado == 1)
                {
                    exitoMensaje.Visible = true;
                    exitoMensaje.Text = "Stock eliminado correctamente.";
                    MostrarStock();
                }
                else if (resultado == 0)
                {
                    errorMensaje.Visible = true;
                    errorMensaje.Text = "No se elimino ningun elemento.";
                }
                else if (resultado == -1)
                {
                    errorMensaje.Visible = true;
                    errorMensaje.Text = "Error al eliminar stock.";
                }
            }
            catch (Exception ex)
            {
                errorMensaje.Visible = true;
                errorMensaje.Text = ex.ToString();
                throw;
            }
        }
    }
}