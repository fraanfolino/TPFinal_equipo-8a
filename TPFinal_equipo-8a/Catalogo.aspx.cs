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
                ListarTodos();
            }
        }

        private void CargarMarcas()
        {
            var negocio = new MarcaNegocio();
            var marcas = negocio.listarMarcas2();

            ddlMarca.DataSource = marcas;
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();

            ddlMarca.Items.Insert(0, new ListItem("Todas", "0"));
        }

        private void ListarTodos()
        {
            ProductoNegocio negocio = new ProductoNegocio();
            List<Producto> productos = negocio.ListarProductosEnStock();

            rptProductos.DataSource = productos;
            rptProductos.DataBind();
        }

        protected void txtBusqueda_TextChanged(object sender, EventArgs e)
        {
            var termino = txtBusqueda.Text.ToLower();
            var negocio = new ProductoNegocio();

            var lista = negocio.ListarProductosEnStock()
                               .Where(p => p.Nombre.ToLower().Contains(termino))
                               .ToList();

            rptProductos.DataSource = lista;
            rptProductos.DataBind();
        }

        protected void btnFiltrarMarca_Click(object sender, EventArgs e)
        {
            var idMarca = Convert.ToInt32(ddlMarca.SelectedValue);
            var negocio = new ProductoNegocio();
            List<Producto> lista;

            if (idMarca == 0)
                lista = negocio.ListarProductosEnStock();
            else
                lista = negocio.FiltrarProductosPorMarca(idMarca);

            rptProductos.DataSource = lista;
            rptProductos.DataBind();
        }

        protected void rptProductos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType != ListItemType.Item && e.Item.ItemType != ListItemType.AlternatingItem)
                return;

            var producto = (Producto)e.Item.DataItem;
            var rptImagenes = (Repeater)e.Item.FindControl("rptImagenes");

            rptImagenes.DataSource = producto.ImagenUrl;
            rptImagenes.DataBind();
        }

        protected void btnFiltrarPrecio_Click(object sender, EventArgs e)
        {
           
            decimal min, max;
            bool hasMin = decimal.TryParse(txtPrecioMin.Text, out min);
            bool hasMax = decimal.TryParse(txtPrecioMax.Text, out max);

            
            var negocio = new ProductoNegocio();
            var lista = negocio.ListarProductosEnStock();

            if (hasMin)
                lista = lista.Where(p => p.Precio >= min).ToList();

            if (hasMax)
                lista = lista.Where(p => p.Precio <= max).ToList();

            rptProductos.DataSource = lista;
            rptProductos.DataBind();
        }

        public string ObtenerPrimeraImagen(object imagenesObj)
        {
            var lista = imagenesObj as List<string>;
            return (lista != null && lista.Count > 0) ? lista[0] : "~/img/no-disponible.png";
        }
    }
}
