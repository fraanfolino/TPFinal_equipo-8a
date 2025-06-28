using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class TipoTalle
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public List<string> Etiqueta { get; set; }
    }
}
