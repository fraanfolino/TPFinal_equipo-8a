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
                btnEliminar.Visible = true;
            }
            else
            {
                btnModificar.Visible = false;
                btnAgregar.Visible = true;
                btnEliminar.Visible = false;
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
                //est tmp sirve
                //ddlTipoTalle.SelectedValue = categoria.TipoTalle;

                //ASII - aca lo busco y lo seleccion
                ListItem item = ddlTipoTalle.Items.FindByText(categoria.TipoTalle);
                if (item != null)
                {
                    item.Selected = true;
                }

                txtNombreCategoria.Text = categoria.Nombre.ToString();

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
                alertDiv.InnerHtml = "La categoria no puede estar vacía";
                return;
            }

            try
            {
                CategoriaNegocio negocio = new CategoriaNegocio();
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


        private void ModificarCategoria()
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
            }

            if (String.IsNullOrEmpty(txtNombreCategoria.Text))
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "La categoria no puede estar vacía";
                return;
            }

            try
            {
                CategoriaNegocio negocio = new CategoriaNegocio();
                negocio.ModificarCategoria(Request.QueryString["id"], txtNombreCategoria.Text,int.Parse(ddlTipoTalle.SelectedValue));
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Categoria Modificada correctamente";
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