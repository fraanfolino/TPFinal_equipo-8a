<%@ Page Title="Catálogo" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPFinal_equipo_8a.Catalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2>Catálogo de Productos</h2>
        <div class="row">
            <asp:Repeater ID="rptProductos" runat="server">
                <ItemTemplate>
                    <div class="col-md-3">
                        <div class="card">
                            <img src='<%# ((List<string>)Eval("ImagenUrl"))[0] %>' class="card-img-top" alt="Imagen del producto">
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Nombre") %></h5>
                                <p class="card-text">Precio: $<%# Eval("Precio") %></p>
                                <a href= "DetalleProducto.aspx?Id=<%# Eval("Id") %>">Ver Detalle</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
