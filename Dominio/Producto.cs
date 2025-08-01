﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Producto
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int Stock { get; set; }
        public List<string> ImagenUrl { get; set; }

        public Marca Marca { get; set; }
        public Categoria Categoria { get; set; }

        public Talle Talle { get; set; }

        public bool Activo { get; set; }

    }
}
