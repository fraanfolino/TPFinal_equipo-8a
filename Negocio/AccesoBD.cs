using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    internal class AccesoBD
    {
        private SqlConnection conexionbd;
        public SqlCommand comando;
        private SqlDataReader lector;

        public SqlDataReader Lectorbd
        {
            get { return lector; }
        }

        public AccesoBD()
        {
            //FRAN
            conexionbd = new SqlConnection("server=.\\SQLEXPRESS; database=ECOMMERCE_P3; integrated security=true");
            //NICO
            //conexionbd = new SqlConnection("server=127.0.0.1,1433; database=ECOMMERCE_P3; User ID=sa; Password=BaseDeDatos#2;");
            comando = new SqlCommand();
        }

        public void setearConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }

        public void ejecutarLectura()
        {
            comando.Connection = conexionbd;
            try
            {
                conexionbd.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void setearParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }


        public void setearProcedimiento(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }

        public void cerrarConexion()
        {
            if (lector != null)
                lector.Close();
            conexionbd.Close();
        }

        public void ejecutarAccion()
        {
            comando.Connection = conexionbd;
            try
            {
                conexionbd.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int ejecutarAccionconreturn()
        {
            comando.Connection = conexionbd;
            try
            {
                conexionbd.Open();
                return int.Parse(comando.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void limpiarParametros()
        {
            comando.Parameters.Clear();
        }

        //este es para seguir mandandp inserts o acciones sin cerrar la conexion
        public void ejecutarMasAcciones()
        {
            try
            {
                comando.Connection = conexionbd;
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

