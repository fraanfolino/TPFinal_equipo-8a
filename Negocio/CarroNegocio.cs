using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using Dominio; 

namespace Negocio
{
    public class CarroNegocio
    {


        public Carrito ObtenerCarrito(int idUsuario)
        {
            Carrito carrito = new Carrito { IdUsuario = idUsuario };

            /* creamos u obtnemos el carrito*/
            
            AccesoBD acceso1 = new AccesoBD();
            try
            {
                acceso1.limpiarParametros();
                acceso1.setearProcedimiento("sp_ObtenerOCrearCarrito");
                acceso1.setearParametro("@idUsuario", idUsuario);
                acceso1.ejecutarLectura();
                acceso1.Lectorbd.Read();
                carrito.IdCarro = Convert.ToInt32(acceso1.Lectorbd["idCarro"]);
            }
            finally
            {
                acceso1.cerrarConexion();
            }

           
            /* obtenemos los items de ese IdCarro*/

            AccesoBD acceso2 = new AccesoBD();
            try
            {
                acceso2.limpiarParametros();
                acceso2.setearProcedimiento("sp_ObtenerItemsCarrito");
                acceso2.setearParametro("@idCarrito", carrito.IdCarro);
                acceso2.ejecutarLectura();

                while (acceso2.Lectorbd.Read())
                {
                    Producto producto = new Producto
                    {
                        Id = Convert.ToInt32(acceso2.Lectorbd["id_producto"]),
                        Nombre = acceso2.Lectorbd["producto_nombre"].ToString(),
                        Precio = Convert.ToDecimal(acceso2.Lectorbd["producto_precio"]),
                        Talle = new Talle
                        {
                            Id = Convert.ToInt32(acceso2.Lectorbd["id_talle"]),
                            Etiqueta = acceso2.Lectorbd["talle_etiqueta"].ToString()
                        }
                    };

                    ItemCarrito item = new ItemCarrito
                    {
                        IdItemCarro = Convert.ToInt32(acceso2.Lectorbd["id_item"]),
                        IdCarrito = carrito.IdCarro,
                        Producto = producto,
                        Cantidad = Convert.ToInt32(acceso2.Lectorbd["cantidad"])
                    };

                    carrito.Items.Add(item);
                }
            }
            finally
            {
                acceso2.cerrarConexion();
            }

            return carrito;
        }
     

        public void AgregarOActualizarProductoEnCarro(ItemCarrito item, int idUsuario)
        {
            int idCarrito;

            
            AccesoBD a1 = new AccesoBD();
            try
            {
                a1.limpiarParametros();
                a1.setearProcedimiento("sp_ObtenerOCrearCarrito");
                a1.setearParametro("@idUsuario", idUsuario);
                a1.ejecutarLectura();
                a1.Lectorbd.Read();
                idCarrito = Convert.ToInt32(a1.Lectorbd["idCarro"]);
            }
            finally { a1.cerrarConexion(); }

            
            AccesoBD a2 = new AccesoBD();
            try
            {
                a2.limpiarParametros();
                a2.setearProcedimiento("sp_AgregarOActualizarItemCarrito");
                a2.setearParametro("@idCarrito", idCarrito);
                a2.setearParametro("@idProducto", item.Producto.Id);
                a2.setearParametro("@idTalle", item.Producto.Talle.Id);
                a2.setearParametro("@cantidad", item.Cantidad);
                a2.ejecutarAccion();
            }
            finally { a2.cerrarConexion(); }
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

        /*public List<ItemCarrito> ObtenerCarrito(int idUsuario)
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

                   
                    if (ultimoItem != null &&
                        ultimoItem.Producto.Id == prodId &&
                        ultimoItem.Producto.Talle.Etiqueta == talleEtiqueta)
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

                   
                    prod.Talle = new Talle()
                    {
                        Etiqueta = talleEtiqueta
                    };

                    ItemCarrito item = new ItemCarrito()
                    {
                        Producto = prod,
                        Cantidad = cantidad
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
        }*/



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