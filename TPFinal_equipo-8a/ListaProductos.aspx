<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListaProductos.aspx.cs" Inherits="TPFinal_equipo_8a.ListaProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">




    <h2>
    <asp:Label ID="Titulo" runat="server" Text="Marca" />
</h2>


        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="row" style="height: 2rem;">
                 <asp:Label class="form-label" runat="server">Productos</asp:Label>
            </div>
      <div class="row">


<div class="row">
    <div class="col-md-12">

        <div class="mb-2">
            <label class="form-label text-muted">Nombre</label>
            <asp:TextBox ID="txtNombreMarca" runat="server" CssClass="form-control" Style="width: 100%; max-width: none;"/>
        </div>



                <div class="mb-2">




    <asp:GridView ID="dgvlistaProductos" runat="server" 
                  DataKeyNames="Id"
                  CssClass= "table table-striped table-bordered table-condensed" 
                  AutoGenerateColumns="false"
                  OnSelectedIndexChanged="dgvlistaProductos_SelectedIndexChanged"
                  OnPageIndexChanging="dgvlistaProductos_PageIndexChanging"
                  EnableSortingAndPagingCallbacks="false"
                  AllowPaging="True"
                  AllowSorting="True"
                  PageSize="10"
                  OnSorting="dgvlistaProductos_Sorting"
                  >
            <PagerStyle CssClass="pagination1" />
            <Columns>
            <asp:BoundField HeaderText="ID"            DataField="Id" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%" SortExpression="Id"/>
            <asp:BoundField HeaderText="Nombre"        DataField="Nombre" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width="15%" SortExpression="Nombre" />
            <asp:BoundField HeaderText="Categoria"     DataField="Categoria.Nombre" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width ="15" SortExpression="Categoria"/>
            <asp:BoundField HeaderText="Marca"         DataField="Marca.Nombre" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width ="15%" SortExpression="Marca"/>
            <asp:BoundField HeaderText="Descripcion"   DataField="Descripcion" HeaderStyle-HorizontalAlign="Center" ItemStyle-Width ="48"/>

  <%--          <asp:CheckBoxField HeaderText="Estado"     DataField="artestado" ItemStyle-HorizontalAlign="Center"  ItemStyle-Width ="3%" SortExpression="artestado"/>--%>
            <asp:CommandField HeaderText="✏️"          ShowSelectButton="true" SelectText="📝​" ItemStyle-Width="2%" />

            </Columns>

    </asp:GridView>







        </div>















<div class="d-flex gap-2">
    <asp:Button ID="btnAgregar" Text="Agregar" runat="server" CssClass="btn btn-secondary flex-fill" />
    <asp:Button ID="btnModificar" Text="Modificar" runat="server" CssClass="btn btn-secondary flex-fill"/>
    <asp:Button ID="btnDesactivar" Text="Desactivar" runat="server" CssClass="btn btn-danger flex-fill" />
    <asp:Button ID="btnActivar" Text="Activar" runat="server" CssClass="btn btn-success flex-fill"/>
    <asp:Button ID="btnVolver" Text="Volver" runat="server" CssClass="btn btn-secondary flex-fill"/>
</div>

<div class="d-flex gap-2 mt-2">
    <div id="alertDiv" runat="server" class="alert alert-secondary w-100 py-1 px-2" role="alert"  style="padding-top: 2px; padding-bottom: 2px;">
    </div>     
</div>
    </div>
</div>

     </div>





        </ContentTemplate>
    </asp:UpdatePanel>










</asp:Content>
