using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class ItemCarrito
    {
        public int IdItemCarro { get; set; }

        public int IdCarrito { get; set; }
        public Producto Producto { get; set; }
        public int Cantidad { get; set; }

        public decimal Precio()
            => Producto.Precio * Cantidad;


    }
}
