using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace TPFinal_equipo_8a
{
    public partial class Catalogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Producto> productos = new List<Producto>
        {
            new Producto { Nombre = "NEWELS LOCURA", Precio = 800, ImagenUrl = "https://acdn-us.mitiendanube.com/stores/002/872/034/products/e1d87ca91-97468f782db022a61116777916343707-1024-1024.jpg" },
            new Producto { Nombre = "NEWELS ROSARIO", Precio = 500, ImagenUrl = "https://acdn-us.mitiendanube.com/stores/002/872/034/products/e1d87ca91-97468f782db022a61116777916343707-1024-1024.jpg" },
            new Producto { Nombre = "CHICHO SIESTA", Precio = 150, ImagenUrl = "https://indumentarialegolf.com/wp-content/uploads/2024/10/IMG_20241003_105825.jpg" },
            new Producto { Nombre = "RIQUELME MATE", Precio = 300, ImagenUrl = "https://indumentarialegolf.com/wp-content/uploads/2024/10/IMG_20241003_105825.jpg" }
        };

                rptProductos.DataSource = productos;
                rptProductos.DataBind();
            }
        }
    }
}