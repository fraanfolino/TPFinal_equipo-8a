using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

using Dominio;

namespace Negocio
{
    public class ProductoNegocio
    {
        public Producto ObtenerProducto(int id)
        {
            AccesoBD datos = new AccesoBD();
            Producto producto = null;
            try
            {
               
                datos.setearProcedimiento("dbo.sp_ObtenerProductoDetalle");
           
                datos.limpiarParametros();
               
                datos.setearParametro("@id", id);

                datos.ejecutarLectura();

                Producto ultCarga = null;
                while (datos.Lectorbd.Read())
                {
                    int idProdBD = Convert.ToInt32(datos.Lectorbd["Id"]);

                    if (ultCarga != null && ultCarga.Id == idProdBD)
                    {
                        if (datos.Lectorbd["UrlImagen"] != DBNull.Value)
                        {
                            string imagenUrl = Convert.ToString(datos.Lectorbd["UrlImagen"]);
                            ultCarga.ImagenUrl.Add(imagenUrl);
                        }
                        continue;
                    }

                    producto = new Producto();
                    producto.Id = idProdBD;
                    producto.Nombre = datos.Lectorbd["Nombre"].ToString();
                    producto.Descripcion = datos.Lectorbd["Descripcion"].ToString();
                    producto.Precio = Convert.ToDecimal(datos.Lectorbd["Precio"]);
                    producto.Activo = Convert.ToBoolean(datos.Lectorbd["Activo"]);

                    producto.Categoria = new Categoria();
                    producto.Categoria.Id = Convert.ToInt32(datos.Lectorbd["IdCategoria"]);
                    producto.Categoria.Nombre = Convert.ToString(datos.Lectorbd["Categoria"]);

                    producto.Marca = new Marca();
                    producto.Marca.Id = Convert.ToInt32(datos.Lectorbd["IdMarca"]);
                    producto.Marca.Nombre = Convert.ToString(datos.Lectorbd["Marca"]);

                    if (datos.Lectorbd["UrlImagen"] != DBNull.Value)
                        producto.ImagenUrl = new List<string> { Convert.ToString(datos.Lectorbd["UrlImagen"]) };
                    else
                        producto.ImagenUrl = new List<string>();

                    ultCarga = producto;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return producto;
        }

        public List<Producto> FiltrarProductosPorMarca(int marca)
        {
            AccesoBD datos = new AccesoBD();
            List<Producto> listaProductos = new List<Producto>();
            try
            {
                datos.setearProcedimiento("sp_FiltrarProductosPorMarca");
                datos.limpiarParametros();


                if (marca != 0)
                    datos.setearParametro("@marca", marca);
                else
                    datos.setearParametro("@marca", DBNull.Value);

                datos.ejecutarLectura();

                Producto ultCarga = null;
                while (datos.Lectorbd.Read())
                {
                    int idArtBD = Convert.ToInt32(datos.Lectorbd["Id"]);

                    if (ultCarga != null && ultCarga.Id == idArtBD)
                    {
                        if (datos.Lectorbd["UrlImagen"] != DBNull.Value)
                        {
                            string imagenUrl = Convert.ToString(datos.Lectorbd["UrlImagen"]);
                            ultCarga.ImagenUrl.Add(imagenUrl);
                        }
                        continue;
                    }

                    Producto aux = new Producto();
                    aux.Id = idArtBD;
                    aux.Nombre = datos.Lectorbd["Nombre"].ToString();
                    aux.Descripcion = datos.Lectorbd["Descripcion"].ToString();
                    aux.Precio = Convert.ToDecimal(datos.Lectorbd["Precio"]);

                    if (datos.Lectorbd["UrlImagen"] != DBNull.Value)
                    {
                        aux.ImagenUrl = new List<string> { Convert.ToString(datos.Lectorbd["UrlImagen"]) };
                    }
                    else
                    {
                        aux.ImagenUrl = new List<string>();
                    }

                    listaProductos.Add(aux);
                    ultCarga = aux;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return listaProductos;
        }

        public List<Producto> ListarProductosEnStock()
        {
            AccesoBD datos = new AccesoBD();
            List<Producto> listaProductos = new List<Producto>();
            try
            
            {
                datos.setearProcedimiento("sp_ListarProductosConStock");
                datos.ejecutarLectura();

                Producto ultCarga = null;

                
                while (datos.Lectorbd.Read())
                {
                    if (!Convert.ToBoolean(datos.Lectorbd["MActivo"]) || !Convert.ToBoolean(datos.Lectorbd["CActivo"]))
                    {
                        continue;
                    }

                    int idArtBD = Convert.ToInt32(datos.Lectorbd["Id"]);

                    //para no cargar duplicado, si es el mismo solo agrego imagen
                    if (ultCarga != null && ultCarga.Id == idArtBD)
                    {
                        if (datos.Lectorbd["UrlImagen"] != null)
                        {
                            string imagenUrl = Convert.ToString(datos.Lectorbd["UrlImagen"]);
                            ultCarga.ImagenUrl.Add(imagenUrl);
                        }
                        continue;
                    }

                    Producto aux = new Producto();
                    aux.Id = (int)datos.Lectorbd["Id"];
                    aux.Nombre = (string)datos.Lectorbd["Nombre"];
                    aux.Descripcion = (string)datos.Lectorbd["Descripcion"];
                    aux.Precio = (decimal)datos.Lectorbd["Precio"];
                    

                    if (datos.Lectorbd["UrlImagen"] != null)
                    {
                        aux.ImagenUrl = new List<string> { Convert.ToString(datos.Lectorbd["UrlImagen"]) };
                    }

                    listaProductos.Add(aux);
                    ultCarga = aux;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return listaProductos;

        }

        public List<Producto> ListarProductos(string marca = null, string categoria = null)
        {
            AccesoBD datos = new AccesoBD();
            List<Producto> listaProductos = new List<Producto>();

            try
            {
                datos.setearProcedimiento("sp_ListarProductosPorMarcayCategoria");
                datos.setearParametro("@MarcaNombre", string.IsNullOrEmpty(marca) ? (object)DBNull.Value : marca);
                datos.setearParametro("@CategoriaNombre", string.IsNullOrEmpty(categoria) ? (object)DBNull.Value : categoria);
                datos.ejecutarLectura();


                while (datos.Lectorbd.Read())
                {
                
                    Producto aux = new Producto();
                    aux.Id = Convert.ToInt32(datos.Lectorbd["Id"]);
                    aux.Nombre = Convert.ToString(datos.Lectorbd["Nombre"]);
                    aux.Descripcion = Convert.ToString(datos.Lectorbd["Descripcion"]);
                    aux.Precio = Convert.ToDecimal(datos.Lectorbd["Precio"]);

                    Categoria cate = new Categoria();
                    cate.Id = Convert.ToInt32(datos.Lectorbd["IdCategoria"]);
                    cate.Nombre = Convert.ToString(datos.Lectorbd["Categoria"]);
                    aux.Categoria = cate;

                    Marca mar = new Marca();
                    mar.Id = Convert.ToInt32(datos.Lectorbd["IdMarca"]);
                    mar.Nombre = Convert.ToString(datos.Lectorbd["Marca"]);
                    aux.Marca = mar;


                    aux.ImagenUrl = new List<string>();

                    if (datos.Lectorbd["UrlImagen"] != DBNull.Value)
                    {
                        aux.ImagenUrl.Add(Convert.ToString(datos.Lectorbd["UrlImagen"]));
                    }

                    listaProductos.Add(aux);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return listaProductos;
        }

        public List<Producto> ListarProductosSinImagenes()
        {
            AccesoBD datos = new AccesoBD();
            List<Producto> listaProductos = new List<Producto>();

            try
            {
                datos.setearProcedimiento("sp_ListarTodosLosProductosSinImagen");
                datos.ejecutarLectura();


                while (datos.Lectorbd.Read())
                {
                    Producto aux = new Producto();
                    aux.Id = Convert.ToInt32(datos.Lectorbd["Id"]);
                    aux.Nombre = Convert.ToString(datos.Lectorbd["Nombre"]);
                    aux.Descripcion = Convert.ToString(datos.Lectorbd["Descripcion"]);
                    aux.Precio = Convert.ToDecimal(datos.Lectorbd["Precio"]);

                    Categoria cate = new Categoria();
                    cate.Id = Convert.ToInt32(datos.Lectorbd["IdCategoria"]);
                    cate.Nombre = Convert.ToString(datos.Lectorbd["Categoria"]);
                    aux.Categoria = cate;

                    Marca mar = new Marca();
                    mar.Id = Convert.ToInt32(datos.Lectorbd["IdMarca"]);
                    mar.Nombre = Convert.ToString(datos.Lectorbd["Marca"]);
                    aux.Marca = mar;

                    aux.Activo = Convert.ToBoolean(datos.Lectorbd["Activo"]);

                    listaProductos.Add(aux);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return listaProductos;
        }

        public DataTable ListarStock(int id)
        {
            AccesoBD datos = new AccesoBD();
            DataTable tabla = new DataTable();

            try
            {
                datos.setearProcedimiento("sp_ObtenerStockPorId");
                datos.setearParametro("@IdProducto", id);
                datos.ejecutarLectura();
                tabla.Load(datos.Lectorbd);
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return tabla;
        }

        public int AgregarStock(int cantidad, int idProdu, List<string> talles)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_AgregarStockProductoTalle");

                int contador = 0;

                foreach (var talle in talles)
                {
                    datos.setearParametro("@ProductoID", idProdu);
                    datos.setearParametro("@EtiquetaTalle", talle);
                    datos.setearParametro("@CantidadAgregar", cantidad);
                    datos.ejecutarMasAcciones();
                    datos.limpiarParametros();
                    contador++;
                }

                if (contador > 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public int DescontarStock(int cantidad, int IdProdu, List<string> talles)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_DescontarStockProductoTalle");

                int contador = 0;

                foreach (var talle in talles)
                {
                    datos.setearParametro("@ProductoID", IdProdu);
                    datos.setearParametro("@EtiquetaTalle", talle);
                    datos.setearParametro("@CantidadDescontar", cantidad);
                    datos.ejecutarMasAcciones();
                    datos.limpiarParametros();

                    contador++;
                }

                if (contador > 0)
                {
                    return 1;
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                return -1;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void AgregarProducto(Producto produ)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_InsertarProducto");
                datos.setearParametro("@nombre", produ.Nombre);
                datos.setearParametro("@descripcion", produ.Descripcion);
                datos.setearParametro("@precio", produ.Precio);
                datos.setearParametro("@marca_id", produ.Marca.Id);
                datos.setearParametro("@categoria_id", produ.Categoria.Id);
                int id = datos.ejecutarAccionconreturn();

                foreach (string imagen in produ.ImagenUrl)
                {
                    datos.limpiarParametros();
                    datos.setearProcedimiento("sp_InsertarImagenProducto");
                    datos.setearParametro("@producto_id", id);
                    datos.setearParametro("@url_imagen", imagen);
                    datos.setearParametro("@es_principal", 0);
                    datos.ejecutarMasAcciones();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void ModificarProducto(Producto produ)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_ModificarProducto");
                datos.setearParametro("@producto_id", produ.Id);
                datos.setearParametro("@nombre", produ.Nombre);
                datos.setearParametro("@descripcion", produ.Descripcion);
                datos.setearParametro("@precio", produ.Precio);
                datos.setearParametro("@marca_id", produ.Marca.Id);
                datos.setearParametro("@categoria_id", produ.Categoria.Id);
                datos.ejecutarAccion();

                datos.limpiarParametros();
                datos.setearParametro("@producto_id", produ.Id);
                datos.setearConsulta("DELETE FROM imagenes_productos WHERE producto_id = @producto_id");
                datos.ejecutarMasAcciones();

                foreach (string imagen in produ.ImagenUrl)
                {
                    datos.limpiarParametros();
                    datos.setearProcedimiento("sp_InsertarImagenProducto");
                    datos.setearParametro("@producto_id", produ.Id);
                    datos.setearParametro("@url_imagen", imagen);
                    datos.setearParametro("@es_principal", 0);
                    datos.ejecutarMasAcciones();
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public int ObtenerIdConNombre(string nombreProducto)
        {
            AccesoBD datos = new AccesoBD();
            int idProducto = -1;

            try
            {
                datos.setearProcedimiento("sp_ObtenerIdProductoPorNombre");
                datos.setearParametro("@nombre_producto", nombreProducto);
                datos.ejecutarLectura();

                if (datos.Lectorbd.Read())
                {
                    idProducto = datos.Lectorbd.GetInt32(0);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return idProducto;
        }

        public void BajaProducto(int id)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("sp_BajaProducto");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void AltaProducto(int id)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("sp_AltaProducto");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public bool ChequearMarcaActiva(int id)
        {
            AccesoBD datos = new AccesoBD();
            bool activo = false;

            try
            {
                datos.setearProcedimiento("chequearMarcaActiva");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                while (datos.Lectorbd.Read())
                {
                    activo = Convert.ToBoolean(datos.Lectorbd["MarcaActiva"]);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return activo;
        }

        public bool ChequearCategoriaActiva(int id)
        {
            AccesoBD datos = new AccesoBD();
            bool activo = false;

            try
            {
                datos.setearProcedimiento("chequearCategoriaActiva");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();
                
                while (datos.Lectorbd.Read())
                {
                    activo = Convert.ToBoolean(datos.Lectorbd["CategoriaActiva"]);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return activo;
        }
    }
}
