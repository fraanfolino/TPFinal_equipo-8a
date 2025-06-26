using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPFinal_equipo_8a
{
    public partial class GestionarMC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                CargarCategorias();
                CargarMarcas();
                CargarTipodeTalles();
            }
        
        }

        private void CargarCategorias()
        {
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();
            dgvTablaCategorias.DataSource = categoriaNegocio.ListarCategorias();
            dgvTablaCategorias.DataBind();
        }

        private void CargarMarcas()
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            dgvTablaMarcas.DataSource = marcaNegocio.ListarMarcas();
            dgvTablaMarcas.DataBind();
        }

        private void CargarTipodeTalles()
        {
            TalleNegocio talleNegocio = new TalleNegocio();
            dgvTablaTalles.DataSource = talleNegocio.ListarTallesTabla();
            dgvTablaTalles.DataBind();
        }


        protected void dgvTablaCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idSeleccionado = Convert.ToInt32(dgvTablaCategorias.SelectedDataKey.Value);

        }

        protected void dgvTablaMarcas_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}