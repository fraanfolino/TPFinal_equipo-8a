<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="TPFinal_equipo_8a.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
 <p></p>
<h2>
<asp:Label ID="Titulo" runat="server" Text="Mi Perfil" />
</h2>


 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <Triggers>
             <asp:PostBackTrigger ControlID="btnGuardar" />
            </Triggers>
                <ContentTemplate>

    <div class="row">
        <div class="col-md-3">
            <div class="mb-3">
                <label class="form-label">Email</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" Style="width: 100%; max-width: none;"/>
                <asp:RegularExpressionValidator ControlToValidate="txtEmail" 
                                                ErrorMessage="Campo Inválido" 
                                                runat="server" 
                                                ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"  
                                                ForeColor="Red" 
                                                Type="Integer" 
                                                Enabled="True" 
                                                Display="Dynamic"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Nombre</label>
                <asp:RequiredFieldValidator CssClass="validacion" 
                                            ErrorMessage="El nombre es requerido" 
                                            ControlToValidate="txtNombre" 
                                            runat="server" 
                                            ForeColor="Red"/>
                <asp:TextBox runat="server" CssClass="form-control" ClientIDMode="Static" ID="txtNombre" MaxLength="20" Style="width: 100%; max-width: none;"/>
            </div>
            <div class="mb-3">
                <label class="form-label">Apellido</label>
                <asp:RequiredFieldValidator CssClass="validacion" ErrorMessage="El apellido es requerido" ControlToValidate="txtApellido" runat="server" ForeColor="Red"/>
                <asp:TextBox ID="txtApellido" ClientIDMode="Static" runat="server" CssClass="form-control" MaxLength="20" required="1" Style="width: 100%; max-width: none;"/>
            </div>

            <div class="mb-3">
                <label class="form-label">Fecha de Nacimiento</label>
                <asp:TextBox runat="server" CssClass="form-control" ID="txtFechaNacimiento" TextMode="Date" Style="width: 100%; max-width: none;"/>
                <asp:CustomValidator runat="server" id="CustomValidator3" ControlToValidate="txtFechaNacimiento" 
                onservervalidate="CustomValidator3_ServerValidate"
                ErrorMessage="Ingrese una fecha válida" ForeColor="red">
                </asp:CustomValidator>
            </div>
    
            <asp:Panel ID="panelCambioClave" runat="server" Visible="false">
                    <div class="mb-3">
                        <asp:Label ID="lblClaveActual" CssClass="form-label" runat="server" Text="Ingrese su Contraseña Actual" />
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtClaveActual" required="1" AutoCompleteType="Disabled" Style="width: 100%; max-width: none;" />
                        <asp:CustomValidator runat="server" ID="CustomValidator1" ControlToValidate="txtClaveActual"
                            OnServerValidate="controlclaveactual_ServerValidate"
                            ErrorMessage="Contraseña incorrecta" ForeColor="red" Display="Dynamic" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Nueva Contraseña</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtNuevaClave" TextMode="Password" required="1" Style="width: 100%; max-width: none;" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Repetir Contraseña</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="txtNuevaClave2" TextMode="Password" required="1" Style="width: 100%; max-width: none;" />
                        <asp:CompareValidator runat="server" ControlToCompare="txtNuevaClave" ControlToValidate="txtNuevaClave2"
                            ErrorMessage="Las claves no coinciden" ForeColor="Red" Display="Dynamic" />
                    </div>
                </asp:Panel>

             
<div class="row mb-3 gx-1">
    <div class="col-md-4 px-1">
        <asp:Button 
            Text="Guardar" 
            CssClass="btn btn-primary w-100 m-0" 
            OnClick="btnGuardar_Click" 
            ID="btnGuardar" 
            runat="server" 
            OnClientClick="return validar()" />
    </div>

    <div class="col-md-5 px-1">
        <asp:Button Text="Cambiar clave" CssClass="btn btn-dark w-100 m-0" OnClick="Cambiarclavebtn_Click" ID="Cambiarclavebtn"  runat="server" AutoPostBack="true" formNoValidate="false" 
            CausesValidation="false" 
            UseSubmitBehavior="false" />
    </div>

    <div class="col-md-3 px-1">
        <a href="Catalogo.aspx" class="btn btn-primary w-100 m-0">Volver</a>
    </div>
</div>

                <div class="mb-3">
        <div class="d-flex gap-2 mt-2">
        <div id="alertDiv" runat="server" class="alert alert-secondary w-100 py-1 px-2" role="alert"  style="padding-top: 2px; padding-bottom: 2px;">
        </div>     
        </div>        
            </div>
  </div>
        <div class="col-md-6">
            <div class="mb-3">
            <label class="form-label">Imagen Perfil</label>
        <asp:TextBox ID="txtUrlImagenPerfil" ClientIDMode="Static" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtUrlImagenPerfil_TextChanged" Style="width: 100%; max-width: none;"/>
         </div>
     
     <img src="~/Images/error.jpeg" id="imgNuevoPerfil" onerror="imgErrorPerfil(this)" CssClass="img-fluid mb-3" runat="server" style="max-height: 200px;"  ClientIDMode="Static"/>

        </div>
    </div>
</ContentTemplate>
</asp:UpdatePanel>
        <script type="text/javascript">
            function imgErrorPerfil(me) {
                var alterNativeImg = "/Images/error.png";
                if (alterNativeImg != me.src)
                    me.src = alterNativeImg;
            }
        </script>
</asp:Content>
