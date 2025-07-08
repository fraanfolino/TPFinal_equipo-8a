using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using Dominio;

namespace Negocio
{
    public class CarroNegocio
    {


        public List<ItemCarrito> ObtenerCarrito(int idUsuario)
        {
            List<ItemCarrito> carrito = new List<ItemCarrito>();
            int idCarro;

            // Obtener el ID del carrito
            AccesoBD a1 = new AccesoBD();
            a1.setearProcedimiento("sp_ObtenerOCrearCarrito");
            a1.setearParametro("@idUsuario", idUsuario);
            a1.ejecutarLectura();
            a1.Lectorbd.Read();
            idCarro = Convert.ToInt32(a1.Lectorbd["idCarro"]);
            a1.cerrarConexion();

            //  Cargar ítems con datos completos
            AccesoBD a2 = new AccesoBD();
            a2.setearProcedimiento("sp_ObtenerItemsCarrito");
            a2.setearParametro("@idCarrito", idCarro);
            a2.ejecutarLectura();

            ItemCarrito ultimoItem = null;

            while (a2.Lectorbd.Read())
            {
                int prodId = Convert.ToInt32(a2.Lectorbd["id_producto"]);
                string nombre = a2.Lectorbd["producto_nombre"].ToString();
                decimal precio = Convert.ToDecimal(a2.Lectorbd["producto_precio"]);
                bool activo = Convert.ToBoolean(a2.Lectorbd["producto_activo"]);

                int cantidad = Convert.ToInt32(a2.Lectorbd["cantidad"]);
                int talleId = Convert.ToInt32(a2.Lectorbd["id_talle"]);
                string talleEtiqueta = a2.Lectorbd["talle_etiqueta"].ToString();
                string urlImagen = a2.Lectorbd["UrlImagen"] == DBNull.Value ? null : a2.Lectorbd["UrlImagen"].ToString();

                // Marca y Categoría construidas directamente
                Marca marca = new Marca
                {
                    Id = Convert.ToInt32(a2.Lectorbd["id_marca"]),
                    Nombre = a2.Lectorbd["marca_nombre"].ToString(),
                    Activo = Convert.ToBoolean(a2.Lectorbd["marca_activo"])
                };

                Categoria categoria = new Categoria
                {
                    Id = Convert.ToInt32(a2.Lectorbd["id_categoria"]),
                    Nombre = a2.Lectorbd["categoria_nombre"].ToString(),
                    Activo = Convert.ToBoolean(a2.Lectorbd["categoria_activo"])
                };

                // Evitar duplicado si mismo producto+talle
                if (ultimoItem != null
                    && ultimoItem.Producto.Id == prodId
                    && ultimoItem.Producto.Talle.Id == talleId)
                {
                    if (!string.IsNullOrEmpty(urlImagen)
                        && !ultimoItem.Producto.ImagenUrl.Contains(urlImagen))
                    {
                        ultimoItem.Producto.ImagenUrl.Add(urlImagen);
                    }
                    continue;
                }

                Producto prod = new Producto
                {
                    Id = prodId,
                    Nombre = nombre,
                    Precio = precio,
                    Activo = activo,
                    Marca = marca,
                    Categoria = categoria,
                    Talle = new Talle { Id = talleId, Etiqueta = talleEtiqueta },
                    ImagenUrl = new List<string>()
                };

                if (!string.IsNullOrEmpty(urlImagen))
                    prod.ImagenUrl.Add(urlImagen);

                ItemCarrito item = new ItemCarrito
                {
                    IdCarrito = idCarro,
                    Producto = prod,
                    Cantidad = cantidad
                };

                carrito.Add(item);
                ultimoItem = item;
            }

            a2.cerrarConexion();
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


        public Pedido ObtenerPedidoCompleto(int idPedido)
        {
            Pedido pedido = new Pedido();
            AccesoBD db = new AccesoBD();

            try
            {
                db.limpiarParametros();
                db.setearProcedimiento("sp_ObtenerPedidoExtendido");
                db.setearParametro("@pedido_id", idPedido);
                db.ejecutarLectura();

                while (db.Lectorbd.Read())
                {
                  
                    if (pedido.IdPedido == 0)
                    {
                        pedido.IdPedido = Convert.ToInt32(db.Lectorbd["PedidoId"]);
                        pedido.NombreCliente = db.Lectorbd["NombreCliente"].ToString();
                        pedido.ModalidadEntrega = db.Lectorbd["ModalidadEntrega"].ToString();
                        pedido.Direccion = db.Lectorbd["Direccion"].ToString();
                        pedido.FormaPago = db.Lectorbd["FormaPago"].ToString();
                        pedido.Total = Convert.ToDecimal(db.Lectorbd["Total"]);
                        pedido.Estado = db.Lectorbd["EstadoPedido"].ToString();
                        pedido.FechaCreacion = Convert.ToDateTime(db.Lectorbd["FechaPedido"]);
                    }

                   
                    DetallePedido item = new DetallePedido
                    {
                        NombreProducto = db.Lectorbd["NombreProducto"].ToString(),
                        TalleEtiqueta = db.Lectorbd["TalleEtiqueta"].ToString(),
                        Cantidad = Convert.ToInt32(db.Lectorbd["Cantidad"]),
                        PrecioUnitario = Convert.ToDecimal(db.Lectorbd["PrecioUnitario"])
                    };

                    pedido.Items.Add(item);
                }

                return pedido;
            }
            finally
            {
                db.cerrarConexion();
            }
        }

        public int registrarPedidoV2(
     int idUsuario,
     string nombreCliente,
     string email,
     string telefono,
     string modalidad,
     string direccion,
     string formaPago,
     decimal total)
        {
            AccesoBD db = new AccesoBD();
            int idPedido = 0;

            try
            {
                db.limpiarParametros();
                db.setearProcedimiento("sp_RegistrarPedidoV2");
                db.setearParametro("@cliente_id", idUsuario);
                db.setearParametro("@nombre_cliente", nombreCliente);
                db.setearParametro("@email", email);
                db.setearParametro("@telefono", telefono);
                db.setearParametro("@modalidad", modalidad);
                db.setearParametro("@direccion", direccion);
                db.setearParametro("@forma_pago", formaPago);
                db.setearParametro("@total", total);

                db.ejecutarLectura();

                if (db.Lectorbd.Read())
                    idPedido = Convert.ToInt32(db.Lectorbd["idPedido"]);
            }
            finally
            {
                db.cerrarConexion();
            }

            return idPedido;
        }


        public void registrarDetallePedidoV2(int idPedido, ItemCarrito item)
        {
            AccesoBD db = new AccesoBD();
            try
            {
                db.limpiarParametros();
                db.setearProcedimiento("sp_RegistrarDetallePedidoV2");
                db.setearParametro("@pedido_id", idPedido);
                db.setearParametro("@nombre_producto", item.Producto.Nombre);
                db.setearParametro("@talle_etiqueta", item.Producto.Talle.Etiqueta);
                db.setearParametro("@cantidad", item.Cantidad);
                db.setearParametro("@precio_unitario", item.Producto.Precio);
                db.ejecutarAccion();
            }
            finally
            {
                db.cerrarConexion();
            }
        }


        




        public List<ItemCarrito> ObtenerDetallesPedido(int pedidoId)
        {
            List<ItemCarrito> detalles = new List<ItemCarrito>();
            AccesoBD db = new AccesoBD();

            try
            {
                db.limpiarParametros();
                db.setearProcedimiento("sp_ObtenerDetallesPedido");
                db.setearParametro("@pedidoId", pedidoId);
                db.ejecutarLectura();

                while (db.Lectorbd.Read())
                {
                    var producto = new Producto
                    {
                        Id = Convert.ToInt32(db.Lectorbd["id_producto"]),
                        Nombre = db.Lectorbd["producto_nombre"].ToString(),
                        Precio = Convert.ToDecimal(db.Lectorbd["precio_unitario"]),
                        Talle = new Talle
                        {
                            Id = Convert.ToInt32(db.Lectorbd["id_talle"]),
                            Etiqueta = db.Lectorbd["talle_etiqueta"].ToString()
                        }
                    };

                    detalles.Add(new ItemCarrito
                    {
                        Producto = producto,
                        Cantidad = Convert.ToInt32(db.Lectorbd["cantidad"])
                    });
                }
            }
            finally { db.cerrarConexion(); }

            return detalles;
        }

        public void vaciarCarrito(int idUsuario)
        {

            AccesoBD db = new AccesoBD();


            try
            {
                db.setearProcedimiento("sp_vaciarCarrito");
                db.setearParametro("@idUsuario", idUsuario);
                db.ejecutarAccion();

            }

            finally
            {

                db.cerrarConexion();
            }
        }


        public void DescontarStock(int productoId, int talleId, int cantidad)
        {
            AccesoBD db = new AccesoBD();
            try
            {
                db.setearProcedimiento("sp_DescontarStock");
                db.setearParametro("idProducto", productoId);
                db.setearParametro("@idTalle", talleId);
                db.setearParametro("@cantidad", cantidad);
                db.ejecutarAccion();
            }
            finally
            {
                db.cerrarConexion();
            }
        }



        public DateTime ObtenerFechaPedido(int pedidoId)
        {
            AccesoBD db = new AccesoBD();
            DateTime fecha = DateTime.MinValue;

            try
            {
                db.setearProcedimiento("sp_ObtenerFechaPedido");
                db.setearParametro("@idPedido", pedidoId);
                db.ejecutarLectura();

                if (db.Lectorbd.Read() && db.Lectorbd["fecha"] != DBNull.Value)
                    fecha = Convert.ToDateTime(db.Lectorbd["fecha"]);
            }
            finally
            {
                db.cerrarConexion();
            }

            return fecha;
        }

        public decimal ObtenerTotalPedido(int pedidoId)
        {
            var db = new AccesoBD();
            db.limpiarParametros();
            db.setearProcedimiento("sp_ObtenerTotalPedido");
            db.setearParametro("@pedidoId", pedidoId);
            db.ejecutarLectura();

            decimal total = 0;
            if (db.Lectorbd.Read())
                total = (decimal)db.Lectorbd["total"];

            db.cerrarConexion();
            return total;
        }
        public void RegistrarDetallePedido(int pedidoId, ItemCarrito item)
        {
            AccesoBD db = new AccesoBD();
            db.limpiarParametros();
            db.setearProcedimiento("sp_RegistrarPedidoDetalle");
            db.setearParametro("@pedido_id", pedidoId);
            db.setearParametro("@producto_id", item.Producto.Id);
            db.setearParametro("@talle_id", item.Producto.Talle.Id);
            db.setearParametro("@cantidad", item.Cantidad);
            db.setearParametro("@precio_unitario", item.Producto.Precio);
            db.ejecutarAccion();
            db.cerrarConexion();
        }
        public int RegistrarPedido(int idUsuario, decimal total)
        {
           AccesoBD db = new AccesoBD();
            db.limpiarParametros();
            db.setearProcedimiento("sp_RegistrarPedido");
            db.setearParametro("@cliente_id", idUsuario);
            db.setearParametro("@total", total);
            db.ejecutarLectura();

            int idPedido = 0;
            if (db.Lectorbd.Read())
                idPedido = Convert.ToInt32(db.Lectorbd["idPedido"]);

            db.cerrarConexion();
            return idPedido;
        }

        public int ObtenerOCrearCarrito(int idUsuario)
        {
            AccesoBD db = new AccesoBD();
            db.limpiarParametros();
            db.setearProcedimiento("sp_ObtenerOCrearCarrito");
            db.setearParametro("@idUsuario", idUsuario);
            db.ejecutarLectura();

            int idCarrito = 0;
            if (db.Lectorbd.Read())
            {
                idCarrito = Convert.ToInt32(db.Lectorbd["idCarro"]);
            }

            db.cerrarConexion();
            return idCarrito;
        }


        public int ObtenerStock(int productoId, int talleId)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_ObtenerStock");
                datos.setearParametro("@producto_id", productoId);
                datos.setearParametro("@talle_id", talleId);
                datos.ejecutarLectura();

                if (datos.Lectorbd.Read())
                    return Convert.ToInt32(datos.Lectorbd["cantidad"]);

                return 0;
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


        public void SumarCantidadBD(int idCarrito, int idProducto, int idTalle)
        {
            AccesoBD db = new AccesoBD();
            db.limpiarParametros();
            db.setearProcedimiento("sp_SumarCantidadCarrito");
            db.setearParametro("@idCarrito", idCarrito);
            db.setearParametro("@idProducto", idProducto);
            db.setearParametro("@idTalle", idTalle);
            db.ejecutarAccion();
        }

        public void RestarCantidadBD(int idCarrito, int idProducto, int idTalle)
        {
            AccesoBD db = new AccesoBD();
            db.limpiarParametros();
            db.setearProcedimiento("sp_RestarCantidadCarrito");
            db.setearParametro("@idCarrito", idCarrito);
            db.setearParametro("@idProducto", idProducto);
            db.setearParametro("@idTalle", idTalle);
            db.ejecutarAccion();


        }
    }
}