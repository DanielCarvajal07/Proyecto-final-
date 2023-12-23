using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALLERUH.Clases.Login;

namespace TALLERUH
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void button_Click1(object sender, EventArgs e)
        {
            Login_Usuarios usuario = new Login_Usuarios();
            usuario.SetCorreo(tcorreo.Text);
            usuario.SetContraseña(tcontraseña.Text);

            if (usuario.ValidarLogin() > 0)
            {
                Response.Redirect("Inicio.aspx");
            }
        }
    }
}