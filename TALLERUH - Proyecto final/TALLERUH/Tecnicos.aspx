<%@ Page Title="" Language="C#" MasterPageFile="~/menu.Master" AutoEventWireup="true" CodeBehind="Tecnicos.aspx.cs" Inherits="TALLERUH.Tecnicos" %>
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

    Técnico ID: <asp:TextBox ID="tCodigoTec" class="form-control" runat="server"></asp:TextBox>
    <br />
    Nombre: <asp:TextBox ID="tNombre" class="form-control" runat="server"></asp:TextBox>
    <br />
    Especialidad: <asp:DropDownList ID="DropDownListEspecialidad" class="form-control" runat="server"></asp:DropDownList>

</div>


<div class="container text-center">

    <br/>
        <asp:Button ID="TButton1" class="btn btn-outline-danger" runat="server" Text="Agregar" OnClick="TButton1_Click" />
        <asp:Button ID="TButton2" class="btn btn-outline-danger" runat="server" Text="Borrar" OnClick="TButton2_Click" />
        <asp:Button ID="TButton3" runat="server" class="btn btn-outline-danger" Text="Modificar" OnClick="TButton3_Click" />
        <asp:Button ID="TBconsulta" runat="server" class="btn btn-outline-danger" Text="Consultar" OnClick="TBconsulta_Click" />
    <br/>

</div>

    
</asp:Content>