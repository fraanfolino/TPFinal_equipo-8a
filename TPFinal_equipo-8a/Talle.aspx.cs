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
    public partial class Talle : System.Web.UI.Page
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
                Subtitulo.Text = "Modificar Talle";
                btnAgregar.Visible = false;
                btnModificar.Visible = true;
                CargarGrid();
            }
            else
            {
                btnModificar.Visible = false;
                btnAgregar.Visible = true;
                btnDesactivar.Visible = false;
                btnActivar.Visible = false;
            }
        }



        private bool Precargar(int idTalle)
        {
            TalleNegocio talleNegocio = new TalleNegocio();
            try
            {
                Dominio.TipoTalle talle = talleNegocio.ObtenerTipo(idTalle);

                if (talle == null)
                {
                    return false;
                }

                txtNombreTalle.Text = talle.Nombre.ToString();

                btnActivar.Visible = false;
                btnDesactivar.Visible = false;

                //if (categoria.Activo)
                //{
                //    btnActivar.Visible = false;
                //    btnDesactivar.Visible = true;
                //}
                //else
                //{
                //    btnActivar.Visible = true;
                //    btnDesactivar.Visible = false;
                //}

                foreach (var tipo in talle.Etiqueta)
                {
                    ListaTalles.Add(tipo);
                }

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }










        private List<string> ListaTalles
        {
            get
            {
                if (ViewState["ListaTalles"] == null)
                    ViewState["ListaTalles"] = new List<string>();
                return (List<string>)ViewState["ListaTalles"];
            }
            set
            {
                ViewState["ListaTalles"] = value;
            }
        }

        private void CargarGrid()
        {
            GridTalles.DataSource = ListaTalles;
            GridTalles.DataBind();
        }


        protected void btnAgregarTalle_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtNuevoTalle.Text))
            {
                ListaTalles.Add(txtNuevoTalle.Text.Trim());
                CargarGrid();
                txtNuevoTalle.Text = "";
            }
        }

        protected void GridTalles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Eliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                if (index >= 0 && index < ListaTalles.Count)
                {
                    ListaTalles.RemoveAt(index);
                    CargarGrid();
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            AgregarTipoTalle();
        }

        private void AgregarTipoTalle()
        {
            if (String.IsNullOrEmpty(txtNombreTalle.Text))
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "El nombre no puede estar vacío";
                return;
            }

            try
            {
                TalleNegocio negocio = new TalleNegocio();
                negocio.InsertarTipoDeTalle(txtNombreTalle.Text,ListaTalles);
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Tipo de talle agregado correctamente";
            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }
        }











        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnDesactivar_Click(object sender, EventArgs e)
        {

        }

        protected void btnActivar_Click(object sender, EventArgs e)
        {

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionarMC.aspx", false);
        }

        public static bool CompararListas(List<string> lista1, List<string> lista2)
        {
            if (lista1 == null || lista2 == null)
                return false;

            return lista1.SequenceEqual(lista2);
        }

    }
}