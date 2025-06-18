using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class Agregar : System.Web.UI.Page
    {
        private List<string> ImagenesProducto
        {
            get => ViewState["ImagenesProducto"] as List<string> ?? new List<string>();
            set => ViewState["ImagenesProducto"] = value;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ChequearArgumentos();
            }
            else
            {
                IniciarControles();
            }
        }

        private void IniciarControles()
        {
            exitoMensaje.Visible = false;
            errorMensaje.Visible = false;

            ddlCategoria.DataSource = CargarCategorias();
            ddlCategoria.DataBind();

            ddlMarca.DataSource = CargarMarcas();
            ddlMarca.DataBind();

            ImagenesProducto = new List<string>();

            RefreshImagenes();
        }

        public List<string> CargarCategorias()
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            List<string> listaCategorias = new List<string>();

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

            foreach (var marca in marcaNegocio.ListarMarcas())
            {
                listaMarcas.Add(marca.Nombre);
            }
            return listaMarcas;
        }

        private void EliminarImagenPorIndice(int index)
        {
            var lista = ViewState["ImagenesProducto"] as List<string>;
            if (lista != null && index >= 0 && index < lista.Count)
            {
                var imagenes = ImagenesProducto;
                imagenes.RemoveAt(index);
                ActualizarListaImg(imagenes);
            }
        }

        private void ActualizarListaImg(List<string> imgProductos)
        {
            ImagenesProducto = imgProductos;
            RefreshImagenes();
        }

        private void AgregarImgALista(string nuevaImagen)
        {
            var imagenes = ImagenesProducto;
            imagenes.Add(nuevaImagen);
            ImagenesProducto = imagenes;
            RefreshImagenes();
        }

        private void RefreshImagenes()
        {
            rptImagenes.DataSource = ImagenesProducto;
            rptImagenes.DataBind();

            rptIndicadores.DataSource = ImagenesProducto;
            rptIndicadores.DataBind();

            rptImagenesLista.DataSource = ImagenesProducto;
            rptImagenesLista.DataBind();
        }

        private void ChequearArgumentos()
        {
            string eventTarget = Request["__EVENTTARGET"];
            string eventArgument = Request["__EVENTARGUMENT"];

            if (eventTarget == UpdatePanel2.UniqueID && eventArgument.StartsWith("ELIMINAR_IMAGEN:"))
            {
                string indexStr = eventArgument.Substring("ELIMINAR_IMAGEN:".Length);
                if (int.TryParse(indexStr, out int index))
                {
                    EliminarImagenPorIndice(index);
                }
            }

            if (!string.IsNullOrEmpty(eventArgument) && eventArgument.StartsWith("AGREGAR_IMAGEN:"))
            {
                string nuevaImagen = eventArgument.Substring("AGREGAR_IMAGEN:".Length);
                AgregarImgALista(nuevaImagen);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Producto producto = new Producto();

            //ete mar y catego negocio mandarlo a la bd 
            //otro diiiiaaaa....
            //dentro de marcanegocio este metodo? q devuelva el id mandandole el nombre
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            foreach (var marca in marcaNegocio.ListarMarcas())
            {
               if (marca.Nombre == ddlMarca.SelectedValue)
               {
                    producto.Marca = marca;
                    break;
               }
            }

            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            foreach (var categoria in categoriaNegocio.ListarCategorias())
            {
                if (categoria.Nombre == ddlCategoria.SelectedValue)
                {
                    producto.Categoria = categoria;
                    break;
                }
            }

            producto.Nombre = txtNombre.Text;
            producto.Descripcion = txtDescripcion.Text;
            producto.Precio = decimal.Parse(txtPrecio.Text);
            producto.ImagenUrl = ImagenesProducto;

            try
            {
                ProductoNegocio productoNegocio = new ProductoNegocio();
                productoNegocio.AgregarProducto(producto);
                exitoMensaje.Visible = true;
                exitoMensaje.Text = "Producto agregado correctamente.";
            }
            catch (Exception ex)
            {
                errorMensaje.Visible = true;
                errorMensaje.Text = "Error al eliminar stock:" + ex;
            }
        }
    }
}