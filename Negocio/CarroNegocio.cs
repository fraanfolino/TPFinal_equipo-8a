using System;
using System.Collections.Generic;
using Dominio; 

namespace Negocio
{
    public class CarroNegocio
    {

        public void AgregarOActualizarProductoEnCarro(ItemCarrito item, int idUsuario)
        {
            AccesoBD acceso = new AccesoBD();
            try
            {
                acceso.limpiarParametros();
                acceso.setearProcedimiento("sp_AgregarOActualizarCarrito");
                acceso.setearParametro("@usuarioId", idUsuario);
                acceso.setearParametro("@productoId", item.Producto.Id);
                acceso.setearParametro("@talleId", item.Producto.Talle.Id);
                acceso.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                acceso.cerrarConexion();
            }
        }

        public List<Talle> ObtenerTallesPorProducto(int idProducto)
        {
            List<Talle> listaTalles = new List<Talle>();
            AccesoBD acceso = new AccesoBD();

            try
            {
                acceso.limpiarParametros();
                acceso.setearProcedimiento("sp_ObtenerTallesPorProducto");
                acceso.setearParametro("@productoId", idProducto);
                acceso.ejecutarLectura();

                while (acceso.Lectorbd.Read())
                {
                    Talle talle = new Talle();
                    talle.Id = Convert.ToInt32(acceso.Lectorbd["id"]);
                    talle.Etiqueta = acceso.Lectorbd["etiqueta"].ToString();
                    listaTalles.Add(talle);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                acceso.cerrarConexion();
            }

            return listaTalles;
        }
        public List<ItemCarrito> ObtenerCarrito(int idUsuario)
        {
            List<ItemCarrito> carrito = new List<ItemCarrito>();
            AccesoBD acceso = new AccesoBD();

            try
            {
                acceso.limpiarParametros();
                acceso.setearProcedimiento("sp_ObtenerCarritoPorUsuario");
                acceso.setearParametro("@usuarioId", idUsuario);
                acceso.ejecutarLectura();

                ItemCarrito ultimoItem = null;

                while (acceso.Lectorbd.Read())
                {
                    int prodId = Convert.ToInt32(acceso.Lectorbd["producto_id"]);
                    string nombre = acceso.Lectorbd["nombre"].ToString();
                    decimal precio = Convert.ToDecimal(acceso.Lectorbd["precio"]);
                    int cantidad = Convert.ToInt32(acceso.Lectorbd["cantidad"]);
                    string talleEtiqueta = acceso.Lectorbd["talle_etiqueta"].ToString(); 

                    if (ultimoItem != null && ultimoItem.Producto.Id == prodId)
                    {
                        if (acceso.Lectorbd["UrlImagen"] != DBNull.Value)
                        {
                            string imagenUrl = Convert.ToString(acceso.Lectorbd["UrlImagen"]);
                            if (!ultimoItem.Producto.ImagenUrl.Contains(imagenUrl))
                            {
                                ultimoItem.Producto.ImagenUrl.Add(imagenUrl);
                            }
                        }
                        continue;
                    }

                    Producto prod = new Producto();
                    prod.Id = prodId;
                    prod.Nombre = nombre;
                    prod.Precio = precio;

                    if (acceso.Lectorbd["UrlImagen"] != DBNull.Value)
                        prod.ImagenUrl = new List<string> { Convert.ToString(acceso.Lectorbd["UrlImagen"]) };
                    else
                        prod.ImagenUrl = new List<string>();

                    ItemCarrito item = new ItemCarrito()
                    {
                        Producto = prod,
                        Cantidad = cantidad,
                        Talle = talleEtiqueta 
                    };

                    carrito.Add(item);
                    ultimoItem = item;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                acceso.cerrarConexion();
            }

            return carrito;
        }




        public void SumarCantidadBD(int usuarioId, int productoId, string talle)
        {
            AccesoBD datos = new AccesoBD();
            datos.setearProcedimiento("sp_SumarCantidadCarrito");
            datos.setearParametro("@usuarioId", usuarioId);
            datos.setearParametro("@productoId", productoId);
            datos.setearParametro("@talle", talle); 
            datos.ejecutarAccion();
        }

        public void RestarCantidadBD(int usuarioId, int productoId, string talle)
        {
            AccesoBD datos = new AccesoBD();
            datos.setearProcedimiento("sp_RestarCantidadCarrito");
            datos.setearParametro("@usuarioId", usuarioId);
            datos.setearParametro("@productoId", productoId);
            datos.setearParametro("@talle", talle);
            datos.ejecutarAccion();
        }

    }
}