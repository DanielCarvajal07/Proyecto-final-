using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace TALLERUH
{
    public partial class Asignaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
                DropDownList1_SelectedIndexChanged();
                DropDownListTecnico_SelectedIndexChanged();
                FechaAsignacion.Text = "yyyy-mm-dd";
            }
        }

        protected void LlenarGrid() // Metodo obligatorio para actualizar constantemente la tabla proveniente de SQL
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM Asignaciones"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            Asigdatagrid.DataSource = dt;
                            Asigdatagrid.DataBind();  // actualizar el grid view
                        }
                    }
                }
            }



        }


        protected void DropDownList1_SelectedIndexChanged() // Esto es adicional si se quiere hacer un DropDownList
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select ReparacionID from Reparaciones")) // Escogen la tabla y variable que quiere que despliegue desde SQL
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            DropDownList1.DataSource = dt;

                            DropDownList1.DataTextField = dt.Columns["ReparacionID"].ToString(); // Escogen de nuevo la variable que quiere que despliegue desde SQL
                            DropDownList1.DataValueField = dt.Columns["ReparacionID"].ToString(); // Escogen de nuevo la variable que quiere que despliegue desde SQL
                            DropDownList1.DataBind();
                        }
                    }
                }
            }
        }

        protected void DropDownListTecnico_SelectedIndexChanged() // Esto es adicional si se quiere hacer un DropDownList
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Select TecnicoID from Tecnicos"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            DropDownListTecnico.DataSource = dt;

                            DropDownListTecnico.DataTextField = dt.Columns["TecnicoID"].ToString();
                            DropDownListTecnico.DataValueField = dt.Columns["TecnicoID"].ToString();
                            DropDownListTecnico.DataBind();
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



        protected void AButton1_Click(object sender, EventArgs e)
        {   //Debe eagregarse en un archivo Clase los metodos para agregar, borrar y modificar
            if (Clases.ASIGNACIONES.Agregar(int.Parse(DropDownList1.SelectedValue), int.Parse(DropDownListTecnico.SelectedValue), DateTime.Parse(FechaAsignacion.Text)) > 0)
            {
                LlenarGrid();
                alertas("Asignacion agregada con exito.");
                AsignaconID.Text = ""; FechaAsignacion.Text = "yyyy-mm-dd";


            }
            else
            {
                alertas("Error al agregar la Asignacion.");
            }


        }

        protected void AButton2_Click(object sender, EventArgs e)
        {

            if (Clases.ASIGNACIONES.Borrar(int.Parse(AsignaconID.Text)) > 0)
            {
                LlenarGrid();
                alertas("Asignacion borrada con exito.");
                AsignaconID.Text = ""; FechaAsignacion.Text = "yyyy-mm-dd";


            }
            else
            {
                alertas("Error al borrar la asignacion.");
            }


        }

        protected void AButton3_Click(object sender, EventArgs e)
        {

            if (Clases.ASIGNACIONES.modificar(int.Parse(AsignaconID.Text),int.Parse(DropDownList1.SelectedValue), int.Parse(DropDownListTecnico.SelectedValue), DateTime.Parse(FechaAsignacion.Text)) > 0)
            {
                LlenarGrid();
                alertas("Asignacion modificada con exito.");
                AsignaconID.Text = ""; FechaAsignacion.Text = "yyyy-mm-dd";


            }
            else
            {
                alertas("Error al modificar la asignacion.");
            }





        }

        protected void ABconsulta_Click(object sender, EventArgs e)
        {
            {
                int codigo = int.Parse(AsignaconID.Text);
                string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
                using (SqlConnection con = new SqlConnection(constr))
                { 
                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM Asignaciones WHERE AsignacionID ='" + codigo + "'")) // Pones el nombre de la tabla en SQL y el nombre de la variable que tiene en SQL
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                Asigdatagrid.DataSource = dt;
                                Asigdatagrid.DataBind();  // actualizar el grid view
                            }
                        }



                    }


                }
            }

            AsignaconID.Text = ""; FechaAsignacion.Text = "yyyy-mm-dd";
        }
    }
}