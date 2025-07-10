using System;
using System.Linq;
using System.Web.UI;
using Negocio;
using System.Collections.Generic;
using Dominio;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class DetalleProducto : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                int idProducto;
                if (int.TryParse(Request.QueryString["Id"], out idProducto))
                {
                    CargarDetalle(idProducto);
                    CargarTalles(idProducto);
                }
                else
                {
                    Response.Redirect("Catalogo.aspx");
                }
            }
        }

        private void CargarTalles(int idProducto)
        {
            CarroNegocio negocio = new CarroNegocio();
            List<Dominio.Talle> listaTalles = negocio.ObtenerTallesPorProducto(idProducto);

            ddlTalles.DataSource = listaTalles;
            ddlTalles.DataTextField = "Etiqueta";
            ddlTalles.DataValueField = "Id";
            ddlTalles.DataBind();

          
        }

        protected void btnAgregarCarro_Click(object sender, EventArgs e)
        {
            int idUsuario = ((Usuario)Session["usuario"]).Id;
            int idProducto = Convert.ToInt32(Request.QueryString["Id"]);
            int idTalle = Convert.ToInt32(ddlTalles.SelectedValue);

            Producto producto = new ProductoNegocio().ObtenerProducto(idProducto);
            producto.Talle = new Dominio.Talle
            { Id = idTalle, 
             Etiqueta = ddlTalles.SelectedItem.Text
            };

            ItemCarrito item = new ItemCarrito
            { Producto = producto,
             Cantidad = 1 
            
            };
           
            new CarroNegocio().AgregarOActualizarProductoEnCarro(item, idUsuario);

            Response.Redirect("Carro.aspx");
        }

        private void CargarDetalle(int id)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            Producto producto = productoNegocio.ObtenerProducto(id);

            if (producto != null)
            {
                lblNombre.Text = producto.Nombre;
                lblDescripcion.Text = producto.Descripcion;
                lblPrecio.Text = "$ " + producto.Precio.ToString("F2");

                rptImagenes.DataSource = producto.ImagenUrl.Select(url => new { Url = url }).ToList();
                rptImagenes.DataBind();
            }
            else
            {
                Response.Redirect("Catalogo.aspx");
            }
        }
    }
}