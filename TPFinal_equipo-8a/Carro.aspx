<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Carro.aspx.cs"
    Inherits="TPFinal_equipo_8a.Carro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Tu Carrito</h2>

 
  <div class="d-flex justify-content-end align-items-center mt-4 gap-3">
  <span class="fw-bold">Total a pagar:</span>
  <asp:Label ID="lblTotal" runat="server" CssClass="fw-bold fs-5" />

  <asp:Button 
    ID="btnContinuarCompra" 
    runat="server" 
    Text="Continuar compra" 
    CssClass="btn btn-success"
    OnClick="btnContinuarCompra_Click" />
</div>
 
  <asp:Repeater ID="rptCarrito" runat="server">
    <ItemTemplate>
      <div class="card mb-3">
        <div class="row g-0">

          
          <div class="col-md-4">
            <div id='<%# "carousel_" + Container.ItemIndex %>'
                 class="carousel slide" data-bs-ride="carousel">
              <div class="carousel-inner">
                <asp:Repeater 
                  ID="rptImagenes" 
                  runat="server" 
                  DataSource='<%# Eval("Producto.ImagenUrl") %>'>
                  <ItemTemplate>
                    <div class='carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>'>
                      <img src='<%# Container.DataItem %>'
                           class="d-block w-100" 
                           style="max-height:200px;object-fit:contain;" />
                    </div>
                  </ItemTemplate>
                </asp:Repeater>
              </div>
              <button class="carousel-control-prev" type="button"
                      data-bs-target='<%# "#carousel_" + Container.ItemIndex %>'
                      data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
              </button>
              <button class="carousel-control-next" type="button"
                      data-bs-target='<%# "#carousel_" + Container.ItemIndex %>'
                      data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
              </button>
            </div>
          </div>

          <div class="col-md-8">
            <div class="card-body">
              <h5 class="card-title">
                <%# Eval("Producto.Nombre") %>
              </h5>
              <p class="card-text">
                Precio unitario: $<%# Eval("Producto.Precio","{0:N2}") %>
              </p>
              <p class="card-text">
                Cantidad: <%# Eval("Cantidad") %>
              </p>
              <p class="card-text fw-bold">
                Subtotal: $
                <%# ((Dominio.ItemCarrito)Container.DataItem)
                       .Precio()
                       .ToString("N2") %>
              </p>

<div class="mt-2">
  <a href='<%# "Carro.aspx?accion=RestarCantidad&productoId=" 
           + Eval("Producto.Id") 
           + "&talleId=" 
           + Eval("Producto.Talle.Id") %>' 
     class="btn btn-outline-danger btn-sm me-1">−</a>

  <a href='<%# "Carro.aspx?accion=SumarCantidad&productoId=" 
           + Eval("Producto.Id") 
           + "&talleId=" 
           + Eval("Producto.Talle.Id") %>' 
     class="btn btn-outline-success btn-sm">+</a>
</div>
              <p class="card-text">
                Talle: <%# Eval("Producto.Talle.Etiqueta") %>
              </p>
              <a href="Catalogo.aspx" class="btn btn-primary rounded-pill mt-2">
                Volver al catálogo
              </a>
            </div>
          </div>

        </div>
      </div>
    </ItemTemplate>
  </asp:Repeater>
</asp:Content>