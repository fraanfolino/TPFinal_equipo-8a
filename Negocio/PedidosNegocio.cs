using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;


namespace Negocio
{
    public class PedidosNegocio
    {
        public List<Pedido> ObtenerPedidos()
        {
            
            List<Pedido> pedidos = new List<Pedido>();
            AccesoBD db = new AccesoBD();

            try
            {
                db.setearProcedimiento("sp_ObtenerTodosLosPedidos");
                db.ejecutarLectura();

                while (db.Lectorbd.Read())
                {
                    int idActual = Convert.ToInt32(db.Lectorbd["PedidoId"]);
                    Pedido pedido = pedidos.Find(p => p.IdPedido == idActual);

                    if (pedido == null)
                    {
                        pedido = new Pedido
                        {
                            IdPedido = idActual,
                            NombreCliente = db.Lectorbd["NombreCliente"].ToString(),
                            ModalidadEntrega = db.Lectorbd["ModalidadEntrega"].ToString(),
                            Direccion = db.Lectorbd["Direccion"].ToString(),
                            FormaPago = db.Lectorbd["FormaPago"].ToString(),
                            Total = Convert.ToDecimal(db.Lectorbd["Total"]),
                            Estado = db.Lectorbd["EstadoPedido"].ToString(),
                            FechaCreacion = Convert.ToDateTime(db.Lectorbd["FechaPedido"]),
                            Items = new List<DetallePedido>()
                        };

                        pedidos.Add(pedido);
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

                return pedidos;
            }
            finally
            {
                db.cerrarConexion();
            }
        }

        public List<Pedido> ObtenerPedidosUsuario(int idUser)
        {

            List<Pedido> pedidos = new List<Pedido>();
            AccesoBD db = new AccesoBD();

            try
            {
                db.setearProcedimiento("sp_ObtenerPedidosUsuario");
                db.setearParametro("@clienteId", idUser);
                db.ejecutarLectura();

                while (db.Lectorbd.Read())
                {
                    int idActual = Convert.ToInt32(db.Lectorbd["PedidoId"]);
                    Pedido pedido = pedidos.Find(p => p.IdPedido == idActual);

                    if (pedido == null)
                    {
                        pedido = new Pedido
                        {
                            IdPedido = idActual,
                            NombreCliente = db.Lectorbd["NombreCliente"].ToString(),
                            ModalidadEntrega = db.Lectorbd["ModalidadEntrega"].ToString(),
                            Direccion = db.Lectorbd["Direccion"].ToString(),
                            FormaPago = db.Lectorbd["FormaPago"].ToString(),
                            Total = Convert.ToDecimal(db.Lectorbd["Total"]),
                            Estado = db.Lectorbd["EstadoPedido"].ToString(),
                            FechaCreacion = Convert.ToDateTime(db.Lectorbd["FechaPedido"]),
                            Items = new List<DetallePedido>()
                        };

                        pedidos.Add(pedido);
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

                return pedidos;
            }
            finally
            {
                db.cerrarConexion();
            }
        }

        public void ConfirmarPedido(int idPedido)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_ConfirmarPedido");
                datos.setearParametro("@id", idPedido);
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

        public void CancelarPedido(int idPedido)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_CancelarPedido");
                datos.setearParametro("@id", idPedido);
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

        public void ConfirmarEnvio(int idPedido)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_ConfirmarEnvio");
                datos.setearParametro("@id", idPedido);
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

        public void ConfirmarEntrega(int idPedido)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_ConfirmarEntrega");
                datos.setearParametro("@id", idPedido);
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


        public void DevolverStock(int idPedido)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_DevolverStockPorPedido");
                datos.setearParametro("@idPedido", idPedido);
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

        public void DescontarStock(int idPedido)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_DescontarStockPorPedido");
                datos.setearParametro("@idPedido", idPedido);
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

    }
}
