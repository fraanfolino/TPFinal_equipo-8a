using System;
using System.Collections.Generic;
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
        public List<Producto> FiltrarProductosPorMarca(string marca)
        {
            AccesoBD datos = new AccesoBD();
            List<Producto> listaProductos = new List<Producto>();
            try
            {
                datos.setearProcedimiento("sp_FiltrarProductosPorMarca");
                datos.limpiarParametros(); 

                
                if (!string.IsNullOrEmpty(marca) && marca != "0")
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



    }
}
