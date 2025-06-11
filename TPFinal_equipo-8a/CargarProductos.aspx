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
  max-height: 4.375rem;
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

</style>
<h2>
    <asp:Label ID="Titulo" runat="server" Text="Cargar Productos" />
</h2>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

            <div class="row" style="height: 2rem;">
                 <label class="form-label">Agregar Stock a Productos Existentes</label>
                 </div>


            <div class="row" style="height: 9rem;">
                <!-- Cantidad -->
                <div class="col-md-1">
                    <div class="mb-1">
                        <label class="form-label text-muted">Cantidad</label>
                     <asp:TextBox ID="txtUnidades" runat="server" CssClass="form-control" TextMode="Number" Text="1"  />
                    </div>
                </div>

                <!-- Categoría -->
                <div class="col-md-2">
                    <div class="mb-2">
                        <label class="form-label text-muted">Categoría</label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                </div>

                <!-- Marca -->
                <div class="col-md-2">
                    <div class="mb-2">
                        <label class="form-label text-muted">Marca</label>
                        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                </div>

                <!-- Productos con búsqueda -->
                <div class="col-md-5">
                    <div class="mb-5">
                        <label for="<%= productoSeleccionado.ClientID %>" class="form-label text-muted">Productos</label>
                        <select id="productoSeleccionado" runat="server"></select>
                    </div>
                </div>

                <div class="col-md-2">
                    <div class="mb-2">
                        <label for="<%= ddlTalles.ClientID %>" class="form-label text-muted">Talles</label>
                        <select id="ddlTalles" runat="server" multiple></select>
                    </div>
                </div>
   </div>

                 <div class="row" style="height: 2rem;">
                 <label class="form-label">Agregar Nuevo Producto</label>
                 </div>

                        <div class="row" style="height: 9rem;">
                <!-- Cantidad -->
                <div class="col-md-1">
                    <div class="mb-1">
                        <label class="form-label text-muted">Cantidad</label>
                     <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Number" Text="1"  />
                    </div>
                </div>

                <!-- Categoría -->
                <div class="col-md-2">
                    <div class="mb-2">
                        <label class="form-label text-muted">Categoría</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                </div>

                <!-- Marca -->
                <div class="col-md-2">
                    <div class="mb-2">
                        <label class="form-label text-muted">Marca</label>
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlMarca_SelectedIndexChanged" AutoPostBack="true" />
                    </div>
                </div>

                <!-- Nombre Producto -->
                <div class="col-md-4">
                    <div class="mb-4">
                         <label class="form-label text-muted">Nombre</label>
                 <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="SingleLine"/>
                    </div>
                </div>













           </div>















<script type="text/javascript">
    function initTomSelects() {
        new TomSelect("#<%= productoSeleccionado.ClientID %>", {
            maxItems: 1,
            plugins: [],
            create: false,
            onChange: function (value) {
                this.close();
            },
            onDropdownOpen: function () {
                if (this.items.length > 0) {
                    this.clear();
                    this.focus();
                }
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

        var tsTalles = new TomSelect("#<%= ddlTalles.ClientID %>", {
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

        // Le asignas altura directamente al wrapper generado:
        tsTalles.control.style.height = '6rem';
        tsTalles.control.style.maxHeight = '6rem';
        tsTalles.control.style.fontSize = '0.75rem';
        tsTalles.control.querySelector('input').style.caretColor = 'transparent';
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