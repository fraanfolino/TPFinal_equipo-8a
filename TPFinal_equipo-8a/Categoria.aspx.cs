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
    public partial class Categoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.SesionAdmin(Session["usuario"]))
            {
                Response.Redirect("Catalogo.aspx", false);
            }

            if (!IsPostBack)
            {
                CargarTipodeTalles();
                ChequearModificar();
            }
        }

        private void ChequearModificar()
        {
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int index) && Precargar(index))
            {
                Subtitulo.Text = "Modificar Categoria";
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

        private bool Precargar(int idCategoria)
        {
            CategoriaNegocio catNegocio = new CategoriaNegocio();
            try
            {
                Dominio.Categoria categoria = catNegocio.ObtenerCategoria(idCategoria);

                if (categoria == null)
                {
                    return false;
                }

                //ojo esto edita el dropdown lpm
                //ddlTipoTalle.SelectedItem.Text = categoria.TipoTalle;

                //ASII - aca lo busco y lo seleccion
                ListItem item = ddlTipoTalle.Items.FindByText(categoria.TipoTalle);
                if (item != null)
                {
                    item.Selected = true;
                }

                txtNombreCategoria.Text = categoria.Nombre.ToString();

                if (categoria.Activo)
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

        private void CargarTipodeTalles()
        {
            TalleNegocio talleNegocio = new TalleNegocio();
            ddlTipoTalle.DataTextField = "Tipo de talle";    
            ddlTipoTalle.DataValueField = "id";       
            ddlTipoTalle.DataSource = talleNegocio.ListarTallesTabla();
            ddlTipoTalle.DataBind();
        }

        private void InsertarCategoria()
        {
            if (String.IsNullOrEmpty(txtNombreCategoria.Text))
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "El nombre no puede estar vacío";
                return;
            }

            try
            {
                CategoriaNegocio negocio = new CategoriaNegocio();
                if (ddlTipoTalle.SelectedValue == "")
                {
                    alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                    alertDiv.InnerHtml = "Debe seleccionar un tipo de talle";
                    return;
                }

                negocio.InsertarCategoria(int.Parse(ddlTipoTalle.SelectedValue), txtNombreCategoria.Text);
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Categoria Agregada correctamente";
            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            InsertarCategoria();
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            ModificarCategoria();
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            ModificarCategoria(true);
        }

        private void ModificarCategoria(bool confirmar = false)
        {
            CategoriaNegocio catNegocio = new CategoriaNegocio();

            if (int.TryParse(Request.QueryString["id"], out int index))
            {
                Dominio.Categoria categoria = catNegocio.ObtenerCategoria(index);

                if (txtNombreCategoria.Text == categoria.Nombre && ddlTipoTalle.SelectedItem.Text == categoria.TipoTalle)
                {
                    alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                    alertDiv.InnerHtml = "No hubo Modificaciones";
                    return;
                }

                if (ddlTipoTalle.SelectedItem.Text != categoria.TipoTalle && !confirmar)
                {
                     alertDiv.Attributes["class"] = "alert alert-warning w-100 py-1 px-2";
                     alertDiv.InnerHtml = "Al modificar el tipo de talle se eliminará TODO el Stock actual.&nbsp;Esta seguro que desea continuar?";
                      btnConfirmar.Visible = true;
                     return;
                }
            }

            if (String.IsNullOrEmpty(txtNombreCategoria.Text))
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "El nombre no puede estar vacío";
                return;
            }

            try
            {
                catNegocio.ModificarCategoria(Request.QueryString["id"], txtNombreCategoria.Text,int.Parse(ddlTipoTalle.SelectedValue));
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";

                if (confirmar)
                {
                    alertDiv.InnerHtml = "Categoria Modificada. &nbsp;El Stock ha sido reiniciado.";
                    btnConfirmar.Visible = false;
                }
                else
                {
                    alertDiv.InnerHtml = "Categoria Modificada correctamente.";
                }

            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }
        }

        protected void btnActivar_Click(object sender, EventArgs e)
        {
            AltaCategoria();
        }
  
        private void AltaCategoria()
        {
            CategoriaNegocio catNegocio = new CategoriaNegocio();

            try
            {
                CategoriaNegocio negocio = new CategoriaNegocio();
                negocio.AltaCategoria(int.Parse(Request.QueryString["id"]));
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Categoria Activada correctamente";
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
            BajaCategoria();
        }
        private void BajaCategoria()
        {
            CategoriaNegocio catNegocio = new CategoriaNegocio();

            try
            {
                CategoriaNegocio negocio = new CategoriaNegocio();
                negocio.BajaCategoria(int.Parse(Request.QueryString["id"]));
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