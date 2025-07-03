using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;
            try
            {
                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

                if (usuarioNegocio.ChequearEmailUsuario(txtRegistroEmail.Text))
                {
                    alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                    alertDiv.InnerHtml = "El email ya se encuentra registrado";
                    return;
                }

                Usuario nuevoUsuario = new Usuario();

                nuevoUsuario.Email = txtRegistroEmail.Text;
                nuevoUsuario.Nombre = txtNombre.Text;
                nuevoUsuario.Pass = txtPassword.Text;
                nuevoUsuario.Id = usuarioNegocio.insertarUsuario(nuevoUsuario);

                if (usuarioNegocio.Login(nuevoUsuario))
                {
                    Session.Add("usuario", nuevoUsuario);
                    Response.Redirect("Perfil.aspx", false);
                }
                else
                {
                    alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                    alertDiv.InnerHtml = "Datos inválidos";
                }

                Response.Redirect("Perfil.aspx", false);
            }
            catch (Exception ex)
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "Ocurrio un error: " + ex;
            }
        }
    }
}