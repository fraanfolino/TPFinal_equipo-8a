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
    public partial class Marca : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                ChequearModificar();
            }
        }



        private void ChequearModificar()
        {
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int index) && Precargar(index))
            {
                Subtitulo.Text = "Modificar Marca";
                btnAgregar.Visible = false;
                btnModificar.Visible = true;
            }
            else
            {
                btnModificar.Visible = false;
                btnAgregar.Visible = true;
                btnDesactivar.Visible = false;
                btnActivar.Visible = false;
            }
        }

        private bool Precargar(int idMarca)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            try
            {
                Dominio.Marca marca = marcaNegocio.ObtenerMarca(idMarca);

                if (marca == null)
                {
                    return false;
                }

                txtNombreMarca.Text = marca.Nombre;

                if (marca.Activo)
                {
                    btnActivar.Visible = false;
                    btnDesactivar.Visible = true;
                }
                else
                {
                    btnActivar.Visible = true;
                    btnDesactivar.Visible = false;
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            InsertarMarca();
        }

        private void InsertarMarca()
        {
            if (String.IsNullOrEmpty(txtNombreMarca.Text))
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "El nombre no puede estar vacío";
                return;
            }

            try
            {
                MarcaNegocio negocio = new MarcaNegocio();
                negocio.InsertarMarca(txtNombreMarca.Text);
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Marca Agregada correctamente";
            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            ModificarMarca();
        }

        private void ModificarMarca()
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();

            if (int.TryParse(Request.QueryString["id"], out int index))
            {
                Dominio.Marca marca = marcaNegocio.ObtenerMarca(index);

                if (txtNombreMarca.Text == marca.Nombre)
                {
                    alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                    alertDiv.InnerHtml = "No hubo Modificaciones";
                    return;
                }
            }

            if (String.IsNullOrEmpty(txtNombreMarca.Text))
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "El nombre no puede estar vacío";
                return;
            }

            try
            {
                marcaNegocio.ModificarMarca(Request.QueryString["id"], txtNombreMarca.Text);
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Marca Modificada correctamente.";
            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }

        }
        protected void btnActivar_Click(object sender, EventArgs e)
        {
            AltaMarca();
        }

        private void AltaMarca()
        {
            try
            {
                MarcaNegocio negocio = new MarcaNegocio();
                negocio.AltaMarca(int.Parse(Request.QueryString["id"]));
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Marca Activada correctamente";
                btnActivar.Visible = false;
                btnDesactivar.Visible = true;

            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }
        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {
            BajaMarca();
        }

        private void BajaMarca()
        {
            try
            {
                MarcaNegocio negocio = new MarcaNegocio();
                negocio.BajaMarca(int.Parse(Request.QueryString["id"]));
                alertDiv.Attributes["class"] = "alert alert-warning w-100 py-1 px-2";
                alertDiv.InnerHtml = "Categoria desactivada correctamente";
                btnActivar.Visible = true;
                btnDesactivar.Visible = false;
            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }
        }


        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionarMC.aspx", false);
        }
    }
}