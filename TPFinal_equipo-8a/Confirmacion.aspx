<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmacion.aspx.cs" Inherits="TPFinal_equipo_8a.Confirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<div class="container mt-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">Confirmación del Pedido</h4>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <asp:Label ID="lblCliente" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblPago" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblEstado" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblFecha" runat="server" CssClass="form-control" />
            </div>
            <div class="mb-3">
                <asp:Label ID="lblTotal" runat="server" CssClass="form-control text-success font-weight-bold" />
            </div>
        </div>
    </div>

    <div class="mt-4">
        <asp:Repeater ID="repDetalles" runat="server">
            <ItemTemplate>
                <div class="card mb-3 border shadow-sm">
                    <div class="card-body">
                        <asp:Label runat="server" Text='<%# Eval("NombreProducto") %>' CssClass="d-block mb-2 form-control" />
                        <asp:Label runat="server" Text='<%# Eval("TalleEtiqueta") %>' CssClass="d-block mb-2 form-control" />
                        <asp:Label runat="server" Text='<%# Eval("Cantidad") %>' CssClass="d-block mb-2 form-control" />
                        <asp:Label runat="server" Text='<%# Eval("PrecioUnitario", "{0:C2}") %>' CssClass="d-block mb-2 form-control" />
                       
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

    <div class="text-center mt-4">
        <asp:HyperLink ID="lnkVolver" runat="server" CssClass="btn btn-outline-primary" NavigateUrl="Catalogo.aspx" Text="Volver al Catálogo" />
    </div>
</div>

</asp:Content>
