using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Transaccion
    {
        public int Id { get; set; }
        public List<Producto> Productos { get; set; }
        public DateTime FechaPedido { get; set; }
        public decimal Total { get; set; }
    }
}
