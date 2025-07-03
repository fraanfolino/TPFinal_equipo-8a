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
          <div class="border border-secondary rounded p-3 mb-4 bg-white shadow-sm">

               <asp:Image 
      runat="server" 
      ImageUrl='<%# ((Dominio.ItemCarrito)Container.DataItem).Producto.ImagenUrl.FirstOrDefault() ?? "~/img/no-disponible.png" %>' 
      CssClass="img-thumbnail me-3"
      Width="100" Height="100" />
            <asp:Label runat="server" Text='<%# Eval("Producto.Nombre") %>' CssClass="fw-bold d-block" />
            <asp:Label runat="server" Text='<%# "Talle: " + Eval("Producto.Talle.Etiqueta") %>' CssClass="d-block" />
            <asp:Label runat="server" Text='<%# "Precio unitario: $" + Eval("Producto.Precio", "{0:N2}") %>' CssClass="d-block" />
            <asp:Label runat="server" Text='<%# "Cantidad: " + Eval("Cantidad") %>' CssClass="d-block" />
           <div class="bg-light p-2 rounded d-flex justify-content-between align-items-center mt-2">
           <asp:Label runat="server" Text="Subtotal:" CssClass="fw-semibold" />
           <asp:Label 
               runat="server" 
    Text='<%# "$" + ((Dominio.ItemCarrito)Container.DataItem).Precio().ToString("N2") %>' 
    CssClass="fw-bold text-success" />
</div>
          </div>
        </ItemTemplate>
      </asp:Repeater>

 
     
     
        <div class="mb-3">
            <asp:Label ID="lblErrorStock" runat="server" ForeColor="Red" Visible="false" />
           <asp:Label ID="lblError" runat="server" CssClass="alert alert-danger" Visible="false"></asp:Label>
            <asp:Button ID="btnRevisarCarrito" runat="server" Text="Volver al carrito" CssClass="btn btn-warning" OnClick="btnRevisarCarrito_Click" />


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