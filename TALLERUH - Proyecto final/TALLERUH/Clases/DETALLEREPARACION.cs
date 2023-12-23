using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace TALLERUH.Clases
{

    public class DETALLEREPARACION
    {
        public int DetalleID { get; set; }
        public int ReparacionID { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaIncio { get; set; }
        public DateTime FechaFin { get; set; }


        public DETALLEREPARACION(int detalleID, int reparacionID, DateTime fechaIncio, DateTime fechaFin)
        {

            DetalleID = detalleID;
            ReparacionID = reparacionID;
            FechaIncio = fechaIncio;
            FechaFin = fechaFin;

        }

        public DETALLEREPARACION() { }

        public static int Agregar(int ReparacionID, string Descripcion, DateTime FechaIncio, DateTime FechaFin)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AGREGAR_DETALLEREPARACION", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@ReparacionID", ReparacionID));
                    cmd.Parameters.Add(new SqlParameter("@Descripcion", Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@FechaIncio", FechaIncio));
                    cmd.Parameters.Add(new SqlParameter("@FechaFin", FechaFin));

                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

        public static int modificar(int DetalleID, int ReparacionID, string Descripcion, DateTime FechaIncio, DateTime FechaFin)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ACTUALIZAR_DETALLEREPARACION", Conn) // Buscar el nombre del metodo en archivo SQL
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    cmd.Parameters.Add(new SqlParameter("@DetalleID", DetalleID));
                    cmd.Parameters.Add(new SqlParameter("@ReparacionID", ReparacionID));
                    cmd.Parameters.Add(new SqlParameter("@Descripcion", Descripcion));
                    cmd.Parameters.Add(new SqlParameter("@FechaIncio", FechaIncio));
                    cmd.Parameters.Add(new SqlParameter("@FechaFin", FechaFin));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException )
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

    }
}



    

  
