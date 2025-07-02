using Dominio;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using Microsoft.Win32;

namespace TPFinal_equipo_8a
{
    public partial class SiteMaster : MasterPage
    {
        public bool banderaadmin = true;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Usuario user = (Usuario)Session["usuario"];
                if (!string.IsNullOrEmpty(user.ImagenPerfil))
                {
                    imgUser.ImageUrl = user.ImagenPerfil;
                }

                if (Seguridad.esAdmin(user))
                { banderaadmin = true; }
            }
            else
            {
                if (Page is Perfil)
                {
                    Response.Redirect("Catalogo.aspx", false);
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            imgAvatar.ImageUrl = "~/Images/user.png";
        }

        protected void btnAvatar_Click(object sender, EventArgs e)
        {

        }

        protected void btnPerfil_Click(object sender, EventArgs e)
        {

        }

        protected void btnIniciar_Click(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            usuario.Email = txtMail.Text;
            usuario.Pass = txtPass.Text;

            if (negocio.Login(usuario))
            {
                Session.Add("usuario", usuario);
                Response.Redirect("Catalogo.aspx", false);
            }
            else
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = "Datos inválidos" ;
            }

        }
    }
}