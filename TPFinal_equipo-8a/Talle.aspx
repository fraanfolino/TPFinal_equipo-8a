<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Talle.aspx.cs" Inherits="TPFinal_equipo_8a.Talle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h2>
    <asp:Label ID="Titulo" runat="server" Text="Talle" />
</h2>


        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
<style>
    .gridview-compact a {
    text-decoration: none !important;
}
</style>
            <div class="row" style="height: 2rem;">
                 <asp:Label ID="Subtitulo" class="form-label" runat="server">Agregar Talle</asp:Label>
            </div>
      <div class="row">


<div class="row">
    <div class="col-md-3">

        <div class="mb-2">
            <label class="form-label text-muted">Nombre</label>
            <asp:TextBox ID="txtNombreTalle" runat="server" CssClass="form-control" Style="width: 100%; max-width: none;"/>
        </div>


    <div class="mb-2">
            <label class="form-label text-muted">Agregar Etiquetas</label>

               <div class="d-flex gap-2">

        <asp:TextBox ID="txtNuevoTalle" runat="server" CssClass="form-control"/>
        <asp:Button ID="btnAgregarTalle" runat="server" Text="+" OnClick="btnAgregarTalle_Click" CssClass="btn btn-primary" />
        </div>
    </div>

        
<div class="d-flex gap-2">
    <asp:Button ID="btnAgregar" Text="Agregar" runat="server" CssClass="btn btn-secondary flex-fill" OnClick="btnAgregar_Click" />
    <asp:Button ID="btnModificar" Text="Modificar" runat="server" CssClass="btn btn-secondary flex-fill" OnClick="btnModificar_Click" />
    <asp:Button ID="btnDesactivar" Text="Desactivar" runat="server" CssClass="btn btn-danger flex-fill" OnClick="btnDesactivar_Click" />
    <asp:Button ID="btnActivar" Text="Activar" runat="server" CssClass="btn btn-success flex-fill" OnClick="btnActivar_Click" />
    <asp:Button ID="btnVolver" Text="Volver" runat="server" CssClass="btn btn-secondary flex-fill" OnClick="btnVolver_Click" />
</div>

<div class="d-flex gap-2 mt-2">
    <div id="alertDiv" runat="server" class="alert alert-secondary w-100 py-1 px-2" role="alert"  style="padding-top: 2px; padding-bottom: 2px;">
    </div>     
</div>

</div>
<div class="col-md-3">
<asp:GridView ID="GridTalles" runat="server" 
              AutoGenerateColumns="False"
              CssClass="table table-striped table-bordered table-condensed gridview-compact"
              OnRowCommand="GridTalles_RowCommand"
              ShowHeader="true">
    <Columns>
        <asp:TemplateField HeaderText="Etiquetas">
            <ItemTemplate>
                <%# Container.DataItem.ToString() %>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
            <ItemTemplate>
                <asp:LinkButton ID="btnEliminar" runat="server" 
                                CommandName="Eliminar" 
                                CommandArgument='<%# Container.DataItemIndex %>'
                                ToolTip="Eliminar">❌
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
</div>

















</div>

     </div>
        </ContentTemplate>
            <Triggers>
    <asp:AsyncPostBackTrigger ControlID="btnAgregar" EventName="Click" />
</Triggers>
    </asp:UpdatePanel>
</asp:Content>
