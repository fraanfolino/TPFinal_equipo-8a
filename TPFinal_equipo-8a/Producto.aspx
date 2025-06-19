<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Producto.aspx.cs" Inherits="TPFinal_equipo_8a.Agregar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

<h2>
    <asp:Label ID="Titulo" runat="server" Text="Agregar Producto" />
</h2>

<asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>

<div class="row">
 <div class="col-md-5">
      <div class="row">
                <div class="col-md-5">
                    <div class="mb-2">
                        <label class="form-label text-muted">Categoría</label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" AutoPostBack="true" />
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="mb-2">
                        <label class="form-label text-muted">Marca</label>
                        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" AutoPostBack="true" />
                    </div>
                </div>
         </div>

              <div class="row">
                <div class="col-md-10">
                    <div class="mb-2">
                        <label class="form-label text-muted">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Style="width: 100%; max-width: none;" ></asp:TextBox>
                    </div>
                </div>
            </div>


            <div class="row">
                <div class="col-md-10">
                    <div class="mb-2">
                        <label class="form-label text-muted">Descripcion</label>
                        <asp:TextBox ID="txtDescripcion" 
                                     runat="server"
                                     TextMode="MultiLine"
                                     Rows="2"
                                     CssClass="form-control"
                                     Style="width: 100%; max-width: none;" />
                    </div>
                </div>
     </div>

      <div class="row">
                   <div class="col-md-10">
                       <label class="form-label text-muted">Agregar Imagenes</label>
                    <div class="input-group mb-2">
                     <asp:TextBox ID="txtImagen" runat="server" CssClass="form-control" Style="width: 70%; max-width: none;" ></asp:TextBox>
                      <button class="btn btn-outline-secondary" type="button" id="button-addon2" onclick="agregarImagen()">Agregar</button>
                    </div>
                        <asp:HiddenField ID="hfImagenes" runat="server" />
                    </div>
     </div>

                        <div class="row">
                <div class="col-md-5">
                    <div class="mb-2">
                        <label class="form-label text-muted">Precio</label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" Style="width: 100%; max-width: none;"></asp:TextBox>
                    </div>
                </div>
     </div>



    <div class="row" style="height: 40px;">
                        <div class="col-md-10">
                        <div class="mb-2">
                           <asp:Label ID="errorMensaje" runat="server" class="alert-danger"></asp:Label>
                           <asp:Label ID="exitoMensaje" runat="server" class="alert-success"></asp:Label>
                        </div>
                    </div>
            </div>

         <div class="row">    
                 <div class="col-md-5">
                         <asp:Button ID="btnAgregar" Text="Agregar Producto" runat="server" CssClass="btn btn-primary w-100" OnClick="btnAgregar_Click"/>
                         <asp:Button ID="btnModificar" Text="Modificar Producto" runat="server" CssClass="btn btn-primary w-100" OnClick="btnModificar_Click"/>
                      </div>
                </div>
     </div>


    <div class="col-md-4">
          <div class="row">
                <div class="col-md-12">
                    <div class="mb-2">
                        <label class="form-label text-muted">Imagenes</label>
                    </div>
                </div>
         </div>


           <div class="row">
    <div class="mb-2">
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
                             style="max-height: 250px; min-height: 150px; object-fit: contain;" />
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
    <div class="row">
 <div class="col-md-12">

<ul class="list-group" id="listaImagenes">
<asp:Repeater ID="rptImagenesLista" runat="server">
    <ItemTemplate>
        <li class="list-group-item d-flex justify-content-between align-items-center small overflow-hidden text-truncate"
            style="max-width: 100%;" data-index='<%# Container.ItemIndex %>'>
            <span class="text-truncate d-inline-block me-2" style="max-width: 90%;">
                <%# Container.DataItem %>
            </span>
            <button type="button" class="btn btn-sm btn-danger" onclick="eliminarImagen(this)">×</button>
        </li>
    </ItemTemplate>
</asp:Repeater>
</ul>
</div>
</div>
</div>
</div>                     
</ContentTemplate>
</asp:UpdatePanel>

<script>
    function handleImageError(img)
    {
        if (!img.dataset.fallback)
        {
        img.dataset.fallback = "true";
        img.src = 'Images/error.png';
        }
    }

    function agregarImagen()
    {
        const txtImagen = document.getElementById('<%= txtImagen.ClientID %>');
        const valor = txtImagen.value.trim();
        if (valor === "") return;
        const li = document.createElement("li");
        li.className = "list-group-item d-flex justify-content-between align-items-center small overflow-hidden text-truncate";
        li.style.maxWidth = "100%";
        li.innerHTML = `<span class="text-truncate d-inline-block me-2" style="max-width: 90%;">${valor}</span><button type="button" class="btn btn-sm btn-danger" onclick="eliminarImagen(this)">×</button>`;
        document.getElementById("listaImagenes").appendChild(li);
            txtImagen.value = "";
        __doPostBack('<%= UpdatePanel2.UniqueID %>', `AGREGAR_IMAGEN:${valor}`);
        txtImagen.value = "";Imagen.value = "";nt.getElementById("listaImagenes").appendChild(li);
        txtImagen.value = "";
    }

    function eliminarImagen(boton)
    {
        boton.parentElement.remove()
        const listItem = boton.closest('li');
        const index = listItem.dataset.index;
        __doPostBack('<%= UpdatePanel2.UniqueID %>', `ELIMINAR_IMAGEN:${index}`);
    }

    function prepararEnvio()
    {
        const imagenes = [];
        document.querySelectorAll('#listaImagenes li span').forEach(span => { imagenes.push(span.textContent.trim()); });
        document.getElementById('<%= hfImagenes.ClientID %>').value = JSON.stringify(imagenes);
        return true;
    }

</script>
</asp:Content>
