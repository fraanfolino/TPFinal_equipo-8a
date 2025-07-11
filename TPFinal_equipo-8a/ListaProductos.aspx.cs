using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace TPFinal_equipo_8a
{
    public partial class ListaProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.SesionAdmin(Session["usuario"]))
            {
                Response.Redirect("Catalogo.aspx", false);
            }

            if (!IsPostBack)
            {
                CargarLista();
                Cantidadxpagina.Text = "10";
            }
        }

        private void  CargarLista ()
        {        
            ProductoNegocio productoNegocio = new ProductoNegocio();
            Session.Add("listaProductos", productoNegocio.ListarProductosSinImagenes());
            dgvlistaProductos.DataSource = Session["listaProductos"];
            dgvlistaProductos.DataBind();
        }

        protected void dgvlistaProductos_Sorting(object sender, GridViewSortEventArgs e)
        {
            List<Producto> listaordenada = (List<Producto>)Session["listaProductos"];
            string sortexp = e.SortExpression.ToString();

            switch (sortexp)
            {
                case "Id":
                    if (listaordenada.SequenceEqual(listaordenada.OrderBy(x => x.Id)))
                        listaordenada = listaordenada.OrderByDescending(x => x.Id).ToList();
                    else
                        listaordenada = listaordenada.OrderBy(x => x.Id).ToList();
                    break;

                case "Nombre":
                    if (listaordenada.SequenceEqual(listaordenada.OrderBy(x => x.Nombre)))
                        listaordenada = listaordenada.OrderByDescending(x => x.Nombre).ToList();
                    else
                        listaordenada = listaordenada.OrderBy(x => x.Nombre).ToList();
                    break;

                case "Categoria":
                    if (listaordenada.SequenceEqual(listaordenada.OrderBy(x => x.Categoria.Nombre)))
                        listaordenada = listaordenada.OrderByDescending(x => x.Categoria.Nombre).ToList();
                    else
                        listaordenada = listaordenada.OrderBy(x => x.Categoria.Nombre).ToList();
                    break;
                case "Marca":
                    if (listaordenada.SequenceEqual(listaordenada.OrderBy(x => x.Marca.Nombre)))
                        listaordenada = listaordenada.OrderByDescending(x => x.Marca.Nombre).ToList();
                    else
                        listaordenada = listaordenada.OrderBy(x => x.Marca.Nombre).ToList();
                    break;
                case "Precio":
                    if (listaordenada.SequenceEqual(listaordenada.OrderBy(x => x.Precio)))
                        listaordenada = listaordenada.OrderByDescending(x => x.Precio).ToList();
                    else
                        listaordenada = listaordenada.OrderBy(x => x.Precio).ToList();
                    break;

                default:
                    break;
            }

            Session.Add("listaProductos", listaordenada);
            dgvlistaProductos.DataSource = Session["listaProductos"];
            dgvlistaProductos.DataBind();

        }


        protected void dgvlistaProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvlistaProductos.SelectedDataKey.Value.ToString();
            Response.Redirect("Producto.aspx?id=" + id, false);
        }

        protected void dgvlistaProductos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvlistaProductos.DataSource = Session["listaProductos"];
            dgvlistaProductos.PageIndex = e.NewPageIndex;
            dgvlistaProductos.DataBind();
        }

        protected void Cantidadxpagina_TextChanged(object sender, EventArgs e)
        {
            CargarCantidadxPagina();
        }


        protected void CargarCantidadxPagina()
        {
            int a;
            if (int.TryParse(Cantidadxpagina.Text, out a))
            {
                dgvlistaProductos.PageSize = a;
                dgvlistaProductos.DataSource = Session["listaProductos"];
                dgvlistaProductos.PageIndex = 0;
                dgvlistaProductos.DataBind();
            }
            else
            {
                dgvlistaProductos.PageSize = 10;
                dgvlistaProductos.DataSource = Session["listaProductos"];
                dgvlistaProductos.PageIndex = 0;
                dgvlistaProductos.DataBind();
            }
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Producto> lista = (List<Producto>)Session["listaProductos"];
            List<Producto> listaFiltrada = new List<Producto>();

            if (txtFiltro.Text == "")
            {
                CargarLista();
            }

            else
            {
                switch (CriterioFRapido.SelectedIndex)
                {
                    case 0:
                        listaFiltrada = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
                        break;
                    case 1:
                        listaFiltrada = lista.FindAll(x => x.Categoria.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
                        break;
                    case 2:
                        listaFiltrada = lista.FindAll(x => x.Marca.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper()));
                        break;
                    default:
                        break;
                }

                dgvlistaProductos.DataSource = listaFiltrada;
                Session.Add("listaProductos", listaFiltrada);
                dgvlistaProductos.DataBind();
            }
        }

        protected void CriterioFRapido_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarLista();
        }
    }
}