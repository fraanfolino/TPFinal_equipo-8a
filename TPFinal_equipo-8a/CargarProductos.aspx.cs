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
                    MostrarStock();
                    MostrarTalles(Convert.ToInt32(productoSeleccionado.Value));
                }
            }
            else
            {
                exitoMensaje.Visible = false;
                errorMensaje.Visible = false;
            }


            string LALA = Request["__EVENTTARGET"];

            if (IsPostBack && Request["__EVENTTARGET"] == productoSeleccionado.UniqueID)
            {
                string idProduStr = Request.Form[productoSeleccionado.UniqueID];

                if (!int.TryParse(idProduStr, out int idProdu))
                    return;

                ActualizarDatos(idProdu);
                return;
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

                productoSeleccionado.Items.Clear();

                if (productos.Count == 0)
                {
                    productoSeleccionado.Items.Add(new ListItem("— Sin productos —", ""));
                    idProducto.Text = "";
                    LimpiarTablaImg();
                }
                else
                {
                    productoSeleccionado.Items.Add(new ListItem("— Seleccione —", ""));
                    foreach (var item in productos)
                    {
                        
                        productoSeleccionado.Items.Add(
                            new ListItem(item.Nombre, item.Id.ToString())
                        );
                    }

                    if (productoSeleccionado.Items.Count > 0)
                    {

                        if (ddlCategoria.SelectedItem.Text == "Todas" || ddlMarca.SelectedItem.Text == "Todas")
                        {

                            idProducto.Text = "";

                            
                            LimpiarTablaImg();


                        }
                        else
                        {
                            idProducto.Text = productoSeleccionado.Items[0].Value;
                            if (!int.TryParse(productoSeleccionado.Items[0].Value, out int idP))
                                return;

                            ActualizarDatos(idP);
                        }
                        


                    }

                }

                if (productos.Count == 0)
                {
                    productoSeleccionado.Items.Add(new ListItem("— Sin productos —", ""));
                    idProducto.Text = "";
                    LimpiarTablaImg();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }


        private void LimpiarTablaImg()
        {
            lblNombre.Text = "";

            rptImagenes.DataSource = new List<string>();
            rptImagenes.DataBind();

            rptIndicadores.DataSource = new List<string>();
            rptIndicadores.DataBind();

            TablaStock.DataSource = null;
            TablaStock.DataBind();

            TablaStock.DataSource = CrearTablaVaciaStock();
            TablaStock.DataBind();

            ddlTalles2.DataSource = new List<string>();
            ddlTalles2.DataBind();

        }

        protected void ddlMarca_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarListaProductos();
        }

        public void MostrarStock()
        {
            if (!int.TryParse(idProducto.Text, out int idProdu))
                return;

            ProductoNegocio productoNegocio = new ProductoNegocio();
            Producto produ = productoNegocio.ObtenerProducto(idProdu);

            if (produ == null)
            {
                lblNombre.Text = "";

                rptImagenes.DataSource = new List<string>();
                rptImagenes.DataBind();

                rptIndicadores.DataSource = new List<string>();
                rptIndicadores.DataBind();

                TablaStock.DataSource = null;
                TablaStock.DataBind();

                TablaStock.DataSource = CrearTablaVaciaStock();
                TablaStock.DataBind();

                productoSeleccionado.Items.Clear();
                productoSeleccionado.Items.Add(new ListItem("— Producto no encontrado —", ""));

                return;
            }

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
            else
            {
                TablaStock.DataSource = CrearTablaVaciaStock();
                TablaStock.DataBind();
            }

            if (produ != null)
            {
                lblNombre.Text = "  " + produ.Nombre + "(" + produ.Id + ")";
            }
        }

        private void MostrarTalles(int idProdu)
        {

            ddlTalles2.DataSource = null;
            ddlTalles2.DataSource = CargarTalles(idProdu);
            ddlTalles2.DataTextField = "etiqueta";
            ddlTalles2.DataBind();
        }

        private void MostrarImagenes(int codigo)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();

            var producto = productoNegocio.ObtenerProducto(codigo);
            var imagenes = producto?.ImagenUrl ?? new List<string>();

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


            if (productoSeleccionado.Value == "")
            {
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

            if (produ == null ||
                !produ.Activo ||
                !pNegocio.ChequearCategoriaActiva(produ.Categoria.Id) ||
                !pNegocio.ChequearMarcaActiva(produ.Marca.Id)
                )
            {
                ddlMarca.SelectedIndex = 0;
                ddlCategoria.SelectedIndex = 0;
                ActualizarListaProductos();

                if (productoSeleccionado.Items.Count == 0)
                {
                    productoSeleccionado.Items.Add(new ListItem("— Sin productos —", ""));
                    idProducto.Text = "";
                    return;
                }

                if (!int.TryParse(productoSeleccionado.Items[0].Value, out int idP))
                    return;

                CargarTalles(idP);
                MostrarTalles(idP);
                MostrarStock();

                Producto produc = pNegocio.ObtenerProducto(idP);
                ddlCategoria.SelectedValue = produc.Categoria.Nombre;
                ddlMarca.SelectedValue = produc.Marca.Nombre;

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

        private void ActualizarDatos(int id)
        {
            ProductoNegocio pNegocio = new ProductoNegocio();
            Producto produ = pNegocio.ObtenerProducto(id);
            idProducto.Text = id.ToString();

            if (produ == null ||
                !produ.Activo ||
                !pNegocio.ChequearCategoriaActiva(produ.Categoria.Id) ||
                !pNegocio.ChequearMarcaActiva(produ.Marca.Id)
                )
            {
                ddlMarca.SelectedIndex = 0;
                ddlCategoria.SelectedIndex = 0;
                ActualizarListaProductos();

                if (productoSeleccionado.Items.Count == 0)
                {
                    productoSeleccionado.Items.Add(new ListItem("— Sin productos —", ""));
                    idProducto.Text = "";
                    return;
                }

                if (!int.TryParse(productoSeleccionado.Items[0].Value, out int idP))
                    return;

                CargarTalles(idP);
                MostrarTalles(idP);
                MostrarStock();

                Producto produc = pNegocio.ObtenerProducto(idP);
                ddlCategoria.SelectedValue = produc.Categoria.Nombre;
                ddlMarca.SelectedValue = produc.Marca.Nombre;

                return;
            }

            ddlCategoria.SelectedValue = produ.Categoria.Nombre;
            ddlMarca.SelectedValue = produ.Marca.Nombre;

            CargarTalles(produ.Id);
            MostrarTalles(produ.Id);
            MostrarStock();

        }



        public DataTable CrearTablaVaciaStock()
        {
            DataTable tabla = new DataTable();
            tabla.Columns.Add("Talle", typeof(string));
            tabla.Columns.Add("Cantidad", typeof(string));

            DataRow fila = tabla.NewRow();
            fila["Talle"] = "-";
            fila["Cantidad"] = "-";
            tabla.Rows.Add(fila);

            return tabla;
        }
    }
}