<%@ Page Title="Datos de Compra" Language="C#"  
    MasterPageFile="~/Site.Master"  
    AutoEventWireup="true"  
    CodeBehind="DatosCompra.aspx.cs"  
    Inherits="TPFinal_equipo_8a.DatosCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <asp:Panel  
      ID="pnlDatosCompra"  
      runat="server"  
      CssClass="container mt-5"  
      Style="max-width:600px;">
    
    <asp:Label  
        ID="lblTitulo"  
        runat="server"  
        Text="Datos de Compra"  
        CssClass="h2 mb-4 d-block" />

    <asp:ValidationSummary  
        ID="valSummary"  
        runat="server"  
        CssClass="text-danger mb-3 d-block" />

    
    <asp:Panel runat="server" CssClass="row mb-3">
      <asp:Label  
          ID="lblNombreTitulo"  
          runat="server"  
          Text="Nombre completo:"  
          CssClass="col-sm-2 col-form-label" />
      <asp:Panel runat="server" CssClass="col-sm-10">
        <asp:TextBox  
            ID="txtNombre"  
            runat="server"  
            CssClass="form-control" />
      </asp:Panel>
    </asp:Panel>

  
    <asp:Panel runat="server" CssClass="row mb-3">
      <asp:Label  
          ID="lblEmailTitulo"  
          runat="server"  
          Text="Email:"  
          CssClass="col-sm-2 col-form-label" />
      <asp:Panel runat="server" CssClass="col-sm-10">
        <asp:TextBox  
            ID="txtEmail"  
            runat="server"  
            CssClass="form-control" />
      </asp:Panel>
    </asp:Panel>

    
    <asp:Panel runat="server" CssClass="row mb-3">
      <asp:Label  
          ID="lblTelefonoTitulo"  
          runat="server"  
          Text="Teléfono:"  
          CssClass="col-sm-2 col-form-label" />
      <asp:Panel runat="server" CssClass="col-sm-10">
        <asp:TextBox  
            ID="txtTelefono"  
            runat="server"  
            CssClass="form-control" />
      </asp:Panel>
    </asp:Panel>

    
    <asp:Panel runat="server" CssClass="row mb-3">
      <asp:Label  
          ID="lblEntregaTitulo"  
          runat="server"  
          Text="Modalidad de entrega:"  
          CssClass="col-sm-2 col-form-label" />
      <asp:Panel runat="server" CssClass="col-sm-10">
        <asp:DropDownList  
            ID="ddlEntrega"  
            runat="server"  
            CssClass="form-select"  
            AutoPostBack="true"  
            OnSelectedIndexChanged="ddlEntrega_SelectedIndexChanged">
          <asp:ListItem Text="-- Seleccione --" Value="" />
          <asp:ListItem Text="Retiro en sucursal" Value="Retiro" />
          <asp:ListItem Text="Envío a domicilio" Value="Envio" />
        </asp:DropDownList>
      </asp:Panel>
    </asp:Panel>

    
    <asp:Panel  
        ID="pnlRetiro"  
        runat="server"  
        Visible="false"  
        CssClass="row mb-3">
      <asp:Label  
          ID="lblSucursalTitulo"  
          runat="server"  
          Text="Sucursal:"  
          CssClass="col-sm-2 col-form-label" />
      <asp:Panel runat="server" CssClass="col-sm-10">
        <asp:DropDownList  
            ID="ddlSucursal"  
            runat="server"  
            CssClass="form-select">
          <asp:ListItem Value="1">Av. Medrano 951, Almagro</asp:ListItem>
          <asp:ListItem Value="2">Av. Yrigoyen 288, Gral. Pacheco</asp:ListItem>
          <asp:ListItem Value="3">París 532, Haedo</asp:ListItem>
        </asp:DropDownList>
      </asp:Panel>
    </asp:Panel>

   
    <asp:Panel  
        ID="pnlEnvio"  
        runat="server"  
        Visible="false"  
        CssClass="alert alert-info mb-3">
      Nos pondremos en contacto para coordinar el envío.
    </asp:Panel>

   
    <asp:Panel runat="server" CssClass="row mb-4">
      <asp:Label  
          ID="lblFormaPagoTitulo"  
          runat="server"  
          Text="Forma de pago:"  
          CssClass="col-sm-2 col-form-label" />
      <asp:Panel runat="server" CssClass="col-sm-10">
        <asp:DropDownList  
            ID="ddlPago"  
            runat="server"  
            CssClass="form-select"  
            AutoPostBack="true"  
            OnSelectedIndexChanged="ddlPago_SelectedIndexChanged" />
      </asp:Panel>
    </asp:Panel>

    
    <asp:Panel runat="server" CssClass="row mb-4">
      <asp:Label  
          ID="lblTotalFinalTitulo"  
          runat="server"  
          Text="Total con ajuste:"  
          CssClass="col-sm-2 col-form-label fw-bold" />
      <asp:Panel runat="server" CssClass="col-sm-10">
        <asp:Label  
            ID="lblTotalFinal"  
            runat="server"  
            CssClass="form-control-plaintext fs-5 fw-bold" />
      </asp:Panel>
    </asp:Panel>

    <asp:Panel runat="server" CssClass="d-flex justify-content-end">
      <asp:Button  
          ID="btnRealizarCompra"  
          runat="server"  
          Text="Realizar compra"  
          CssClass="btn btn-primary btn-lg"  
          OnClick="btnRealizarCompra_Click" />
    </asp:Panel>

  </asp:Panel>

</asp:Content>
