<%@ Page Title="" Language="C#" MasterPageFile="~/CAPAvista/Site1.Master" AutoEventWireup="true" CodeBehind="p2.aspx.cs" Inherits="FORMULARIO.CAPAvista.p2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>FORMULARIO</h1>
    <asp:Label ID="Lmensaje" runat="server" Text="Label"></asp:Label>
    CODIGO 
    <asp:TextBox ID="TCODIGO" runat="server"></asp:TextBox>
    DESCRPCION
    <asp:TextBox ID="TDESCRIPCION" runat="server"></asp:TextBox>

    <asp:Button ID="BAGREGAR" runat="server" Text="AGREGAR" />
    <asp:Button ID="BBORRAR" runat="server" Text="ELIMINAR" />


</asp:Content>