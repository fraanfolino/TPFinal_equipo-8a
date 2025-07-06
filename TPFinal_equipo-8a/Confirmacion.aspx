<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmacion.aspx.cs" Inherits="TPFinal_equipo_8a.Confirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Confirmación del Pedido</h4>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <asp:Label ID="lblClienteTitulo" runat="server" Text="Cliente:" CssClass="form-label fw-bold" />
                <asp:Label ID="lblCliente" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPagoTitulo" runat="server" Text="Forma de pago:" CssClass="form-label fw-bold" />
                <asp:Label ID="lblPago" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblEstadoTitulo" runat="server" Text="Estado:" CssClass="form-label fw-bold" />
                <asp:Label ID="lblEstado" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblFechaTitulo" runat="server" Text="Fecha:" CssClass="form-label fw-bold" />
                <asp:Label ID="lblFecha" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblTotalTitulo" runat="server" Text="Total:" CssClass="form-label fw-bold" />
                <asp:Label ID="lblTotal" runat="server" CssClass="form-control text-success fw-bold" />
            </div>
        </div>
    </div>

    <div class="mt-4">
        <asp:Label runat="server" Text="Productos comprados:" CssClass="h5 d-block mb-3 fw-bold" />
        <asp:Repeater ID="repDetalles" runat="server">
            <ItemTemplate>
                <div class="card mb-3 border shadow-sm">
                    <div class="card-body">
                        <asp:Label runat="server" Text="Producto:" CssClass="form-label fw-bold" />
                        <asp:Label runat="server" Text='<%# Eval("NombreProducto") %>' CssClass="form-control mb-2" />

                        <asp:Label runat="server" Text="Talle:" CssClass="form-label fw-bold" />
                        <asp:Label runat="server" Text='<%# Eval("TalleEtiqueta") %>' CssClass="form-control mb-2" />

                        <asp:Label runat="server" Text="Cantidad:" CssClass="form-label fw-bold" />
                        <asp:Label runat="server" Text='<%# Eval("Cantidad") %>' CssClass="form-control mb-2" />

                        <asp:Label runat="server" Text="Precio Unitario:" CssClass="form-label fw-bold" />
                        <asp:Label runat="server" Text='<%# Eval("PrecioUnitario", "{0:C2}") %>' CssClass="form-control mb-2" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="text-center mt-4">
        <a href="Catalogo.aspx" class="btn btn-outline-primary">Volver al Catálogo</a>
    </div>
</div>

</asp:Content>
