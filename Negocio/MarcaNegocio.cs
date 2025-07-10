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
    public class MarcaNegocio
    {
        public List<Marca> ListarMarcas()
        {
            AccesoBD datos = new AccesoBD();
            List<Marca> marcas = new List<Marca>();
            try
            {
                datos.setearProcedimiento("dbo.sp_ListarMarcas");
                datos.ejecutarLectura();

                while (datos.Lectorbd.Read())
                {
                    Marca marca = new Marca();
                    marca.Id = Convert.ToInt32(datos.Lectorbd["id"]);
                    marca.Nombre = datos.Lectorbd["nombre"].ToString();
                    marca.Activo = Convert.ToBoolean(datos.Lectorbd["activo"]);
                    marcas.Add(marca);
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

            return marcas;
        }

        public void InsertarMarca(string nombreMarca)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("dbo.sp_InsertarMarca");
                datos.setearParametro("@nombre", nombreMarca);
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

        public Marca ObtenerMarca(int id)
        {
            AccesoBD datos = new AccesoBD();
            Marca marca = null;

            try
            {
                datos.setearProcedimiento("sp_ObtenerMarcaPorId");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                if (datos.Lectorbd.Read())
                {
                    marca = new Marca();
                    marca.Id = Convert.ToInt32(datos.Lectorbd["id"]);
                    marca.Nombre = datos.Lectorbd["nombre"].ToString();
                    marca.Activo = Convert.ToBoolean(datos.Lectorbd["activo"]);
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

            return marca;
        }

        public void ModificarMarca(string id, string nombrenuevo)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("sp_ModificarMarca");
                datos.setearParametro("@id", id);
                datos.setearParametro("@nombrenuevo", nombrenuevo);
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

        public void BajaMarca(int id)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("sp_BajaMarca");
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

        public void AltaMarca(int id)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("sp_AltaMarca");
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

        public List<Marca> listarMarcas2()
        {
            AccesoBD datos = new AccesoBD();
            List<Marca> lista = new List<Marca>();

            try
            {
                datos.setearProcedimiento("sp_ListarMarcas");
                datos.ejecutarLectura();

                while (datos.Lectorbd.Read())
                {
                    if (!Convert.ToBoolean(datos.Lectorbd["activo"]))
                    { continue; }

                    Marca marca = new Marca();
                    marca.Id = Convert.ToInt32(datos.Lectorbd["id"]);
                    marca.Nombre = datos.Lectorbd["nombre"].ToString();
                    lista.Add(marca);
                }
            }
            catch (Exception ex) { throw ex; }
            finally { datos.cerrarConexion(); }

            return lista;
        }
















    }
}
