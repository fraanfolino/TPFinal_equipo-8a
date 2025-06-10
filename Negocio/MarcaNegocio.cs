using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    }
}
