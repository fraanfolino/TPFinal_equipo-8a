<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Marca.aspx.cs" Inherits="TPFinal_equipo_8a.Marca" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h2>
    <asp:Label ID="Titulo" runat="server" Text="Marca" />
</h2>


        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

            <div class="row" style="height: 2rem;">
                 <asp:Label ID="Subtitulo" class="form-label" runat="server">Agregar Marca</asp:Label>
            </div>
      <div class="row">


<div class="row">
    <div class="col-md-3">

        <div class="mb-2">
            <label class="form-label text-muted">Nombre</label>
            <asp:TextBox ID="txtNombreMarca" runat="server" CssClass="form-control" Style="width: 100%; max-width: none;"/>
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
</div>

     </div>





        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

