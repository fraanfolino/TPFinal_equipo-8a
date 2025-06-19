<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CargarProductos.aspx.cs" Inherits="TPFinal_equipo_8a.CargarProductos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<link href="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/css/tom-select.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/js/tom-select.complete.min.js"></script>

<style>
.ts-control {
  min-height: 2.375rem;
  max-height: 2.375rem;
  height: 2.375rem;
  padding: 0.375rem 0.75rem;
  line-height: 1.5;
  border-radius: 0.375rem;
  border: 1px solid #ced4da;
  background-color: #fff;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  overflow: hidden;
  font-size: 1rem;
  line-height: 1.5;
  font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
}

.ts-dropdown .option {
  font-size: 1rem;       
  font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
  padding: 0.5rem 1rem;
  color: #212529; 
  background-color: #fff;
}

.ts-wrapper:focus-within {
  border-color: #86b7fe;
  box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
  outline: 0;
  border-radius: 0.375rem;
}

.gridview-compact tr td {
    padding-top: 1.2px;
    padding-bottom: 1.2px;
    line-height: 1.5;
}

</style>
<h2>
    <asp:Label ID="Titulo" runat="server" Text="Modificar Stock" />
</h2>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <div class="row" style="height: 2rem;">
                 <label class="form-label">Agregar o Quitar Stock a Productos Existentes</label>
            </div>
      <div class="row">
 <div class="col-md-4">

       <div class="row">
                <div class="col-md-3">
                    <div class="mb-1">
                        <label class="form-label text-muted">Cantidad</label>
                     <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" Text="1"  />
                    </div>
                </div>
      </div>
      <div class="row">
                <div class="col-md-6">
                    <div class="mb-2">
                        <label class="form-label text-muted">Categoría</label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mb-2">
                        <label class="form-label text-muted">Marca</label>
                        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                </div>
         </div>
              <div class="row">
                <div class="col-md-12">
                    <div class="mb-2">
                        <label for="<%= productoSeleccionado.ClientID %>" class="form-label text-muted">Productos</label>
                        <select id="productoSeleccionado" runat="server"></select>
                    </div>
                </div>
            </div>

            <div class="row">
                    <div class="col-md-12">
                        <div class="mb-2">
                            <label for="<%= ddlTalles2.ClientID %>" class="form-label text-muted">Talles</label>
                            <select id="ddlTalles2" runat="server" multiple></select>
                        </div>
                    </div>
            </div>
                    <div class="row">
                        <div class="col-md-12">
                        <div class="mb-2">
                       <asp:Label ID="errorMensaje" runat="server" class="alert-danger"></asp:Label>
                       <asp:Label ID="exitoMensaje" runat="server" class="alert-success"></asp:Label>
                        </div>
                    </div>
            </div>
         <div class="row">    
                 <div class="col-md-6">
                         <asp:Button ID="btnAgregar" Text="Agregar Stock" runat="server" CssClass="btn btn-primary w-100" OnClick="btnAgregar_Click"/>
                      </div>
             <div class="col-md-6">
                    <asp:Button ID="btnEliminar" Text="Eliminar Stock" runat="server" CssClass="btn btn-danger w-100" OnClick="btnEliminar_Click"/>       
            </div>
                </div>
<div class="row my-4"></div>
     </div>
                    <div class="col-md-2">
                    <div class="mb-1">
                    <label class="form-label text-muted">Stock</label>
    <asp:Label ID="lblNombre" runat="server" Text="" Style="font-size: 11px;" />
                        <asp:GridView ID="TablaStock" runat="server" AutoGenerateColumns="False"
                                          CssClass="table table-striped table-bordered table-condensed gridview-compact"
                                          EnableSortingAndPagingCallbacks="false">
                            <Columns>
                                <asp:BoundField DataField="Talle" HeaderText="Talle" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width ="10%" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width ="10%" />
                            </Columns>
                        </asp:GridView>

 </div>

 </div>
