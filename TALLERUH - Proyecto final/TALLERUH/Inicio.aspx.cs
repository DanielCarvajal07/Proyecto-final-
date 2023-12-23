using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TALLERUH.Clases.Login;

namespace TALLERUH
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LName.Text = Login_Usuarios.GetCorreo();
        }
    }
}