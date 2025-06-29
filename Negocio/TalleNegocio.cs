using Dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class TalleNegocio
    {
        public List<Talle> ListarTalles(string nombreProducto)
        {
            AccesoBD datos = new AccesoBD();
            List<Talle> talles = new List<Talle>();
            try
            {
                datos.setearProcedimiento("dbo.sp_ListarTalles");
                datos.setearParametro("@producto_nombre", nombreProducto);
                datos.ejecutarLectura();

                while (datos.Lectorbd.Read())
                {
                    Talle talle = new Talle();
                    talle.Id = Convert.ToInt32(datos.Lectorbd["id"]);
                    talle.Etiqueta = datos.Lectorbd["etiqueta"].ToString();
                    talles.Add(talle);
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

            return talles;
        }

        public DataTable ListarTallesTabla()
        {
            AccesoBD datos = new AccesoBD();
            DataTable tabla = new DataTable();

            try
            {
                datos.setearProcedimiento("dbo.sp_ListarTallesPorTipo");
                datos.ejecutarLectura();
                tabla.Load(datos.Lectorbd);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return tabla;
        }

        public TipoTalle ObtenerTipo(int idTipo)
        {
            AccesoBD datos = new AccesoBD();
            TipoTalle tipoTalle = new TipoTalle();

            try
            {
                datos.setearProcedimiento("dbo.sp_ListarTipoTalle");
                datos.setearParametro("@idTipoTalle", idTipo);
                datos.ejecutarLectura();

                tipoTalle.Id = -1;
                tipoTalle.Etiqueta = new List<string>();
                bool primerVuelta = true;

                while (datos.Lectorbd.Read())
                {
                    if (primerVuelta)
                    {
                        tipoTalle.Nombre = datos.Lectorbd["Tipo de talle"].ToString();
                        tipoTalle.Id = idTipo;
                        primerVuelta = false;
                    }

                    tipoTalle.Etiqueta.Add(datos.Lectorbd["Etiqueta"].ToString());
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

            return tipoTalle;
        }

        public void InsertarTipoDeTalle(string nombreTalle, List<string> etiquetas)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("dbo.sp_InsertarTipoTalle");
                datos.setearParametro("@nombre", nombreTalle);
                int id = datos.ejecutarAccionconreturn();

                foreach (string etiqueta in etiquetas)
                {
                    datos.limpiarParametros();
                    datos.setearProcedimiento("dbo.sp_InsertarTalle");
                    datos.setearParametro("@etiqueta", etiqueta);
                    datos.setearParametro("@tipo_talle_id", id);
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

        public void ModificarTipoDeTalle(string nombreTalle, List<string> etiquetas, int idTalle)
        {
            string talles = string.Join(",", etiquetas);
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("dbo.sp_ModificarTipoTalle");
                datos.setearParametro("@nuevoNombre", nombreTalle);
                datos.setearParametro("@etiquetasCSV", talles);
                datos.setearParametro("@tipoTalleId", idTalle);
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
