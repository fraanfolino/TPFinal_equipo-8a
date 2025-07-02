using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class UsuarioNegocio
    {

        public bool Login2(Usuario user)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearConsulta("Select id, email, pass, es_admin, url_imagen_perfil, nombre, apellido, fecha_nacimiento from USERS Where email = @email And pass = @pass");
                datos.setearParametro("@email", user.Email);
                datos.setearParametro("@pass", user.Pass);
                datos.ejecutarLectura();
                if (datos.Lectorbd.Read())
                {
                    user.Id = (int)datos.Lectorbd["id"];
                    user.Admin = (bool)datos.Lectorbd["es_admin"];
                    if (!(datos.Lectorbd["url_imagen_perfil"] is DBNull))
                        user.ImagenPerfil = (string)datos.Lectorbd["url_imagen_perfil"];
                    if (!(datos.Lectorbd["nombre"] is DBNull))
                        user.Nombre = (string)datos.Lectorbd["nombre"];
                    if (!(datos.Lectorbd["apellido"] is DBNull))
                        user.Apellido = (string)datos.Lectorbd["apellido"];
                    if (!(datos.Lectorbd["fecha_nacimiento"] is DBNull))
                        user.FechaNacimiento = DateTime.Parse(datos.Lectorbd["fecha_nacimiento"].ToString());
                    return true;
                }
                return false;
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
        public bool Login(Usuario user)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_LoginUsuario");
                datos.setearParametro("@Email", user.Email);
                datos.setearParametro("@Pass", user.Pass);
                datos.ejecutarLectura();

                if (datos.Lectorbd.Read())
                {
                    user.Id = (int)datos.Lectorbd["id"];
                    user.Admin = (bool)datos.Lectorbd["es_admin"];

                    if (!(datos.Lectorbd["url_imagen_perfil"] is DBNull))
                        user.ImagenPerfil = (string)datos.Lectorbd["url_imagen_perfil"];

                    if (!(datos.Lectorbd["nombre"] is DBNull))
                        user.Nombre = (string)datos.Lectorbd["nombre"];

                    if (!(datos.Lectorbd["pass"] is DBNull))
                        user.Pass = (string)datos.Lectorbd["pass"];

                    if (!(datos.Lectorbd["apellido"] is DBNull))
                        user.Apellido = (string)datos.Lectorbd["apellido"];

                    if (!(datos.Lectorbd["fecha_nacimiento"] is DBNull))
                        user.FechaNacimiento = Convert.ToDateTime(datos.Lectorbd["fecha_nacimiento"]);

                    return true;
                }
                return false;
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




        public Usuario ObtenerUsuario(int id)
        {
            AccesoBD datos = new AccesoBD();
            Usuario user = new Usuario();
            try
            {
                datos.setearProcedimiento("sp_ObtenerUsuarioPorId");
                datos.setearParametro("@Id", id);
                datos.ejecutarLectura();

                if (datos.Lectorbd.Read())
                {
                    user.Id = (int)datos.Lectorbd["id"];
                    user.Email = (string)datos.Lectorbd["email"];

                    if (!(datos.Lectorbd["nombre"] is DBNull))
                        user.Nombre = (string)datos.Lectorbd["nombre"];
                    
                    if (!(datos.Lectorbd["apellido"] is DBNull))
                        user.Apellido = (string)datos.Lectorbd["apellido"];
                    
                    if (!(datos.Lectorbd["url_imagen_perfil"] is DBNull))
                        user.ImagenPerfil = (string)datos.Lectorbd["url_imagen_perfil"];

                    if (!(datos.Lectorbd["fecha_nacimiento"] is DBNull))
                        user.FechaNacimiento = Convert.ToDateTime(datos.Lectorbd["fecha_nacimiento"]);
                }

                return user;
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



        public void ActualizarDatos(Usuario user)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_ActualizarUsuario");
                datos.setearParametro("@Id", user.Id);
                datos.setearParametro("@email", user.Email);
                datos.setearParametro("@nombre", user.Nombre);
                datos.setearParametro("@apellido", user.Apellido);
                datos.setearParametro("@urlImagenPerfil", user.ImagenPerfil);
                datos.setearParametro("@fechanacimiento", user.FechaNacimiento);
                datos.ejecutarAccion();
            }
            catch
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void CambiarClave(int userId, string nuevaClave)
        {
            AccesoBD datos = new AccesoBD();
            try
            {
                datos.setearProcedimiento("sp_ActualizarClaveUsuario");
                datos.setearParametro("@Id", userId);
                datos.setearParametro("@pass", nuevaClave);
                datos.ejecutarAccion();
            }
            catch
            {
                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
