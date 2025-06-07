using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class Perfil : System.Web.UI.Page
    {
        public bool cambiarclave = false;
        public bool banderaedicionadmin = false;
        public bool confirmareliminacionuser = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            usuario.Nombre = "nico";
            usuario.Apellido = "Calcagno";
            usuario.Email = "calcagno.nico@gmail.com";


            Session.Add("usuario", usuario);



            if (!IsPostBack)
            {
                Session.Add("cambiarclave", cambiarclave);

                if (Session["usuario"] == null)
                {
                    Response.Redirect("Catalogo.aspx");
                }
                else
                {
                    Usuario user = (Usuario)Session["usuario"];
                    txtNombre.Text = user.Nombre;
                    txtApellido.Text = user.Apellido;
                    txtEmail.Text = user.Email;
                    txtFechaNacimiento.Text = user.FechaNacimiento.ToString("yyyy-MM-dd");
                }
            }
        }


        protected void controlclaveactual_ServerValidate(object sender, ServerValidateEventArgs e)
        {
                Usuario user = (Usuario)Session["usuario"];
                if (ClaveActual.Text == user.Pass)
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

        protected void Cambiarclavebtn_Click(object sender, EventArgs e)
        {
            if (!(bool)Session["cambiarclave"])
            {
                Session.Add("cambiarclave", true);
                cambiarclave = (bool)Session["cambiarclave"];
            }
            else
            {
                Session.Add("cambiarclave", false);
                cambiarclave = (bool)Session["cambiarclave"];
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        { }
            //{
        //    try
        //    {
        //        //Esto tiene que estar si o si para que nos valide todos los campos antes de continuar
        //        Page.Validate();
        //        if (!Page.IsValid)
        //            return;

        //        UsuarioNegocio negocio = new UsuarioNegocio();
        //        Usuario user = (Usuario)Session["usuario"];
        //        Usuario useredit = new Usuario();

        //        string iduseredicionId = Request.QueryString["idusuarioedicion"] != null ? Request.QueryString["idusuarioedicion"].ToString() : "";
        //        //actualizarclave
        //        if (iduseredicionId != "" && Seguridad.esAdmin(user))
        //        {
        //            useredit = (Usuario)Session["useredicion"];
        //        }
        //        else
        //        {
        //            useredit = (Usuario)Session["usuario"];
        //        }


        //        //Escribir img si se cargó algo.
        //        if (FileUploadControl.PostedFile.FileName != "" & FileUploadControl.PostedFile.FileName != null)
        //        {
        //            string ruta = Server.MapPath("./Images/");
        //            FileUploadControl.PostedFile.SaveAs(ruta + "perfil-" + useredit.Id + ".jpg");
        //            //useredit.ImagenPerfil = "perfil-" + useredit.Id + ".jpg";

        //        }


        //        useredit.Nombre = txtNombre.Text;
        //        useredit.Apellido = txtApellido.Text;
        //        useredit.FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text);
        //        useredit.Email = txtEmail.Text;

        //        //guardar datos perfil
        //        negocio.actualizar(useredit);

        //        //actualizarclave
        //        if ((bool)Session["cambiarclave"] & NuevaClave.Text == NuevaClave2.Text)
        //        {
        //            negocio.actualizarclave(NuevaClave2.Text, useredit);
        //        }
        //        else
        //        {
        //        }

        //        limpiarsession();

        //        if (user.Id == useredit.Id)
        //        {
        //            Response.Redirect("Main.aspx", false);
        //        }
        //        else
        //        {
        //            Response.Redirect("Usuarios.aspx", false);
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        Session.Add("error", ex.ToString());
        //    }
        //}


    }
}