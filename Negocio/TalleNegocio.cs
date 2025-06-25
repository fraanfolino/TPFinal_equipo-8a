using Dominio;
using System;
using System.Collections.Generic;
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

    }
}
