<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GestionarMC.aspx.cs" Inherits="TPFinal_equipo_8a.GestionarMC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

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

<asp:GridView ID="dgvTablaCategorias"
              DataKeyNames="id"
              runat="server"
              AutoGenerateColumns="False"
              OnSelectedIndexChanged="dgvTablaCategorias_SelectedIndexChanged"
              AutoPostBack="true"
              CssClass="table table-striped table-bordered table-condensed gridview-compact"
              EnableSortingAndPagingCallbacks="false">
    <Columns>
        <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                        HeaderStyle-HorizontalAlign="Center" 
                      
                        ItemStyle-Width="50%" />
        
        <asp:BoundField DataField="tipotalle" HeaderText="Tipo de talles"
                        HeaderStyle-HorizontalAlign="Center" 
                       
                        ItemStyle-Width="48%" />

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
         <label class="form-label">Marcas</label>
             <div class="row"  style="margin: 0px">
<asp:Button ID="Button2"
            Text="Agregar Marca"
            runat="server"
            CssClass="btn btn-secondary" />
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
        <asp:BoundField DataField="nombre" HeaderText="Nombre" 
                        HeaderStyle-HorizontalAlign="Center" 
                      
                        ItemStyle-Width="98%" />

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
<asp:Button ID="Button4"
            Text="Agregar Tipo"
            runat="server"
            CssClass="btn btn-secondary" />
    </div>
     <asp:GridView ID="dgvTablaTalles"
              DataKeyNames="id"
              runat="server"
              AutoGenerateColumns="False"
              OnSelectedIndexChanged="dgvTablaMarcas_SelectedIndexChanged"
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
