<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CargarProductos.aspx.cs" Inherits="TPFinal_equipo_8a.CargarProductos" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<link href="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/css/tom-select.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/tom-select@2.0.0-rc.4/dist/js/tom-select.complete.min.js"></script>

<style>
/* Ajusta exactamente al tamaño del form-select de Bootstrap */
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
  align-items: center; /* Centra verticalmente */
  overflow: hidden;
  font-size: 1rem;  /* Tamaño del texto */
  line-height: 1.5; /* Altura de línea */
  font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
}

.ts-dropdown .option {
  font-size: 1rem;        /* Cambia el tamaño del texto */
  font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif;
  padding: 0.5rem 1rem;      /* Ajusta el padding */
  color: #212529;            /* Color del texto */
  background-color: #fff;    /* Fondo por defecto */
}

/* Estilo visual de focus como Bootstrap */
.ts-wrapper:focus-within {
  border-color: #86b7fe;
  box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
  outline: 0;
  border-radius: 0.375rem; /* igual que el control de Bootstrap */
}

.ts-control.multi .ts-control-input:focus {
  caret-color: transparent; /* Oculta el cursor */
}

.ts-control.single .ts-control-input:focus {
  caret-color: transparent; /* Para single select si hay texto fijo */
}

/* Solo si hay items seleccionados */
.ts-control.multi.has-items .ts-control-input {
  caret-color: transparent;
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

 <!-- Cantidad -->
                <div class="col-md-3">
                    <div class="mb-1">
                        <label class="form-label text-muted">Cantidad</label>
                     <asp:TextBox ID="txtUnidades" runat="server" CssClass="form-control" TextMode="Number" Text="1"  />
                    </div>
                </div>




                       </div>


       <div class="row">
                <!-- Categoría -->
                <div class="col-md-6">
                    <div class="mb-2">
                        <label class="form-label text-muted">Categoría</label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                </div>

                <!-- Marca -->
                <div class="col-md-6">
                    <div class="mb-2">
                        <label class="form-label text-muted">Marca</label>
                        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                </div>
         </div>

              <div class="row">

                <!-- Productos con búsqueda -->
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
                       <label class="form-label text-muted">Errores Acá</label>
                          </div>
         <div class="row">    
                 <div class="col-md-6">
                         <asp:Button ID="btnAgregar" Text="Agregar Stock" runat="server" CssClass="btn btn-primary w-100" OnClick="btnAgregar_Click"/>
                      </div>
             <div class="col-md-6">
                    <asp:Button Text="Eliminar Stock" runat="server" CssClass="btn btn-danger w-100"/>       
            </div>
                </div>
<div class="row my-4"></div>
     </div>
                    <div class="col-md-4">
                    <div class="mb-1">
                    <label class="form-label text-muted">Stock</label>
                        <asp:GridView ID="TablaStock" runat="server" AutoGenerateColumns="False"
                                          CssClass="table table-striped table-bordered table-condensed gridview-compact"
                                          EnableSortingAndPagingCallbacks="false">
                            <Columns>
                                <asp:BoundField DataField="Talle" HeaderText="Talle" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width ="10%" />
                                <asp:BoundField DataField="Cantidad" HeaderText="Cantidad"  HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width ="10%" />
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width ="80%" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
       </div>                               

<script type="text/javascript">
    function initTomSelects() {
        new TomSelect("#<%= productoSeleccionado.ClientID %>",
        {
            maxItems: 1,
            plugins: [],
            create: true,
            onChange: function (value)
            {
                this.close();

                if (value.length != 0)
                {
                    __doPostBack('<%= productoSeleccionado.ClientID %>', '');
                }
            },
            onDropdownOpen: function ()
            {
                if (this.items.length > 0)
                {
                    this.focus();
                }
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

        var tsTalles2 = new TomSelect("#<%= ddlTalles2.ClientID %>", {
            plugins: ['remove_button'],
            create: false,
            maxItems: null,
            onItemAdd: function () {
                this.setTextboxValue('');
                this.refreshOptions();
            },
            render: {
                option: function (data, escape) {
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

    // Llamada inicial cuando la página se carga por primera vez
    document.addEventListener("DOMContentLoaded", function () {
        initTomSelects();
    });

    // Vuelve a aplicar TomSelect después de un postback parcial del UpdatePanel
    Sys.Application.add_load(function () {
        initTomSelects();
    });
</script>

        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>