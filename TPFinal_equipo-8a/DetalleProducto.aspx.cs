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
            List<Talle> listaTalles = negocio.ObtenerTallesPorProducto(idProducto);

            ddlTalles.DataSource = listaTalles;
            ddlTalles.DataTextField = "Etiqueta";
            ddlTalles.DataValueField = "Id";
            ddlTalles.DataBind();

            // Agregamos el ítem por defecto después del DataBind.
            ddlTalles.Items.Insert(0, new ListItem("Selecciona un talle...", "0"));
        }

        protected void btnAgregarCarro_Click(object sender, EventArgs e)
        {
            int idProducto;
            if (int.TryParse(Request.QueryString["Id"], out idProducto))
            {
                int idUsuario = ((Usuario)Session["usuario"]).Id;

                // Debug: Comprueba que ddlTalles.SelectedValue tenga el valor esperado.
                string valorSeleccionado = ddlTalles.SelectedValue;
                if (string.IsNullOrEmpty(valorSeleccionado) || valorSeleccionado == "0")
                {
                    // Aquí podrías mostrar un mensaje de error de validación.
                    return;
                }

                // Convierte a entero.
                int idTalle = Convert.ToInt32(valorSeleccionado);

                ProductoNegocio productoNegocio = new ProductoNegocio();
                Producto producto = productoNegocio.ObtenerProducto(idProducto);

                // Se inyecta el talleselccionado en el objeto Producto.
                producto.Talle = new Talle
                {
                    Id = idTalle,
                    Etiqueta = ddlTalles.SelectedItem.Text
                };

                // Se crea el ítem del carrito.
                ItemCarrito item = new ItemCarrito
                {
                    Producto = producto,
                    Cantidad = 1
                };

                CarroNegocio carroNegocio = new CarroNegocio();
                carroNegocio.AgregarOActualizarProductoEnCarro(item, idUsuario);

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