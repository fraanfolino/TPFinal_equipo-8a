<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="TPFinal_equipo_8a.ListaProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">    

    <h2>
    <asp:Label ID="Titulo" runat="server" Text="Productos" />
</h2>


<style>
    .gridview-compact a {
        text-decoration: none !important;
        background-color: transparent !important;
        border-bottom: none !important;
        color: black !important;
        text-decoration: none !important;
    }
</style>

<asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
<ContentTemplate>
 <div class="row">


<div class="row">
<div class="col-md-12">
  <div class="row align-items-end">

    <div class="col-md-12">
        <div class="mb-2">

    <div class="row">
        <div class="col-10">
            <label class="form-label text-muted">Buscar</label>
            <asp:TextBox ID="txtFiltro" runat="server" CssClass="form-control" Style="width: 100%; max-width: none;" OnTextChanged="txtFiltro_TextChanged" AutoPostBack="true" />
         </div>

         <div class="col-2">
                   <label class="form-label text-muted">Criterio</label>
                    <asp:DropDownList runat="server" AutoPostBack="true" CssClass="form-control" id="CriterioFRapido" DataTextField="Seleccione" OnSelectedIndexChanged="CriterioFRapido_SelectedIndexChanged">
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Categoria" />
                    <asp:ListItem Text="Marca" />
                    </asp:DropDownList>
          </div>
        </div>
        </div>
    </div>


  </div>
</div>



    <div class="col-md-12">
    <asp:GridView ID="dgvlistaProductos" runat="server" 
                  DataKeyNames="Id"
                  CssClass= "table table-striped table-bordered table-condensed gridview-compact" 
                  AutoGenerateColumns="false"
                  OnSelectedIndexChanged="dgvlistaProductos_SelectedIndexChanged"
                  OnPageIndexChanging="dgvlistaProductos_PageIndexChanging"
                  EnableSortingAndPagingCallbacks="false"
                  AllowPaging="True"
                  AllowSorting="True"
                  PageSize="10"
                  OnSorting="dgvlistaProductos_Sorting"
                  >
            <PagerStyle CssClass="pagination2" HorizontalAlign="Right" />
            <Columns>
            <asp:BoundField HeaderText="ID"        DataField="Id"               HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" SortExpression="Id"/>
            <asp:BoundField HeaderText="Categoria" DataField="Categoria.Nombre" HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" ItemStyle-Width="10" SortExpression="Categoria"/>
            <asp:BoundField HeaderText="Marca"     DataField="Marca.Nombre"     HeaderStyle-CssClass="text-center" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="10%" ItemStyle-Width="10"  SortExpression="Marca"/>
            <asp:BoundField HeaderText="Nombre"    DataField="Nombre"           HeaderStyle-CssClass="text-left" HeaderStyle-Width="15%" ItemStyle-Width="15%" SortExpression="Nombre" />
            <asp:BoundField HeaderText="Descripcion"   DataField="Descripcion"  HeaderStyle-CssClass="text-left" HeaderStyle-Width="46%" ItemStyle-Width="46%"/>
            <asp:TemplateField HeaderText="Precio" ItemStyle-HorizontalAlign="Right" HeaderStyle-CssClass="text-center" ItemStyle-Width="10%"  SortExpression="Precio">
                <ItemTemplate>
                    $ <%# Eval("Precio", "{0:N2}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="" ItemStyle-Width="2%">
                <ItemTemplate>
                    <span class='<%# (bool)Eval("Activo") ? "text-success bi bi-check-circle-fill" : "text-danger bi bi-x-circle-fill" %>'></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField HeaderText="✏️"          ShowSelectButton="true" SelectText="📝​" ItemStyle-Width="2%" />
               
                
<asp:TemplateField HeaderText="➕" ItemStyle-Width="2%">
    <ItemTemplate>
        <%# (bool)Eval("Activo") 
            ? $"<a href='CargarProductos.aspx?id={Eval("Id")}' class='bi bi-plus-circle-fill text-primary'></a>" 
            : "<span class='text-danger bi bi-x-circle-fill'></span>" %>
    </ItemTemplate>
</asp:TemplateField>


            </Columns>

    </asp:GridView>


<div class="row mb-2">
    <div class="col-12 d-flex justify-content-between align-items-end">
        <div>
            <a href="Producto.aspx" class="btn btn-secondary w-250">Agregar</a>
            <a href="CargarProductos.aspx" class="btn btn-secondary w-250">Cargar Stock</a>
        </div>
        <div class="d-flex align-items-center">
            <asp:Label Text="Cantidad por página" runat="server" CssClass="form-label mb-0 me-2" />
            <asp:TextBox runat="server" TextMode="Number" ID="Cantidadxpagina" 
                         CssClass="form-control" Width="75px" 
                         OnTextChanged="Cantidadxpagina_TextChanged" 
                         AutoPostBack="true" />
        </div>
    </div>
</div>









    </div>
</div>

     </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
