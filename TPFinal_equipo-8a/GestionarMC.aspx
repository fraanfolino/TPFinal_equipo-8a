<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionarMC.aspx.cs" Inherits="TPFinal_equipo_8a.GestionarMC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
<h2>
    <asp:Label ID="Titulo" runat="server" Text="Categorias y Marcas" />
</h2>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

<style>
    .gridview-compact a {
    text-decoration: none !important;
}
</style>

<div class="row">

 
    
 <div class="col-md-3">
     <div class="row">
             <label class="form-label">Categorias</label>

         <div class="row"  style="margin: 0px">
            <a href="categoria.aspx" class="btn btn-secondary">Agregar Categoría</a>
    </div>
<div style="overflow-x:auto;">
<asp:GridView ID="dgvTablaCategorias"
              DataKeyNames="id"
              runat="server"
              AutoGenerateColumns="False"
              OnSelectedIndexChanged="dgvTablaCategorias_SelectedIndexChanged"
              AutoPostBack="true"
              CssClass="table table-striped table-bordered table-condensed gridview-compact"
              EnableSortingAndPagingCallbacks="false">
    <Columns>


<asp:TemplateField HeaderText="Nombre">
    <ItemTemplate>
        <span class='<%# (bool)Eval("activo") ? "text-success bi bi-check-circle-fill" : "text-danger bi bi-x-circle-fill" %>'></span>
          <%# Eval("nombre") %>
    </ItemTemplate>
</asp:TemplateField>

        <asp:BoundField DataField="tipotalle" HeaderText="Tipo de talles"
                        HeaderStyle-HorizontalAlign="Center" 
                        ItemStyle-Width="40%" />

        <asp:CommandField HeaderText="✏️"
                          ShowSelectButton="true" 
                          SelectText="📝" 
                          HeaderStyle-HorizontalAlign="Center"
                          ItemStyle-HorizontalAlign="Center"
                          ItemStyle-Width="1%" />
    </Columns>
</asp:GridView>
</div>

   </div>

    <div class="row" style="height: 35px;"></div>
     </div>


 <div class="col-md-3">

<div class="row">
         <label class="form-label">Marcas</label>
             <div class="row"  style="margin: 0px">
             <a href="marca.aspx" class="btn btn-secondary">Agregar Marca</a>

    </div>
<asp:GridView ID="dgvTablaMarcas"
              DataKeyNames="id"
              runat="server"
              AutoGenerateColumns="False"
              OnSelectedIndexChanged="dgvTablaMarcas_SelectedIndexChanged"
              AutoPostBack="true"
              CssClass="table table-striped table-bordered table-condensed gridview-compact"
              EnableSortingAndPagingCallbacks="false">
    <Columns>
        <asp:TemplateField HeaderText="Nombre">
            <ItemTemplate>
                <span class='<%# (bool)Eval("activo") ? "text-success bi bi-check-circle-fill" : "text-danger bi bi-x-circle-fill" %>'></span>
                  <%# Eval("nombre") %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:CommandField HeaderText="✏️"
                          ShowSelectButton="true" 
                          SelectText="📝" 
                          HeaderStyle-HorizontalAlign="Center"
                          ItemStyle-HorizontalAlign="Center"
                          ItemStyle-Width="2%" />
    </Columns>
</asp:GridView>
        </div>
     
        <div class="row" style="height: 35px;"></div>
  </div>

 <div class="col-md-3">

<div class="row">
         <label class="form-label">Tipos de Talles</label>
                 <div class="row"  style="margin: 0px">

     <a href="talle.aspx" class="btn btn-secondary">Agregar Tipo</a>


    </div>
     <asp:GridView ID="dgvTablaTalles"
              DataKeyNames="id"
              runat="server"
              AutoGenerateColumns="False"
              OnSelectedIndexChanged="dgvTablaTalles_SelectedIndexChanged"
              AutoPostBack="true"
              CssClass="table table-striped table-bordered table-condensed gridview-compact"
              EnableSortingAndPagingCallbacks="false">
    <Columns>
        <asp:BoundField DataField="Tipo de talle" HeaderText="Nombre" 
                        HeaderStyle-HorizontalAlign="Center" 
                        ItemStyle-Width="45%" />
                <asp:BoundField DataField="Etiquetas" HeaderText="Talle" 
                        HeaderStyle-HorizontalAlign="Center" 
                        ItemStyle-Width="45%" />
        <asp:CommandField HeaderText="✏️"
                          ShowSelectButton="true" 
                          SelectText="📝" 
                          HeaderStyle-HorizontalAlign="Center"
                          ItemStyle-HorizontalAlign="Center"
                          ItemStyle-Width="2%" />
    </Columns>
</asp:GridView>
       </div>
    


    </div>
 


    </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