<div class="col-md-3">
<div class="row">
    <div class="mb-2">
                    <label class="form-label text-muted">Imagenes</label>


        <div id="carouselExampleIndicators" class="carousel slide bg-light" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <asp:Repeater ID="rptIndicadores" runat="server">
                    <ItemTemplate>
                        <button type="button"
                                data-bs-target="#carouselExampleIndicators"
                                data-bs-slide-to='<%# Container.ItemIndex %>'
                                class='<%# Container.ItemIndex == 0 ? "active" : "" %>'
                                aria-current='<%# Container.ItemIndex == 0 ? "true" : "false" %>'
                                aria-label="Slide <%# Container.ItemIndex + 1 %>"></button>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="carousel-inner">
                <asp:Repeater ID="rptImagenes" runat="server">
                    <ItemTemplate>
                        <div class='carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>'>
                        <img src='<%# Container.DataItem.ToString() %>' 
                             class="d-block w-100" 
                             alt="..."
                             onerror="handleImageError(this)"
                             style="max-height: 360px; min-height: 360px; object-fit: contain;" />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Anterior</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Siguiente</span>
            </button>
        </div>

 </div>


                    </div>
                </div>
       </div>                               

<script type="text/javascript">
    function initTomSelects() {
        new TomSelect("#<%= productoSeleccionado.ClientID %>",
        {
            persist: false,
            maxItems: 1,
            plugins: [],
            onChange: function (value)
            {
                this.close();

                if (value.length != 0) {
                    __doPostBack('<%= productoSeleccionado.ClientID %>', '');
                }
                else
                {
                    this.clear(); 
                }
            },
            onDropdownOpen: function ()
            {
                if (this.items.length > 0)
                {
                    this.focus();
                }
            },
            onFocus: function () {
                var errorLabel = document.getElementById("<%= errorMensaje.ClientID %>");
                var exitoLabel = document.getElementById("<%= exitoMensaje.ClientID %>");

                if (errorLabel) errorLabel.style.display = "none";
                if (exitoLabel) exitoLabel.style.display = "none";
            },
            render:
            {
                option: function (data, escape)
                {
                    const date = data.date ? escape(data.date) : '';
                    return `<div class="d-flex">
                        <span>${escape(data.value)}</span>
                        <span class="ms-auto text-muted">${date}</span>
                        </div>`;
                },
                item: function (data, escape)
                {
                    return `<div>${escape(data.value)}</div>`;
                }
            }
        });

        var tsTalles2 = new TomSelect("#<%= ddlTalles2.ClientID %>",
        {
            plugins: ['remove_button'],
            create: false,
            maxItems: null,
            onItemAdd: function ()
            {
                this.setTextboxValue('');
                this.refreshOptions();
            },
            onFocus: function ()
            {
                var errorLabel = document.getElementById("<%= errorMensaje.ClientID %>");
                var exitoLabel = document.getElementById("<%= exitoMensaje.ClientID %>");

                if(errorLabel) errorLabel.style.display = "none";
                if(exitoLabel) exitoLabel.style.display = "none";
            },
            render:
            {
                option: function (data, escape)
                {
                    const date = data.date ? escape(data.date) : '';
                    return `<div class="d-flex">
                            <span>${escape(data.value)}</span>
                            <span class="ms-auto text-muted">${date}</span>
                            </div>`;
                },
                item: function (data, escape) {
                    return `<div>${escape(data.value)}</div>`;
                }
            }
        });

        tsTalles2.control.style.height = '4.75rem';
        tsTalles2.control.style.maxHeight = '4.75rem';
        tsTalles2.control.style.fontSize = '0.75rem';
        tsTalles2.control.querySelector('input').style.caretColor = 'transparent';

    }

    document.addEventListener("DOMContentLoaded", function ()
    {
        initTomSelects();
    });

    Sys.Application.add_load(function ()
    {
        initTomSelects();
    });
</script>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>