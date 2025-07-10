using System;
using System.Collections.Generic;
using System.Linq;
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
                CargarMarcas();
                CargarCategorias();
                ListarTodos();
            }
        }

        private void CargarMarcas()
        {
            MarcaNegocio negocio = new MarcaNegocio();
            List<Dominio.Marca> marcas = negocio.listarMarcas2();
 
            ddlMarca.DataSource = marcas;
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();

            ddlMarca.Items.Insert(0, new ListItem("Todas", "0"));
        }


        private void CargarCategorias()
        {
            MarcaNegocio negocio = new MarcaNegocio();
            List<Dominio.Categoria> categorias = negocio.listarCategorias2();

            ddlCategoria.DataSource = categorias;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();

            ddlCategoria.Items.Insert(0, new ListItem("Todas", "0"));
        }



        private void ListarTodos()
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> productos = negocio.ListarProductosEnStock();

            rptProductos.DataSource = productos;
            rptProductos.DataBind();

            Session["productosCatalogo"] = productos;
        }

        protected void txtBusqueda_TextChanged(object sender, EventArgs e)
        {
            string termino = txtBusqueda.Text.ToLower();
            ProductoNegocio negocio = new ProductoNegocio();

            List<Producto> lista = negocio.ListarProductosEnStock()
                                          .Where(p => p.Nombre.ToLower().Contains(termino))
                                          .ToList();

            rptProductos.DataSource = lista;
            rptProductos.DataBind();
        }

        protected void btnFiltrarMarca_Click(object sender, EventArgs e)
        {
            int idMarca = Convert.ToInt32(ddlMarca.SelectedValue);
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> lista;

            if (idMarca == 0)
                lista = negocio.ListarProductosEnStock();
            else
                lista = negocio.FiltrarProductosPorMarca(idMarca);

            rptProductos.DataSource = lista;
            rptProductos.DataBind();
        }


        protected void btnFiltrarCategoria_Click(object sender, EventArgs e)
        {
            int idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> lista;

            if (idCategoria == 0)
                lista = negocio.ListarProductosEnStock();
            else
                lista = negocio.FiltrarProductosPorCategoria(idCategoria);

            rptProductos.DataSource = lista;
            rptProductos.DataBind();
        }


        //protected void rptProductos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
        //        return;

        //    Producto producto = (Producto)e.Item.DataItem;
        //    Repeater rptImagenes = (Repeater)e.Item.FindControl("rptImagenes");

        //    rptImagenes.DataSource = producto.ImagenUrl;
        //    rptImagenes.DataBind();
        //}

        protected void rptProductos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
                return;

            Producto producto = (Producto)e.Item.DataItem;
            Repeater rptImagenes = (Repeater)e.Item.FindControl("rptImagenes");

            rptImagenes.DataSource = producto.ImagenUrl;
            rptImagenes.DataBind();

            // Setear los nombres de categoría y marca con control de nulos
            var litCategoria = (Literal)e.Item.FindControl("litCategoria");
            var litMarca = (Literal)e.Item.FindControl("litMarca");

            if (litCategoria != null)
                litCategoria.Text = producto.Categoria != null ? producto.Categoria.Nombre : "";

            if (litMarca != null)
                litMarca.Text = producto.Marca != null ? producto.Marca.Nombre : "";
        }

        protected void btnFiltrarPrecio_Click(object sender, EventArgs e)
        {
            decimal min;
            decimal max;
            bool hasMin = decimal.TryParse(txtPrecioMin.Text, out min);
            bool hasMax = decimal.TryParse(txtPrecioMax.Text, out max);

            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> lista = negocio.ListarProductosEnStock();

            if (hasMin)
                lista = lista.Where(p => p.Precio >= min).ToList();

            if (hasMax)
                lista = lista.Where(p => p.Precio <= max).ToList();


           


            if (hasMax && max > 9999999.99m)
            {
                max = 9999999.99m;
                lblError.Text = "El precio máximo no puede superar $9.999.999,99.";
                lblError.Visible = true;
            }


            if (hasMin && hasMax && min > max)
            {
                lblError.Text = "El precio mínimo no puede ser mayor al máximo.";
                lblError.Visible = true;
                return;
            }

            if ((hasMin && min < 0) || (hasMax && max < 0))
            {
                lblError.Text = "No se permiten valores negativos en los precios.";
                lblError.Visible = true;
                return;
            }

            rptProductos.DataSource = lista;
            rptProductos.DataBind();
        }

        public string ObtenerPrimeraImagen(object imagenesObj)
        {
            List<string> lista = imagenesObj as List<string>;
            return (lista != null && lista.Count > 0) ? lista[0] : "~/img/no-disponible.png";
        }
    }
}