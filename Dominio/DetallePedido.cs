using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class DetallePedido
    {
        public int IdItemPedido { get; set; }
        public int IdPedido { get; set; }     
        public string NombreProducto { get; set; }
        public string TalleEtiqueta { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        
    }
}
