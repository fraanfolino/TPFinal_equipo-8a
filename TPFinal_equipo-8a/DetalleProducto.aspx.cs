using System;

using System.Linq;
using System.Web.UI;
using Negocio;
using System.Collections.Generic;
using Dominio; 

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
            List<Talle> listaTalles = negocio.ObtenerTallesPorProducto(idProducto);

            ddlTalles.DataSource = listaTalles;
            ddlTalles.DataTextField = "Etiqueta"; 
            ddlTalles.DataValueField = "Id"; 
            ddlTalles.DataBind();
        }

        protected void btnAgregarCarro_Click(object sender, EventArgs e)
        {
            int idProducto;
            if (int.TryParse(Request.QueryString["Id"], out idProducto))
            {
                int idUsuario = ((Usuario)Session["usuario"]).Id;

                CarroNegocio carroNegocio = new CarroNegocio();
                carroNegocio.AgregarOActualizarProductoEnCarro(idProducto, idUsuario);

                Response.Redirect("Carro.aspx");
            }
        }
        private void CargarDetalle(int id)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            Producto producto = productoNegocio.ObtenerProducto(id);

            if (producto != null)
            {
                lblNombre.Text = producto.Nombre;
                lblDescripcion.Text = producto.Descripcion;
                lblPrecio.Text = producto.Precio.ToString("F2");

               
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
