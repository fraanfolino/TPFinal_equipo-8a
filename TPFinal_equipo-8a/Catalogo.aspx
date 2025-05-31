<%@ Page Title="Catálogo" Language="C#" MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPFinal_equipo_8a.Catalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <div class="container mt-5">
    <div class="row">
   
      <div class="col-md-3">
        <div class="card mb-4">
          <div class="card-header">
            Filtros
          </div>
          <div class="card-body">
            
                <div class="mb-3">
                  <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select">
                    <asp:ListItem Value="0" Text="Todas" />
                    <asp:ListItem Value="Nike" Text="Nike" />
                    <asp:ListItem Value="Adidas" Text="Adidas" />
                    <asp:ListItem Value="Vans" Text="Vans" />
                    <asp:ListItem Value="Puma" Text="Puma" />
                    <asp:ListItem Value="Reebok" Text="Reebok" />
                  </asp:DropDownList>
                </div>
            
            <div class="mb-3">
              <asp:TextBox ID="txtBusqueda" runat="server" CssClass="form-control" 
                             placeholder="Buscar por producto"></asp:TextBox>
            </div>
            <div class="d-grid">
              <asp:Button ID="btnFiltrarMarca" runat="server" Text="Filtrar" CssClass="btn btn-primary" 
                          OnClick="btnFiltrarMarca_Click" />
            </div>
          </div>
        </div>
      </div>

   
      <div class="col-md-9">
        <div class="row">
          <asp:Repeater ID="rptProductos" runat="server" OnItemDataBound="rptProductos_ItemDataBound">
            <ItemTemplate>
              <div class="col-md-4 mb-4">
                <div class="card card-custom text-center">
              
                  <div id="carousel_<%# Eval("Id") %>" class="carousel slide">
                    <div class="carousel-inner">
                      <asp:Repeater ID="rptImagenes" runat="server">
                        <ItemTemplate>
                          <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                            <img src='<%# Container.DataItem %>' 
                                 class="d-block w-100" 
                                 style="max-height: 350px; object-fit: contain;" 
                                 alt="Imagen del producto" />
                          </div>
                        </ItemTemplate>
                      </asp:Repeater>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel_<%# Eval("Id") %>" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Anterior</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carousel_<%# Eval("Id") %>" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Siguiente</span>
                    </button>
                  </div>
                  <div class="card-body">
                    <h5 class="card-title"><%# Eval("Nombre") %></h5>
                    <p class="card-text"><%# Eval("Descripcion") %></p>
                    <a href="DetalleProducto.aspx?Id=<%# Eval("Id") %>" class="btn btn-primary">
                      Ver Detalle
                    </a>
                  </div>
                </div>
              </div>
            </ItemTemplate>
          </asp:Repeater>
        </div>
      </div>
    </div>
  </div>
</asp:Content>