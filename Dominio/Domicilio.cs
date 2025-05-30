using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Domicilio
    {
        public int Id { get; set; }

        public string Provincia { get; set; }

        public string Ciudad { get; set; }

        public string Calle { get; set; }

        public int Numero { get; set; }

        public int Piso { get; set; }

        public string Departamento { get; set; }

    }
}
