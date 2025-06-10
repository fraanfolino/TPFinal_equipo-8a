<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CargarProductos.aspx.cs" Inherits="TPFinal_equipo_8a.CargarProductos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<h2>
<asp:Label ID="Titulo" runat="server" Text="Cargar Productos" />
</h2>






    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-md-4">

                    <!-- Categoría -->
                    <div class="mb-3">
                        <label class="form-label">Categoría</label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" />
                    </div>

                    <!-- Marca -->
                    <div class="mb-3">
                        <label class="form-label">Marca</label>
                        <asp:DropDownList ID="ddlMarca" runat="server" CssClass="form-select" />
                    </div>

                    <!-- Nombre -->
                    <div class="mb-3">
                        <label class="form-label">Nombre</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" />
                    </div>

                    <!-- Descripción -->
                    <div class="mb-3">
                        <label class="form-label">Descripción</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                    </div>

                    <!-- Precio -->
                    <div class="mb-3">
                        <label class="form-label">Precio</label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" />
                    </div>

                    <!-- Imagen URL -->
                    <div class="mb-3">
                        <label class="form-label">Imagen URL</label>
                        <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control" />
                    </div>

                    <!-- Botones -->
                    <div class="mb-3">
                        <asp:Button ID="Button1" runat="server" Text="Guardar" CssClass="btn btn-primary me-2" />
                        <a href="Catalogo.aspx" class="btn btn-secondary">Cancelar</a>
                    </div>

                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>


