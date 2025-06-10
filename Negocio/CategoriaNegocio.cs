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
    }
}
