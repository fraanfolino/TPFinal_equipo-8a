using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class Perfil : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.sesionActiva(Session["usuario"]))
            {
                Response.Redirect("Catalogo.aspx", false);
            }

            if (!IsPostBack)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                txtEmail.Text = usuario.Email;
                txtNombre.Text = usuario.Nombre;
                txtApellido.Text = usuario.Apellido;
                txtUrlImagenPerfil.Text = usuario.ImagenPerfil;
                imgNuevoPerfil.Src = usuario.ImagenPerfil;
                txtFechaNacimiento.Text = usuario.FechaNacimiento.ToString("yyyy-MM-dd");
            }
        }



        protected void Cambiarclavebtn_Click(object sender, EventArgs e)
        {
            panelCambioClave.Visible = !panelCambioClave.Visible;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            alertDiv.Attributes["class"] = "alert alert-secondary w-100 py-1 px-2";
            alertDiv.InnerHtml = "";

            Page.Validate();
            if (!Page.IsValid)
                return;

            if(ChequearCambios())
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "No hubo Modificaciones";
                return;
            }

            try
            {
                Usuario usuario = new Usuario();
                usuario.Email = txtEmail.Text;
                usuario.Nombre = txtNombre.Text;
                usuario.Apellido = txtApellido.Text;
                usuario.ImagenPerfil = txtUrlImagenPerfil.Text;
                usuario.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
                usuario.Pass = ((Usuario)Session["usuario"]).Pass;

                UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
                usuarioNegocio.ActualizarDatos(usuario);

                if (panelCambioClave.Visible)
                {
                    usuarioNegocio.CambiarClave(usuario.Id, txtNuevaClave.Text);
                    usuario.Pass = txtNuevaClave.Text;
                }

                usuarioNegocio.Login(usuario);
                Session.Add("usuario", usuario);

                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Usuario Modificado correctamente";
            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }
        }

        protected void txtUrlImagenPerfil_TextChanged(object sender, EventArgs e)
        {
            imgNuevoPerfil.Src = txtUrlImagenPerfil.Text;
        }

        private bool ChequearCambios()
        {
            Usuario user = (Usuario)Session["usuario"];

            if (txtEmail.Text == user.Email &&
                txtNombre.Text == user.Nombre &&
                txtApellido.Text == user.Apellido &&
                txtFechaNacimiento.Text == user.FechaNacimiento.ToString("yyyy-MM-dd") &&
                txtUrlImagenPerfil.Text == user.ImagenPerfil)
            {
                if (panelCambioClave.Visible)
                {
                    if (txtNuevaClave.Text == user.Pass)
                    {
                        return true;
                    }
                    return false;
                }
                return true;
            }
            return false;
        }


        protected void controlclave_ServerValidate(object sender, ServerValidateEventArgs e)
        {

            if (e.Value == txtNuevaClave.Text)
                e.IsValid = true;
            else
                e.IsValid = false;
        }

        protected void controlclaveactual_ServerValidate(object sender, ServerValidateEventArgs e)
        {
            Usuario user = (Usuario)Session["usuario"];
            if (txtClaveActual.Text == user.Pass)
                e.IsValid = true;
            else
                e.IsValid = false;
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            DateTime testDate = DateTime.MinValue;
            DateTime minDateTime = DateTime.MaxValue;
            DateTime maxDateTime = DateTime.MinValue;

            minDateTime = new DateTime(1753, 1, 1);
            maxDateTime = new DateTime(9999, 12, 31, 23, 59, 59, 997);

            if (DateTime.TryParse(args.Value, out testDate))
            {
                if (testDate >= minDateTime && testDate <= maxDateTime)
                {
                    args.IsValid = true;
                }
                else { args.IsValid = false; }
            }
        }
    }
}