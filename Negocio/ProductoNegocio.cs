using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ProductoNegocio
    {

        public List<Producto> ListarProductosEnStock()
        {
            AccesoBD datos = new AccesoBD();
            List<Producto> listaProductos = new List<Producto>();
            try
            
            {
                datos.setearProcedimiento("sp_ListarProductosConStock");
                datos.ejecutarLectura();

                Producto ultCarga = null;

                
                while (datos.Lectorbd.Read())
                {

                    int idArtBD = Convert.ToInt32(datos.Lectorbd["Id"]);

                    //para no cargar duplicado, si es el mismo solo agrego imagen
                    if (ultCarga != null && ultCarga.Id == idArtBD)
                    {
                        if (datos.Lectorbd["UrlImagen"] != null)
                        {
                            string imagenUrl = Convert.ToString(datos.Lectorbd["UrlImagen"]);
                            ultCarga.ImagenUrl.Add(imagenUrl);
                        }
                        continue;
                    }

                    Producto aux = new Producto();
                    aux.Id = (int)datos.Lectorbd["Id"];
                    aux.Nombre = (string)datos.Lectorbd["Nombre"];
                    aux.Descripcion = (string)datos.Lectorbd["Descripcion"];
                    aux.Precio = (decimal)datos.Lectorbd["Precio"];

                    if (datos.Lectorbd["UrlImagen"] != null)
                    {
                        aux.ImagenUrl = new List<string> { Convert.ToString(datos.Lectorbd["UrlImagen"]) };
                    }


                    listaProductos.Add(aux);

                    ultCarga = aux;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return listaProductos;

        }



    }
}
