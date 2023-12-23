<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Reparacion.aspx.cs" Inherits="TALLERUH.Reparacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container text-center" style="margin-top: 60px;">

    <br/>
        <div style="display: inline-block; text-align: left;">
        <asp:GridView runat="server" ID="Tdatagrid" PageSize="10" HorizontalAlign="Center"
        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
        RowStyle-CssClass="rows" AllowPaging="True" />
        </div>
    <br/>

</div>


<div class="container text-center" style="margin-top: 50px;">

    Reparacion ID: <asp:TextBox ID="tReparacion" class="form-control" runat="server"></asp:TextBox>
    <br />
    Equipo ID: <asp:TextBox ID="tEquipo" class="form-control" runat="server"></asp:TextBox>
    <br />
    Estado: <asp:DropDownList ID="DropDownListEstado" class="form-control" runat="server"></asp:DropDownList>
    <br />
    Fecha Solicitud: <asp:TextBox ID="TextBox1" class="form-control" runat="server"></asp:TextBox>






</div>


<div class="container text-center">

    <br/>
    <asp:Button ID="TButton1" runat="server" class="btn btn-outline-danger" Text="Agregar" OnClick="TButton1_Click" />
    <asp:Button ID="TButton2" runat="server" class="btn btn-outline-danger" Text="Modificar" OnClick="TButton2_Click" />
    <br/>

</div>

</asp:Content>
