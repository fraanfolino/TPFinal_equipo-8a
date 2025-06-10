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

</style>
<h2>
    <asp:Label ID="Titulo" runat="server" Text="Cargar Productos" />
</h2>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="row">
                <!-- Cantidad -->
                <div class="col-md-1">
                    <div class="mb-1">
                        <label class="form-label">Cantidad</label>
                     <asp:TextBox ID="txtUnidades" runat="server" CssClass="form-control" TextMode="Number" Text="1"  />
                    </div>
                </div>

                <!-- Categoría -->
                <div class="col-md-2">
                    <div class="mb-2">
                        <label class="form-label">Categoría</label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" />
                    </div>
                </div>

                <!-- Marca -->
                <div class="col-md-2">
                    <div class="mb-2">
                        <label class="form-label">Marca</label>
                        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" />
                    </div>
                </div>

                <!-- Productos con búsqueda -->
                <div class="col-md-3">
                    <div class="mb-3">
                        <label for="<%= productoSeleccionado.ClientID %>" class="form-label">Productos</label>
                        <select id="productoSeleccionado" runat="server"></select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="mb-3">
                        <label for="<%= ddlTalles.ClientID %>" class="form-label">Talles</label>
                        <select id="ddlTalles" runat="server" multiple></select>
                    </div>
                </div>
   </div>



<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function () {
        new TomSelect("#<%= productoSeleccionado.ClientID %>", {
            maxItems: 1,
            plugins: [],
            create: false,
            onChange: function (value) {
                this.close(); // Cierra el dropdown al seleccionar un ítem
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

        new TomSelect("#<%= ddlTalles.ClientID %>", {
            plugins: ['remove_button'],  // Esto activa el botón para eliminar items
            create: false,                // Si querés permitir crear opciones nuevas (opcional)
            maxItems: null,             // Permite seleccionar múltiples sin límite
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
  });
</script>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>