using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> ListarCategorias()
        {
            AccesoBD datos = new AccesoBD();
            List <Categoria> categorias = new List<Categoria>();
            try
            {
                datos.setearProcedimiento("dbo.sp_ListarCategorias");
                datos.ejecutarLectura();

                while (datos.Lectorbd.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.Id = Convert.ToInt32(datos.Lectorbd["id"]);
                    categoria.Nombre = datos.Lectorbd["nombre"].ToString();
                    categoria.TipoTalle = datos.Lectorbd["tipotalle"].ToString();
                    categoria.Activo = Convert.ToBoolean(datos.Lectorbd["activo"]);
                    categorias.Add(categoria);
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

            return categorias;
        }

        public void InsertarCategoria(int id, string nombreCategoria)
        {
            AccesoBD datos = new AccesoBD();
           
            try
            {
                datos.setearProcedimiento("dbo.sp_InsertarCategoria");
                datos.setearParametro("@tipo_talle_id", id);
                datos.setearParametro("@nombre", nombreCategoria);
                datos.ejecutarLectura();
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

        public Categoria ObtenerCategoria(int id)
        {
            AccesoBD datos = new AccesoBD();
            Categoria categoria = null;
            
            try
            {
                datos.setearProcedimiento("sp_ObtenerCategoriaPorId");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                if (datos.Lectorbd.Read())
                {
                    categoria = new Categoria();
                    categoria.Id = Convert.ToInt32(datos.Lectorbd["id"]);
                    categoria.Nombre = datos.Lectorbd["nombre"].ToString();
                    categoria.TipoTalle = datos.Lectorbd["tipotalle"].ToString();
                    categoria.Activo = Convert.ToBoolean(datos.Lectorbd["activo"]);
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

            return categoria;
        }


        public void ModificarCategoria(string id, string nombrenuevo, int idTalles)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("sp_ModificarCategoria");
                datos.setearParametro("@id", id);
                datos.setearParametro("@nombrenuevo", nombrenuevo);
                datos.setearParametro("@tipo_talle_id", idTalles);
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

        public void BajaCategoria(int id)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("sp_BajaCategoria");
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

        public void AltaCategoria(int id)
        {
            AccesoBD datos = new AccesoBD();

            try
            {
                datos.setearProcedimiento("sp_AltaCategoria");
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
    }
}
