<%@ Page Title="Gestión de Pedidos"
    Language="C#"
    MasterPageFile="~/Site.Master"
    AutoEventWireup="true"
    CodeBehind="GestionarPedidos.aspx.cs"
    Inherits="TPFinal_equipo_8a.GestionarPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <asp:Panel runat="server" CssClass="container mt-4">
    <asp:Label runat="server" Text="Gestión de Pedidos" CssClass="h2 mb-4 d-block" />

                                                    <asp:Panel runat="server" CssClass="mb-3">
                                  <div class="form-check mb-1">
                                    <asp:CheckBox ID="chkPendiente" runat="server"
                                                  AutoPostBack="true"
                                                  OnCheckedChanged="chkEstado_CheckedChanged"
                                                  Text=""
                                                  CssClass="form-check-input" />
                                    <label class="form-check-label" for="chkPendiente">Pendiente</label>
                                  </div>

                                  <div class="form-check mb-1">
                                    <asp:CheckBox ID="chkConfirmado" runat="server"
                                                  AutoPostBack="true"
                                                  OnCheckedChanged="chkEstado_CheckedChanged"
                                                  Text=""
                                                  CssClass="form-check-input" />
                                    <label class="form-check-label" for="chkConfirmado">Confirmado</label>
                                  </div>

                                  <div class="form-check mb-1">
                                    <asp:CheckBox ID="chkEnviado" runat="server"
                                                  AutoPostBack="true"
                                                  OnCheckedChanged="chkEstado_CheckedChanged"
                                                  Text=""
                                                  CssClass="form-check-input" />
                                    <label class="form-check-label" for="chkEnviado">Enviado</label>
                                  </div>

                                  <div class="form-check mb-1">
                                    <asp:CheckBox ID="chkEntregado" runat="server"
                                                  AutoPostBack="true"
                                                  OnCheckedChanged="chkEstado_CheckedChanged"
                                                  Text=""
                                                  CssClass="form-check-input" />
                                    <label class="form-check-label" for="chkEntregado">Entregado</label>
                                  </div>

                                  <div class="form-check mb-1">
                                    <asp:CheckBox ID="chkCancelado" runat="server"
                                                  AutoPostBack="true"
                                                  OnCheckedChanged="chkEstado_CheckedChanged"
                                                  Text=""
                                                  CssClass="form-check-input" />
                                    <label class="form-check-label" for="chkCancelado">Cancelado</label>
                                  </div>
                                </asp:Panel>
   
   
    <asp:Repeater ID="repPedidos" runat="server" OnItemCommand="repPedidos_ItemCommand">
      <ItemTemplate>
        <asp:Panel runat="server" CssClass="card mb-3 shadow-sm">
          <asp:Panel runat="server" CssClass="card-body">

         
            <asp:Label runat="server" Text='<%# "Pedido #" + Eval("IdPedido") %>' CssClass="fw-bold d-block" />
            <asp:Label runat="server" Text='<%# "Cliente: " + Eval("NombreCliente") %>' CssClass="d-block" />
            <asp:Label runat="server" Text='<%# "Fecha: " + Eval("FechaCreacion", "{0:dd/MM/yyyy}") %>' CssClass="d-block" />
            <asp:Label runat="server" Text='<%# "Forma de Pago: " + Eval("FormaPago") %>' CssClass="d-block" />
            <asp:Label runat="server" Text='<%# "Total: " + Eval("Total", "{0:C2}") %>' CssClass="text-success fw-bold d-block mb-2" />

           
<asp:Label runat="server" 
           Text='<%# Eval("Estado") %>' 
           CssClass='<%# 
               Eval("Estado").ToString() == "Pendiente" ? "badge bg-warning text-dark mb-2" :
               Eval("Estado").ToString() == "Confirmado" ? "badge bg-success mb-2" :
               Eval("Estado").ToString() == "Enviado" ? "badge bg-primary mb-2" :
               Eval("Estado").ToString() == "Entregado" ? "badge bg-success mb-2" :
               "badge bg-secondary mb-2" %>' />

            
            <asp:Repeater ID="repItems" runat="server" DataSource='<%# Eval("Items") %>'>
              <ItemTemplate>
                <asp:Panel runat="server" CssClass="border-bottom py-2">
                  <asp:Label runat="server" Text='<%# "Producto: " + Eval("NombreProducto") %>' CssClass="fw-bold d-block" />
                  <asp:Label runat="server" Text='<%# "Talle: " + Eval("TalleEtiqueta") %>' CssClass="d-block" />
                  <asp:Label runat="server" Text='<%# "Cantidad: " + Eval("Cantidad") %>' CssClass="d-block" />
                </asp:Panel>
              </ItemTemplate>
            </asp:Repeater>
                                          <asp:Panel runat="server" CssClass="mt-3">

                                           <asp:HiddenField ID="hfEstado" runat="server" Value='<%# Eval("Estado") %>' />

                                          <asp:Button runat="server"
                                                      CommandName="Confirmar"
                                                      CommandArgument='<%# Eval("IdPedido") %>'
                                                      CssClass="btn btn-success me-2"
                                                      Text="Confirmar"
                                                      Visible='<%# Eval("Estado").ToString()=="Pendiente" %>' />
                                              


                                          <asp:Button runat="server"
                                                      CommandName="Enviado"
                                                      CommandArgument='<%# Eval("IdPedido") %>'
                                                      CssClass="btn btn-secondary"
                                                      Text="Confirmar Envio"
                                                      Visible='<%# Eval("Estado").ToString()=="Confirmado" %>' />

                                          <asp:Button runat="server"
                                                      CommandName="ConfirmarEntrega"
                                                      CommandArgument='<%# Eval("IdPedido") %>'
                                                      CssClass="btn btn-success"
                                                      Text="Confirmar Entrega"
                                                      Visible='<%# Eval("Estado").ToString()=="Enviado" %>' />

                                          <asp:Button runat="server"
                                                      CommandName="Cancelar"
                                                      CommandArgument='<%# Eval("IdPedido") %>'
                                                      CssClass="btn btn-danger"
                                                      Text="Cancelar"
                                                      Visible='<%# Eval("Estado").ToString() != "Cancelado" && Eval("Estado").ToString() != "Entregado" %>' />
                                        </asp:Panel>
          </asp:Panel>
        </asp:Panel>
      </ItemTemplate>
    </asp:Repeater>
  </asp:Panel>

</asp:Content>
