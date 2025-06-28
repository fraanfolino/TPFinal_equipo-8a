<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Confirmacion.aspx.cs" Inherits="TPFinal_equipo_8a.Confirmacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



     <asp:Panel ID="pnlConfirmacion" runat="server" style="max-width: 600px; margin: 0 auto; padding: 30px; border: 1px solid #ccc; border-radius: 10px; background-color: #fefefe;">
        <asp:Label ID="lblTitulo" runat="server" Text="¡Gracias por tu compra!" CssClass="titulo" />

        <asp:Repeater ID="repDetalles" runat="server">
            <ItemTemplate>
                <asp:Panel runat="server" style="margin-bottom: 20px;">
                    <asp:Label runat="server" Text="Producto: " />
                    <asp:Label runat="server" Text='<%# Eval("Producto.Nombre") %>' /><br />

                    <asp:Label runat="server" Text="Talle: " />
                    <asp:Label runat="server" Text='<%# Eval("Producto.Talle.Etiqueta") %>' /><br />

                    <asp:Label runat="server" Text="Cantidad: " />
                    <asp:Label runat="server" Text='<%# Eval("Cantidad") %>' /><br />

                    <asp:Label runat="server" Text="Precio unitario: " />
                    <asp:Label runat="server" Text='<%# String.Format("{0:C2}", Eval("Producto.Precio")) %>' /><br />

                    <asp:Label runat="server" Text="Subtotal: " />
                    <asp:Label runat="server" Text='<%# String.Format("{0:C2}", (Convert.ToDecimal(Eval("Producto.Precio")) * Convert.ToInt32(Eval("Cantidad")))) %>' />


      

                </asp:Panel>

            </ItemTemplate>
        </asp:Repeater>



                  <asp:Label ID="lblFechaTitulo" runat="server" Text="Fecha del pedido: " />
                  <asp:Label ID="lblFecha" runat="server"  />


                 <asp:Label ID="lblMetodoPagoTitulo" runat="server" Text="Método de pago: " />
                 <asp:Label ID="lblMetodoPago" runat="server" />

                <asp:Label ID="lblTotalTitulo" runat="server" Text="Total: " />
                <asp:Label ID="lblTotal" runat="server" Font-Bold="true" Font-Size="Large" />
        </asp:Panel>

</asp:Content>
