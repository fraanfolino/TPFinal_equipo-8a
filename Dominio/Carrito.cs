using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carrito
    {

        public int IdCarro { get; set; }

        public int IdUsuario { get; set; }

        public DateTime FechaCreacion { get; set; }
        public List<ItemCarrito> Items { get; set; } = new List<ItemCarrito>();

        public bool Activo { get; set; } = true;


        public decimal PrecioTotal()
            => Items.Sum(i => i.Precio());
    }
}
