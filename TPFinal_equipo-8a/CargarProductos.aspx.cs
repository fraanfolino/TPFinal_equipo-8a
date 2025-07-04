using Dominio;
using Microsoft.Ajax.Utilities;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class CargarProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!Seguridad.SesionAdmin(Session["usuario"]))
                {
                    Response.Redirect("Catalogo.aspx", false);
                }

                exitoMensaje.Visible = false;
                errorMensaje.Visible = false;

                ddlCategoria.DataSource = CargarCategorias();
                ddlCategoria.DataBind();

                ddlMarca.DataSource = CargarMarcas();
                ddlMarca.DataBind();

                ActualizarListaProductos();
                txtCantidad.Attributes["min"] = "1";

                if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int index))
                {
                    idProducto.Text = index.ToString();
                    Seleccionar(index);
                    return;
                }
                else
                {
                    //MostrarStock();
                    //MostrarTalles(Convert.ToInt32(productoSeleccionado.Value));
                }
            }
            else
            {
                MostrarStock();
                exitoMensaje.Visible = false;
                errorMensaje.Visible = false;
            }

            if (IsPostBack && Request["__EVENTTARGET"] == "productoSeleccionado")
            {
                string idProduStr = Request.Form[productoSeleccionado.UniqueID];

                if (!int.TryParse(idProduStr, out int idProdu))
                    return;

                MostrarTalles(idProdu);
                idProducto.Text = idProdu.ToString();

            }
        }

        private void Seleccionar(int id)
        {
            ProductoNegocio pNegocio = new ProductoNegocio();
            Producto produ = pNegocio.ObtenerProducto(id);

            if (produ == null)
            {
                return;
            }
            ddlCategoria.SelectedValue = produ.Categoria.Nombre;
            ddlMarca.SelectedValue = produ.Marca.Nombre;

            foreach (ListItem lItem in productoSeleccionado.Items)
            {
                lItem.Selected = false;
            }

            var item = productoSeleccionado.Items.FindByText(produ.Nombre);
            if (item != null)
                item.Selected = true;

            CargarTalles(produ.Id);
            MostrarTalles(produ.Id);
            MostrarStock();
        }

        public List<string> CargarCategorias()
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            List<string> listaCategorias = new List<string>();
            listaCategorias.Add("Todas");

            foreach (var categoria in categoriaNegocio.ListarCategorias())
            {
                if (categoria.Activo)
                {
                    listaCategorias.Add(categoria.Nombre);
                }
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
                if (marca.Activo)
                {
                    listaMarcas.Add(marca.Nombre);
                }
                
            }
            return listaMarcas;
        }

        public List<Dominio.Talle> CargarTalles(int idProdu)
        {
            TalleNegocio talleNegocio = new TalleNegocio();
            return talleNegocio.ListarTalles(idProdu);
        }

        protected void ddlCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarListaProductos();
        }

        private void ActualizarListaProductos()
        {
            try
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
                    productoSeleccionado.Items.Add(new ListItem(item.Nombre, item.Id.ToString()));
                }

                productoSeleccionado.Items.Add(new ListItem("ss", "Prueba"));

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarListaProductos();
        }

        public void MostrarStock()
        {
            int idProdu = int.Parse(productoSeleccionado.Value);
            ProductoNegocio productoNegocio = new ProductoNegocio();
            Producto produ = productoNegocio.ObtenerProducto(idProdu);

            if (idProdu == -1)
            { return; }

            DataTable tablaStock = productoNegocio.ListarStock(idProdu);
            MostrarImagenes(idProdu);

            TablaStock.DataSource = null;
            TablaStock.DataBind();

            if (tablaStock.Rows.Count > 0)
            {
                lblNombre.Text = "  " + produ.Nombre;
                TablaStock.DataSource = tablaStock;
                TablaStock.DataBind();
            }
            
            lblNombre.Text = "  " + produ.Nombre + "(" + produ.Id + ")";
        }

        private void MostrarTalles(int idProdu)
        {
            ddlTalles2.DataSource = CargarTalles(idProdu);
            ddlTalles2.DataTextField = "etiqueta";
            ddlTalles2.DataBind();
        }

        private void MostrarImagenes(int codigo)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            var imagenes = productoNegocio.ObtenerProducto(codigo).ImagenUrl;

            if (imagenes.Count > 0)
            {
                rptImagenes.DataSource = imagenes;
                rptImagenes.DataBind();

                rptIndicadores.DataSource = imagenes;
                rptIndicadores.DataBind();
            }
            else
            {
                rptImagenes.DataSource = null;
                rptImagenes.DataBind();
                rptIndicadores.DataSource = null;
                rptIndicadores.DataBind();
            }
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
                int resultado = productoNegocio.AgregarStock(cantidad, Convert.ToInt32(productoSeleccionado.Value), talles);

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
                int resultado = productoNegocio.DescontarStock(cantidad, Convert.ToInt32(productoSeleccionado.Value), talles);

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

        protected void btnVolver_Click(object sender, EventArgs e)
        {

        }

        protected void idProducto_TextChanged(object sender, EventArgs e)
        {
            if (!int.TryParse(idProducto.Text, out int id))
                return;

            ProductoNegocio pNegocio = new ProductoNegocio();
            Producto produ = pNegocio.ObtenerProducto(Convert.ToInt32(idProducto.Text));

            if (produ == null)
            {
                ddlMarca.SelectedIndex = 0;
                ddlCategoria.SelectedIndex = 0;

                return;
            }

            if (!produ.Activo)
            {
                ddlMarca.SelectedIndex = 0;
                ddlCategoria.SelectedIndex = 0;
                return;
            }

            if (!pNegocio.ChequearCategoriaActiva(produ.Categoria.Id))
            {
                ddlMarca.SelectedIndex = 0;
                ddlCategoria.SelectedIndex = 0;
                return;
            }

            if (!pNegocio.ChequearMarcaActiva(produ.Marca.Id))
            {
                ddlMarca.SelectedIndex = 0;
                ddlCategoria.SelectedIndex = 0;
                return;
            }

            ddlCategoria.SelectedValue = produ.Categoria.Nombre;
            ddlMarca.SelectedValue = produ.Marca.Nombre;

            foreach (ListItem lItem in productoSeleccionado.Items)
            {
                lItem.Selected = false;
            }

            var item = productoSeleccionado.Items.FindByText(produ.Nombre);
            if (item != null)
                item.Selected = true;

            CargarTalles(produ.Id);
            MostrarTalles(produ.Id);
            MostrarStock();

        }
    }
}