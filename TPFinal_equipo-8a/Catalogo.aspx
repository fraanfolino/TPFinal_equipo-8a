﻿<%@ Page Title="Catálogo" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="TPFinal_equipo_8a.Catalogo" %>

                                    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                                      <div class="container mt-5">
                                        <div class="row">

    
                                         <div class="col-md-3">

                                     
                                      <div class="card mb-4">
                                        <div class="card-header">Buscar producto</div>
                                        <div class="card-body">
                                          <asp:TextBox 
                                            ID="txtBusqueda" runat="server" CssClass="form-control"
                                            AutoPostBack="true" OnTextChanged="txtBusqueda_TextChanged"
                                            placeholder="Escribe para buscar…" />
                                        </div>
                                      </div>


                                      <div class="card mb-4">
                                        <div class="card-header">Filtrar por marca</div>
                                        <div class="card-body">

                                          <asp:DropDownList 
                                            ID="ddlMarca" runat="server" CssClass="form-select" />

                                          <div class="d-grid mt-3">
                                            <asp:Button 
                                              ID="btnFiltrarMarca" runat="server" 
                                              Text="Aplicar" CssClass="btn btn-primary" 
                                              OnClick="btnFiltrarMarca_Click" />
                                          </div>

                                        </div>
                                      </div>

                                     <div class="card mb-4">
                                        <div class="card-header">Filtrar por categoria</div>
                                        <div class="card-body">

                                          <asp:DropDownList 
                                            ID="ddlCategoria" runat="server" CssClass="form-select" />

                                          <div class="d-grid mt-3">
                                            <asp:Button 
                                              ID="btnFiltrarCategoria" runat="server" 
                                              Text="Aplicar" CssClass="btn btn-primary" 
                                              OnClick="btnFiltrarCategoria_Click" />
                                          </div>

                                        </div>
                                      </div>



         
                                                       <div class="card mb-4">
  <div class="card-header">Filtrar por precio</div>
  <div class="card-body">
  
    <label for="txtPrecioMin">Precio mínimo</label>
    <asp:TextBox
      ID="txtPrecioMin"
      TextMode="Number"
      runat="server"
      CssClass="form-control"
      placeholder="0.00" />

    <label class="mt-2" for="txtPrecioMax">Precio máximo</label>
    <asp:TextBox
      ID="txtPrecioMax"
      TextMode="Number"
      runat="server"
      CssClass="form-control"
      placeholder="9999999.99" />

    
    <asp:Label
      ID="lblError"
      runat="server"
      CssClass="alert alert-danger mt-3 d-block"
      Visible="false" />

    <div class="d-grid mt-3">
      <asp:Button
        ID="btnFiltrarPrecio"
        runat="server"
        Text="Aplicar precio"
        CssClass="btn btn-primary"
        OnClick="btnFiltrarPrecio_Click" />
    </div>

  </div>
</div>

                                    </div>

     
      <div class="col-md-9">
        <div class="row">
          <asp:Repeater ID="rptProductos" runat="server" OnItemDataBound="rptProductos_ItemDataBound">
            <ItemTemplate>
              <div class="col-md-3 mb-3">
                <div class="card text-center shadow" style="height: 300px;">

<div class="text-start px-2 pt-2 d-flex gap-2 mb-2">
<span class="badge bg-secondary"><asp:Literal ID="litCategoria" runat="server" /></span>
<span class="badge bg-secondary"><asp:Literal ID="litMarca" runat="server" /></span>
</div>

                  <a href='DetalleProducto.aspx?Id=<%# Eval("Id") %>' style="text-decoration: none;">
                  <div id="carousel_<%# Eval("Id") %>" class="carousel slide">
                    <div class="carousel-inner">
                      <asp:Repeater ID="rptImagenes" runat="server">
                        <ItemTemplate>

                          <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">
                            <img src='<%# Container.DataItem %>'
                                 class="d-block w-100"
                                 alt="Imagen del producto"
                                 onerror="handleImageError(this)"
                                 style="max-height:150px;object-fit:contain;" />
                          </div>
  
                        </ItemTemplate>
                      </asp:Repeater>
                    </div>
  </a>


                    <button class="carousel-control-prev" type="button" data-bs-target="#carousel_<%# Eval("Id") %>" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon"></span>
                      <span class="visually-hidden">Anterior</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carousel_<%# Eval("Id") %>" data-bs-slide="next">
                      <span class="carousel-control-next-icon"></span>
                      <span class="visually-hidden">Siguiente</span>
                    </button>
                  </div>

                <div class="card-body">
                                      <p class="card-text fw-bold"><%# "$" + Convert.ToDecimal(Eval("Precio")).ToString("F2") %></p>
                <h6 class="card-title fw-normal"><%# Eval("Nombre") %></h6>
                </div>

                </div>
              </div>
            </ItemTemplate>
          </asp:Repeater>
        </div>
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