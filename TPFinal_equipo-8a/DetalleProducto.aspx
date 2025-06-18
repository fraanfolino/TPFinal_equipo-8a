<%@ Page Title="Detalle del Producto" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TPFinal_equipo_8a.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="container mt-5">
    <div class="row">
     
      <div class="col-md-6">
        <div id="carouselProducto" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <asp:Repeater ID="rptImagenes" runat="server">
              <ItemTemplate>
                <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                  <img src='<%# Eval("Url") %>' class="d-block w-100" style="max-height:400px; object-fit: contain;" alt="Imagen del producto">
                </div>
              </ItemTemplate>
            </asp:Repeater>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#carouselProducto" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Anterior</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#carouselProducto" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Siguiente</span>
          </button>
        </div>
      </div>

      <div class="col-md-6">
        <h1><asp:Label ID="lblNombre" runat="server" CssClass="display-4"></asp:Label></h1>
        <p class="lead"><asp:Label ID="lblDescripcion" runat="server"></asp:Label></p>
        <h3>Precio: $<asp:Label ID="lblPrecio" runat="server"></asp:Label></h3>
        <label for="ddlTalles" class="form-label fw-bold text-primary"> Talles disponibles:</label>
        <asp:DropDownList ID="ddlTalles" runat="server" CssClass="form-select form-select-lg" />
        <asp:Button ID="AgregarCarro" runat="server" CssClass="btn btn-primary" Text="Agregar al carrito" OnClick="btnAgregarCarro_Click" />
      </div>
    </div>
  </div>
</asp:Content>