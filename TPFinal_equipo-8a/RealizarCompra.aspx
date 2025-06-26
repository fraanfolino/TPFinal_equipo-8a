<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RealizarCompra.aspx.cs" Inherits="TPFinal_equipo_8a.RealizarCompra" %>

<!DOCTYPE html>
<html>
<head runat="server">
  <title>Realizar compra</title>
  <meta charset="utf-8" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
  <form id="form1" runat="server">
    <div class="container mt-5">

      
      <asp:Label ID="lblTitulo" runat="server" Text="Resumen de tu compra" CssClass="h2 d-block mb-4" />

    
      <asp:Repeater ID="rptItems" runat="server">
        <ItemTemplate>
          <div class="border rounded p-3 mb-3 shadow-sm">
            <asp:Label runat="server" Text='<%# Eval("Producto.Nombre") %>' CssClass="fw-bold d-block" />
            <asp:Label runat="server" Text='<%# "Talle: " + Eval("Producto.Talle.Etiqueta") %>' CssClass="d-block" />
            <asp:Label runat="server" Text='<%# "Precio unitario: $" + Eval("Producto.Precio", "{0:N2}") %>' CssClass="d-block" />
            <asp:Label runat="server" Text='<%# "Cantidad: " + Eval("Cantidad") %>' CssClass="d-block" />
            <asp:Label runat="server" Text='<%# "Subtotal: $" + ((Dominio.ItemCarrito)Container.DataItem).Precio().ToString("N2") %>' CssClass="fw-bold d-block text-end" />
          </div>
        </ItemTemplate>
      </asp:Repeater>

 
     
     
        <div class="mb-3">
          <asp:Label ID="lblFormaPagoTitulo" runat="server" Text="Forma de pago:" CssClass="form-label d-block fw-bold" />
          <asp:DropDownList 
            ID="ddlFormaPago" runat="server"
            AutoPostBack="true"
            CssClass="form-select"
            OnSelectedIndexChanged="ddlFormaPago_SelectedIndexChanged" />
        </div>
        <asp:Label ID="lblTotalFinalTitulo" runat="server" Text="Total con ajuste:" CssClass="fw-bold d-block mb-1" />
        <asp:Label ID="lblTotalFinal" runat="server" CssClass="fw-bold fs-5 d-block" />
     

      
      <div class="mt-4">
        <asp:Button 
          ID="btnConfirmar" runat="server" 
          Text="Confirmar compra" 
          CssClass="btn btn-success"
          OnClick="btnConfirmar_Click" />
      </div>

      
      

    </div>
  </form>
</body>
</html>