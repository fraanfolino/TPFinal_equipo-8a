<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Carro.aspx.cs" Inherits="TPFinal_equipo_8a.Carro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<asp:Repeater ID="rptCarrito" runat="server">
    <ItemTemplate>
        <div class="card mb-3">
            <div class="row g-0">
              
                <div class="col-md-4">
                    <div id='<%# "carouselProducto" + Eval("Producto.Id") %>' class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <asp:Repeater ID="rptImagenes" runat="server" DataSource='<%# Eval("Producto.ImagenUrl") %>'>
                                <ItemTemplate>
                                    <div class='carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>'>
                                        <img src='<%# Container.DataItem %>' class="d-block w-100" style="max-height:200px; object-fit: contain;" alt="Imagen del producto">
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target='<%# "#carouselProducto" + Eval("Producto.Id") %>' data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Anterior</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target='<%# "#carouselProducto" + Eval("Producto.Id") %>' data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Siguiente</span>
                        </button>
                    </div>
                </div>

            
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("Producto.Nombre") %></h5>
                        <p class="card-text">Precio: $<%# Eval("Producto.Precio") %></p>
                        <p class="card-text">Cantidad: <%# Eval("Cantidad") %></p>
                        <p class="card-text">Talle: <%# Eval("Talle") %></p>

                        <a href="Catalogo.aspx" class="btn btn-primary btn-lg rounded-pill">Volver al Catálogo</a>

                      
                    </div>
                </div>
            </div>
        </div>
    </ItemTemplate>
</asp:Repeater>
</asp:Content>
