<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TALLERUH.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="CSS/LoginCSS.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-page">
  <div class="form">
    <div class="login">
      <div class="login-header">
        <h3>INICIO DE SESION</h3>
        <p>Por favor Ingrese su Usuario y Contraseña Para Acceder al TallerUH</p>
      </div>
    </div>
    <form class="login-form">
        <asp:TextBox ID="tcorreo" placeholder="Nombre de Usuario" runat="server"></asp:TextBox>
        <asp:TextBox type="password" ID="tcontraseña" placeholder="Contraseña" runat="server"></asp:TextBox> 
        <asp:button class="btn btn-success" ID="button" runat="server" Text="¡Iniciar Sesion!" OnClick="button_Click1"  />
    </form>
  </div>
</div>
    </form>
</body>
</html>
