﻿using System;

using System.Linq;
using System.Web.UI;
using Negocio;
using Dominio; 

namespace TPFinal_equipo_8a
{
    public partial class DetalleProducto : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idProducto;
                if (int.TryParse(Request.QueryString["Id"], out idProducto))
                {
                    CargarDetalle(idProducto);
                }
                else
                {
                    
                    Response.Redirect("Catalogo.aspx");
                }
            }
        }

        private void CargarDetalle(int id)
        {
            ProductoNegocio productoNegocio = new ProductoNegocio();
            Producto producto = productoNegocio.ObtenerProducto(id);

            if (producto != null)
            {
                lblNombre.Text = producto.Nombre;
                lblDescripcion.Text = producto.Descripcion;
                lblPrecio.Text = producto.Precio.ToString("F2");

               
                rptImagenes.DataSource = producto.ImagenUrl.Select(url => new { Url = url }).ToList();
                rptImagenes.DataBind();
            }
            else
            {
                
                Response.Redirect("Catalogo.aspx");
            }
        }
    }
}
