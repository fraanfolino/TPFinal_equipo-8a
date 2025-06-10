using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Dominio; // Asegúrate de incluir el namespace donde están definidas Producto e ItemCarrito

namespace Negocio
{
    public class CarritoNegocio
    {
        
        public void AgregarOActualizarProductoEnCarrito(int idProducto, int idUsuario)
        {
            AccesoBD acceso = new AccesoBD();
            try
            {
                acceso.limpiarParametros();
                acceso.setearProcedimiento("sp_AgregarOActualizarCarrito");
                acceso.setearParametro("@usuarioId", idUsuario);
                acceso.setearParametro("@productoId", idProducto);
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

    
        
    }
}