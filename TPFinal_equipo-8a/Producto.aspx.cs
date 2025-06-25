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
            ddlCategoria.DataSource = CargarCategorias();
            ddlCategoria.DataBind();

            ddlMarca.DataSource = CargarMarcas();
            ddlMarca.DataBind();

            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int index) && PrecargarElementos(index) == 1)
            {
                //if (PrecargarElementos(index) == 1);
                btnAgregar.Visible = false;
                btnModificar.Visible = true;
                Titulo.Text = "Modificar Producto";
            }
            else
            {
                btnAgregar.Visible = true;
                btnModificar.Visible = false;
                ImagenesProducto = new List<string>();
            }
            RefreshImagenes();
        }

        private int PrecargarElementos(int index)
        {
            btnAgregar.Visible = false;
            btnModificar.Visible = true;

            ProductoNegocio productoNegocio = new ProductoNegocio();
            Producto producto = productoNegocio.ObtenerProducto(index);

            if (producto == null)
            {
                return 0;
            }

            txtNombre.Text = producto.Nombre;
            txtDescripcion.Text = producto.Descripcion;

            txtPrecio.Text = producto.Precio.ToString();
            ddlCategoria.SelectedValue = producto.Categoria.Nombre;
            ddlMarca.SelectedValue = producto.Marca.Nombre;

            ActualizarListaImg(producto.ImagenUrl);
            return 1;
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
                errorMensaje.Text = "Error al agregar: " + ex;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Producto producto = new Producto();
            producto.Id = Convert.ToInt32(Request.QueryString["id"]);
            producto.Nombre = txtNombre.Text;
            producto.Descripcion = txtDescripcion.Text;
            producto.Precio = decimal.Parse(txtPrecio.Text);
            producto.ImagenUrl = ImagenesProducto;

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

            if (CompararProductos(producto, new ProductoNegocio().ObtenerProducto(producto.Id)))
            {
                errorMensaje.Visible = true;
                errorMensaje.Text = "No se han realizado cambios en el producto.";
                return;
            }

            try
            {
                ProductoNegocio productoNegocio = new ProductoNegocio();
                productoNegocio.ModificarProducto(producto);
                exitoMensaje.Visible = true;
                exitoMensaje.Text = "Producto modificado correctamente.";
            }
            catch (Exception ex)
            {
                errorMensaje.Visible = true;
                errorMensaje.Text = "Error al modificar: " + ex;
            }
        }

        protected bool CompararProductos(Producto prod1, Producto prod2)
        {
            if (prod1 == null || prod2 == null)
                return false;

            bool comparar =
                 prod1.Id == prod2.Id &&
                 prod1.Nombre == prod2.Nombre &&
                 prod1.Descripcion == prod2.Descripcion &&
                 prod1.Precio == prod2.Precio &&
                 prod1.Marca?.Id == prod2.Marca?.Id &&
                 prod1.Categoria?.Id == prod2.Categoria?.Id &&
                 prod1.ImagenUrl != null &&
                 prod2.ImagenUrl != null &&
                 prod1.ImagenUrl.SequenceEqual(prod2.ImagenUrl);

            return comparar;
        }
    }
}