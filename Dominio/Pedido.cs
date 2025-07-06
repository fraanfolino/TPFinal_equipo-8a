using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pedido
    {
        public int IdPedido { get; set; }            
      
        public int IdUsuario { get; set; }

        public string NombreCliente { get; set; }

        public string ModalidadEntrega { get; set; }

        public string Direccion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string FormaPago { get; set; }
        public decimal Total { get; set; }
        public string Estado { get; set; }
        public List<DetallePedido> Items { get; set; } = new List<DetallePedido>();
    }
}
