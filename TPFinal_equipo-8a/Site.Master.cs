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
        //public bool sesion;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sesionActiva(Session["usuario"]))
            {
                Usuario user = (Usuario)Session["usuario"];
                if (!string.IsNullOrEmpty(user.ImagenPerfil) || File.Exists("~/Images/" + user.ImagenPerfil))
                {
                    imgAvatar.ImageUrl = "~/Images/" + user.ImagenPerfil;
                }
                else
                {
                    imgAvatar.ImageUrl = "~/Images/user.png";
                }
                if (Seguridad.esAdmin(user))
                { banderaadmin = true; }
            }
            else
            {
                

                if (Page is Perfil)
                {
                    Response.Redirect("Default.aspx", false);
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
                // ver dp el error de user
            }

        }
    }
}