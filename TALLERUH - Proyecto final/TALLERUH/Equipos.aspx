<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Equipos.aspx.cs" Inherits="TALLERUH.Equipos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 

<div class="container text-center" style="margin-top: 60px;">

    <br/>
        <div style="display: inline-block; text-align: left;">
        <asp:GridView runat="server" ID="Edatagrid" PageSize="10" HorizontalAlign="Center"
        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
        RowStyle-CssClass="rows" AllowPaging="True" />
        </div>
    <br/>

</div>


<div class="container text-center" style="margin-top: 50px;">

    Equipo ID: <asp:TextBox ID="EEquipoID" class="form-control" runat="server"></asp:TextBox>
    <br />
    Usuario ID:<asp:DropDownList ID="DropDownListUsuarioID" class="form-control" runat="server"></asp:DropDownList>
    <br />
    Tipo: <asp:DropDownList ID="DropDownListETipo" class="form-control" runat="server"></asp:DropDownList>
    <br />
    Modelo: <asp:TextBox ID="EModelo" class="form-control" runat="server"></asp:TextBox>

</div>


<div class="container text-center">

    <br/>
        <asp:Button ID="EButton1" class="btn btn-outline-danger" runat="server" Text="Agregar" OnClick="TButton1_Click" />
        <asp:Button ID="EButton2" class="btn btn-outline-danger" runat="server" Text="Borrar" OnClick="TButton2_Click" />
        <asp:Button ID="EButton3" runat="server" class="btn btn-outline-danger" Text="Modificar" OnClick="TButton3_Click" />
        <asp:Button ID="EBconsulta" runat="server" class="btn btn-outline-danger" Text="Consultar" OnClick="TBconsulta_Click"/>
    <br/>

</div>

    
</asp:Content>