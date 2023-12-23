using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;

namespace TALLERUH.Clases
{
    public class ASIGNACIONES
    {   //Constructores llamados igual que las variables de las tablas
        public int AsignacionID { get; set; }
        public int TecnicoID { get; set; }
        public int ReparacionID { get; set; }
        public DateTime FechaAsignacion { get; set; }

        public ASIGNACIONES(int tecnicoID, int reparacionID, DateTime fechaAsignacion)
        {

            TecnicoID = tecnicoID;
            ReparacionID = reparacionID;
            FechaAsignacion = fechaAsignacion;
        }

        public ASIGNACIONES() { }

        //Agregar metodos usados en las otras clases

        public static int Agregar(int ReparacionID, int TecnicoID, DateTime FechaAsignacion)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("AGREGARASIGNACION", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@ReparacionID", ReparacionID));
                    cmd.Parameters.Add(new SqlParameter("@TecnicoID", TecnicoID));
                    cmd.Parameters.Add(new SqlParameter("@FechaAsignacion", FechaAsignacion));


                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }
        public static int Borrar(int codigo)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BORRARASIGNACION", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@CODIGO", codigo));



                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;

        }

        public static int modificar(int AsignacionID, int ReparacionID, int TecnicoID, DateTime FechaAsignacion)
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBconn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ACTUALIZARASIGNACION", Conn) // Buscar el nombre del metodo en archivo SQL
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    // Usa las mismas variables que le setearon al archivo SQL
                    cmd.Parameters.Add(new SqlParameter("@CODIGO", AsignacionID));  
                    cmd.Parameters.Add(new SqlParameter("@ReparacionID", ReparacionID));
                    cmd.Parameters.Add(new SqlParameter("@TecnicoID", TecnicoID));
                    cmd.Parameters.Add(new SqlParameter("@FechaAsignacion", FechaAsignacion));


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