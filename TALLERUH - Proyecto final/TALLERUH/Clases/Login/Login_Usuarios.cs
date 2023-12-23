using System.Data.SqlClient;
using System.Data;
using System;

namespace TALLERUH.Clases.Login
{
    public class Login_Usuarios
    {
        private static int Id;
        private static string Contraseña;
        private static string Correo;
        private static string Nombre;

        public Login_Usuarios(int id, string contraseña, string correo, string nombre)
        {
            Id = id;
            Contraseña = contraseña;
            Correo = correo;
            Nombre = nombre;
        }

        public Login_Usuarios()
        {
        }



        // Getter y Setter de instancia
        public static string GetContraseña()
        {
            return Contraseña;
        }

        public static string GetCorreo()
        {
            return Correo;
        }

        public static string GetNombre()
        {
            return Nombre;
        }

        public void SetContraseña(string contra)
        {
            Contraseña = contra;
        }

        public void SetCorreo(string correo)
        {
            Correo = correo;
        }

        public static void SetNombre(string nombre)
        {
            Nombre = nombre;
        }

        public int ValidarLogin()
        {
            int retorno = 0;

            using (SqlConnection Conn = DBconn.obtenerConexion())
            {
                try
                {
                    using (SqlCommand cmd = new SqlCommand("ValidarUsuario", Conn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.Add(new SqlParameter("@Correo", Correo));
                        cmd.Parameters.Add(new SqlParameter("@Contraseña", Contraseña));

                        using (SqlDataReader lectura = cmd.ExecuteReader())
                        {
                            if (lectura.HasRows)
                            {
                                retorno = 1;
                            }
                            else
                            {
                                retorno = -1;
                            }
                        }
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    // Maneja la excepción, por ejemplo, registra el error
                    Console.WriteLine(ex.Message);
                    retorno = -1;
                }
            }

            return retorno;
        }
    }
}