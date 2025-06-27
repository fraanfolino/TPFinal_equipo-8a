<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Categoria.aspx.cs" Inherits="TPFinal_equipo_8a.Categoria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />

<h2>
    <asp:Label ID="Titulo" runat="server" Text="Categoria" />
</h2>


        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="row" style="height: 2rem;">
                 <asp:Label ID="Subtitulo" class="form-label" runat="server">Agregar Categoria</asp:Label>
            </div>
      <div class="row">


<div class="row">
    <div class="col-md-3">

        <div class="mb-2">
            <label class="form-label text-muted">Nombre</label>
            <asp:TextBox ID="txtNombreCategoria" runat="server" CssClass="form-control" Style="width: 100%; max-width: none;"/>
        </div>

        <div class="mb-2">
            <label class="form-label text-muted">Tipo de talles</label>
            <asp:DropDownList ID="ddlTipoTalle" runat="server" CssClass="form-select" AutoPostBack="true" Style="width: 100%; max-width: none;"/>
        </div>
<div class="d-flex gap-2">
    <asp:Button ID="btnAgregar" Text="Agregar" runat="server" CssClass="btn btn-secondary flex-fill" OnClick="btnAgregar_Click" />
    <asp:Button ID="btnModificar" Text="Modificar" runat="server" CssClass="btn btn-secondary flex-fill" OnClick="btnModificar_Click" />
    <asp:Button ID="btnEliminar" Text="Eliminar" runat="server" CssClass="btn btn-danger flex-fill" />
    <asp:Button ID="btnVolver" Text="Volver" runat="server" CssClass="btn btn-secondary flex-fill" OnClick="btnVolver_Click" />
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
