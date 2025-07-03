using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class Talle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.SesionAdmin(Session["usuario"]))
            {
                Response.Redirect("Catalogo.aspx", false);
            }

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

                if (talle.Id == -1)
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
            btnConfirmar.Visible = false;
            alertDiv.Attributes["class"] = "alert alert-secondary w-100 py-1 px-2";
            alertDiv.InnerHtml = "";

            foreach (string tipoTalle in ListaTalles)
            {
                if (txtNuevoTalle.Text.ToLower() == tipoTalle.ToLower())
                {
                    return;
                }
            }

            if (!string.IsNullOrWhiteSpace(txtNuevoTalle.Text))
            {
                ListaTalles.Add(txtNuevoTalle.Text);
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
                    btnConfirmar.Visible = false;
                    alertDiv.Attributes["class"] = "alert alert-secondary w-100 py-1 px-2";
                    alertDiv.InnerHtml = "";
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

            if(ListaTalles.Count == 0)
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "Debe cargar al menos un tipo";
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
            ModificarTipoTalle(false);
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            ModificarTipoTalle(true);
        }

        private void ModificarTipoTalle(bool confirmar)
        {
            Dominio.TipoTalle talle = new TipoTalle();

            int IdTalle;

            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int index))
            {
                IdTalle = index;
                TalleNegocio talleNegocio = new TalleNegocio();
                talle = new TipoTalle();
                talle = talleNegocio.ObtenerTipo(index);
            }
            else
            {
                return;
            }

            if (String.IsNullOrEmpty(txtNombreTalle.Text))
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "El nombre no puede estar vacío";
                return;
            }

            if (ListaTalles.Count == 0)
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "Debes cargar al menos una etiqueta";
                return;
            }

            bool etiquetas = CompararListas(ListaTalles, talle.Etiqueta);

            if (txtNombreTalle.Text == talle.Nombre && etiquetas)
            {
                alertDiv.Attributes["class"] = "alert alert-primary w-100 py-1 px-2";
                alertDiv.InnerHtml = "No hubo modificaciones";
                return;
            }


            if (!etiquetas && !confirmar)
            {
                string borradas = EncontrarBorradas(talle.Etiqueta, ListaTalles);

                if (borradas != "")
                {
                    alertDiv.Attributes["class"] = "alert alert-warning w-100 py-1 px-2";
                    alertDiv.InnerHtml = "Se eliminará TODO el stock de los talles:<br />" + borradas + "Esta seguro que desea continuar?";
                    btnConfirmar.Visible = true;
                    return;
                }
            }

            try
            {
                TalleNegocio negocio = new TalleNegocio();
                negocio.ModificarTipoDeTalle(txtNombreTalle.Text, ListaTalles, IdTalle);
                alertDiv.Attributes["class"] = "alert alert-success w-100 py-1 px-2";
                alertDiv.InnerHtml = "Tipo de talle modificado correctamente";
            }
            catch (SqlException ex)
            {
                alertDiv.Attributes["class"] = "alert alert-danger w-100 py-1 px-2";
                alertDiv.InnerHtml = ex.Message.ToString();
            }
            btnConfirmar.Visible = false;
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

            if (lista1.Count != lista2.Count)
            {
                return false;
            }

            int count = 0;

            foreach (string str in lista1)
            {
                foreach (string str2 in lista2)
                {
                    if (str == str2)
                    {
                        count++;
                        continue; 
                    }
                }
            }

            if (count == lista1.Count)
            {
                return true;
            }

            return false;
        }

        public string EncontrarBorradas(List<string> listaOriginal, List<string> ListaNueva)
        {
            string etiquetasBorradas = "";

            foreach (string str in listaOriginal)
            {
                bool existe = false;

                foreach (string str2 in ListaNueva)
                {
                    if (str == str2)
                    {
                        existe = true;
                        break;
                    }
                }

                if (!existe) 
                {
                    etiquetasBorradas += "Talle " + str + "<br />";
                }

            }

            return etiquetasBorradas;
        }
    }
}