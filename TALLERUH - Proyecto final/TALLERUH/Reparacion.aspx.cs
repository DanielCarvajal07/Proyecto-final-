using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALLERUH.Clases;

namespace TALLERUH
{
    public partial class Reparacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
            DropDownListEstado_SelectedIndexChanged();
            TextBox1.Text = "yyyy-mm-dd";

        }

        protected void LlenarGrid() // Metodo obligatorio para actualizar constantemente la tabla proveniente de SQL
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Reparaciones"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            Tdatagrid.DataSource = dt;
                            Tdatagrid.DataBind();  // actualizar el grid view
                        }
                    }
                }
            }

        }

        protected void DropDownListEstado_SelectedIndexChanged()
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select TipoEstado from TiposEstadoReparacion")) 
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            DropDownListEstado.DataSource = dt;

                            DropDownListEstado.DataTextField = dt.Columns["TipoEstado"].ToString(); 
                            DropDownListEstado.DataValueField = dt.Columns["TipoEstado"].ToString(); 
                            DropDownListEstado.DataBind();
                        }
                    }
                }
            }


        }

        public void alertas(String texto)
        {
            string message = texto;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());

        }



        protected void TButton1_Click(object sender, EventArgs e)
        {

            {
                if (Clases.REPARACION.Agregar(int.Parse(tEquipo.Text), DropDownListEstado.SelectedValue, DateTime.Parse(TextBox1.Text)) > 0)
                {
                    LlenarGrid();
                    alertas("Reparacion agregada con exito.");
                    tReparacion.Text = ""; tEquipo.Text = ""; TextBox1.Text = "yyyy-mm-dd"; 


                }
                else
                {
                    alertas("Error al agregar el reparacion.");
                }


            }




        }

        protected void TButton2_Click(object sender, EventArgs e)
        {

            {

                if (Clases.REPARACION.modificar(int.Parse(tReparacion.Text), int.Parse(tEquipo.Text), DropDownListEstado.SelectedValue, DateTime.Parse(TextBox1.Text)) > 0)
                {
                    LlenarGrid();
                    alertas("Reparacion modificada con exito.");
                    tReparacion.Text = ""; tEquipo.Text = ""; TextBox1.Text = "yyyy-mm-dd";


                }
                else
                {
                    alertas("Error al modificar la reparacion.");
                }





            }






        }
    }
}