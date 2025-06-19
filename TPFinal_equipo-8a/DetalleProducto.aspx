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
                  <img src='<%# Eval("Url") %>' class="d-block w-100" style="max-height:400px; object-fit: contain;" alt="Imagen del producto"  onerror="handleImageError(this)">
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

   
    <asp:Label ID="lblNombre" runat="server" CssClass="h1 fw-bold d-block mb-3 text-dark"></asp:Label>

   
    <asp:Label ID="lblDescripcion" runat="server" CssClass="lead d-block text-muted mb-3"></asp:Label>

    
    <asp:Label ID="lblPrecioTitulo" runat="server" Text="Precio:" CssClass="fw-semibold me-1"></asp:Label>
    <asp:Label ID="lblPrecio" runat="server" CssClass="text-success fs-4 d-inline-block mb-4"></asp:Label>

    
    <asp:Label ID="lblTalles" runat="server" Text="Talles disponibles:"  CssClass="form-label fw-bold text-primary d-block mb-2"></asp:Label>
    <asp:DropDownList ID="ddlTalles" runat="server" CssClass="form-select form-select-lg mb-4" />


    <asp:Button ID="AgregarCarro" runat="server" Text="Agregar al carrito"
        CssClass="btn btn-success btn-lg px-5 shadow-sm"
        OnClick="btnAgregarCarro_Click" />

</div>
    </div>
  </div>
        <script>
        function handleImageError(img) {
            if (!img.dataset.fallback) {
                img.dataset.fallback = "true";
                img.src = 'Images/error.png';
            }
        }
        </script>
</asp:Content>