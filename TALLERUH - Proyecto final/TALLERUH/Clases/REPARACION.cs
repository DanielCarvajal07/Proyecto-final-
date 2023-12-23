using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace TALLERUH.Clases
{
    public class REPARACION
    {
        public int ReparacionID { get; set; }
        public int EquipoID { get; set; }
        public string Estado { get; set; }
        public DateTime FechaSolicitud { get; set; }

        public REPARACION(int reparacionID, int equipoID, string estado, DateTime fechaSolicitud)
        {

            ReparacionID = reparacionID;
            EquipoID = equipoID;
            Estado = estado;
            FechaSolicitud = fechaSolicitud;

        }

        public REPARACION() { }

        public static int Agregar(int EquipoID, string Estado, DateTime FechaSolicitud)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AGREGAR_REPARACION", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@EquipoID", EquipoID));
                    cmd.Parameters.Add(new SqlParameter("@Estado", Estado));
                    cmd.Parameters.Add(new SqlParameter("@FechaSolicitud", FechaSolicitud));


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

        public static int modificar(int ReparacionID, int EquipoID, string Estado, DateTime FechaSolicitud)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ACTUALIZAR_REPARACION", Conn) // Buscar el nombre del metodo en archivo SQL
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    // Usa las mismas variables que le setearon al archivo SQL
                    cmd.Parameters.Add(new SqlParameter("@ReparacionID", ReparacionID));
                    cmd.Parameters.Add(new SqlParameter("@EquipoID", EquipoID));
                    cmd.Parameters.Add(new SqlParameter("@Estado", Estado));
                    cmd.Parameters.Add(new SqlParameter("@FechaSolicitud", FechaSolicitud));


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








    }
}