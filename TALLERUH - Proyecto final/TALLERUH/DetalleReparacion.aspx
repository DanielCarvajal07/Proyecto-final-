<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="DetalleReparacion.aspx.cs" Inherits="TALLERUH.DetalleReparacion" %>
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

    Detalle ID: <asp:TextBox ID="tDetalle" class="form-control" runat="server"></asp:TextBox>
    <br />
    Reparacion ID: <asp:DropDownList ID="DropDownReparacionID" class="form-control" runat="server" ></asp:DropDownList>
    <br />
    Descripcion: <asp:TextBox ID="tDescripcion" class="form-control" runat="server"></asp:TextBox>
    <br />
    Fecha Inicio: <asp:TextBox ID="FechaInicio" class="form-control" runat="server"></asp:TextBox>
    <br />
    Fecha Fin: <asp:TextBox ID="FechaFin" class="form-control" runat="server"></asp:TextBox>

</div>


<div class="container text-center">

    <br/>
    <asp:Button ID="TButton1" runat="server" class="btn btn-outline-danger" Text="Agregar" OnClick="TButton1_Click" />
    <asp:Button ID="TButton2" runat="server" class="btn btn-outline-danger" Text="Modificar" OnClick="TButton2_Click" />
    <br/>

</div>

</asp:Content>