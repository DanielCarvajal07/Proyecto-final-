<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="TALLERUH.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container text-center" style="margin-top: 60px;">

    <br/>
        <div style="display: inline-block; text-align: left;">
        <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
        RowStyle-CssClass="rows" AllowPaging="True" />
        </div>
    <br/>

</div>


<div class="container text-center" style="margin-top: 50px;">

    Usuario ID: <asp:TextBox ID="tCodigo" class="form-control" runat="server"></asp:TextBox>
    <br />
    Nombre: <asp:TextBox ID="tNombre" class="form-control" runat="server"></asp:TextBox>
    <br />
    Correo Electrónico: <asp:TextBox ID="tCElectronico" class="form-control" runat="server"></asp:TextBox>
    <br />
    Teléfono: <asp:TextBox ID="tTelefono" class="form-control" runat="server"></asp:TextBox>

</div>


<div class="container text-center">

    <br/>
        <asp:Button ID="Button1" class="btn btn-outline-danger" runat="server" Text="Agregar" OnClick="Button1_Click" />
        <asp:Button ID="Button2" class="btn btn-outline-danger" runat="server" Text="Borrar" OnClick="Button2_Click" />
        <asp:Button ID="Button3" runat="server" class="btn btn-outline-danger" Text="Modificar" OnClick="Button3_Click" />
        <asp:Button ID="Bconsulta" runat="server" class="btn btn-outline-danger" Text="Consultar" OnClick="Bconsulta_Click" />
    <br/>

</div>


</asp:Content>