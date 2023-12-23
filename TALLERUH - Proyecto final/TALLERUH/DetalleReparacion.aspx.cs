using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TALLERUH
{
    public partial class DetalleReparacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LlenarGrid();
                DropDownReparacionID_SelectedIndexChanged();
                FechaInicio.Text = "yyyy-mm-dd";
                FechaFin.Text = "yyyy-mm-dd";
            }
        }

        protected void LlenarGrid() // Metodo obligatorio para actualizar constantemente la tabla proveniente de SQL
        {
            string constr = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT *  FROM DetallesReparacion"))
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

        protected void DropDownReparacionID_SelectedIndexChanged()
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
                            DropDownReparacionID.DataSource = dt;

                            DropDownReparacionID.DataTextField = dt.Columns["ReparacionID"].ToString(); // Escogen de nuevo la variable que quiere que despliegue desde SQL
                            DropDownReparacionID.DataValueField = dt.Columns["ReparacionID"].ToString(); // Escogen de nuevo la variable que quiere que despliegue desde SQL
                            DropDownReparacionID.DataBind();
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
                if (Clases.DETALLEREPARACION.Agregar(int.Parse(DropDownReparacionID.SelectedValue), tDescripcion.Text, DateTime.Parse(FechaInicio.Text), DateTime.Parse(FechaFin.Text)) > 0)
                {
                    LlenarGrid();
                    alertas("Detalle agregado con exito.");
                    tDetalle.Text = ""; tDescripcion.Text = ""; FechaInicio.Text = "yyyy-mm-dd"; FechaFin.Text = "yyyy-mm-dd";


                }
                else
                {
                    alertas("Error al agregar el detalle.");
                }


            }


        }

        protected void TButton2_Click(object sender, EventArgs e)
        {

            if (Clases.DETALLEREPARACION.modificar(int.Parse(tDetalle.Text), int.Parse(DropDownReparacionID.SelectedValue), tDescripcion.Text, DateTime.Parse(FechaInicio.Text), DateTime.Parse(FechaFin.Text)) > 0)
            {
                LlenarGrid();
                alertas("Detalle modificado con exito.");
                tDetalle.Text = ""; tDescripcion.Text = ""; FechaInicio.Text = "yyyy-mm-dd"; FechaFin.Text = "yyyy-mm-dd";


            }
            else
            {
                alertas("Error al modificar el detalle.");
            }





        }






    }
}