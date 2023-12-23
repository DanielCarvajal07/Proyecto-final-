<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Asignaciones.aspx.cs" Inherits="TALLERUH.Asignaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div class="container text-center" style="margin-top: 60px;">

    <br/>
        <div style="display: inline-block; text-align: left;">
        <asp:GridView runat="server" ID="Asigdatagrid" PageSize="10" HorizontalAlign="Center"
        CssClass="mydatagrid" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header"
        RowStyle-CssClass="rows" AllowPaging="True" />
        </div>
    <br/>

</div>


<div class="container text-center" style="margin-top: 50px;">

    Asignación ID: <asp:TextBox ID="AsignaconID" class="form-control" runat="server"></asp:TextBox>
    <br />
    Reparación ID: <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
    <br />
    Técnico ID: <asp:DropDownList ID="DropDownListTecnico" class="form-control" runat="server"></asp:DropDownList>
    <br />
    Fecha Asignación: <asp:TextBox ID="FechaAsignacion" class="form-control" runat="server"></asp:TextBox>

</div>


<div class="container text-center">

    <br/>
        <asp:Button ID="AButton1" class="btn btn-outline-danger" runat="server" Text="Agregar" OnClick="AButton1_Click" />
        <asp:Button ID="AButton2" class="btn btn-outline-danger" runat="server" Text="Borrar" OnClick="AButton2_Click" />
        <asp:Button ID="AButton3" runat="server" class="btn btn-outline-danger" Text="Modificar" OnClick="AButton3_Click" />
        <asp:Button ID="ABconsulta" runat="server" class="btn btn-outline-danger" Text="Consultar" OnClick="ABconsulta_Click" />
    <br/>

</div>


</asp:Content>