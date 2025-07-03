<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="TPFinal_equipo_8a.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>
    <asp:Label ID="Titulo" runat="server" Text="Registrar usuario" />
</h2>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

    <div class="row">
     <section class="col-md-3">

        <div class="mb-3">
        <div class="form-floating mb-3">
        <asp:TextBox ID="txtRegistroEmail" runat="server" Cssclass="form-control" REQUIRED="1" placeholder="usuario@email.com"  autocomplete="off"  Style="width: 100%; max-width: none;"/>
        <label for="floatingEmail" cssclass="form-control">Ingrese E-Mail
        <asp:RegularExpressionValidator ControlToValidate="txtRegistroEmail" ErrorMessage="Campo Inválido" runat="server" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,6}$"  ForeColor="Red" 
        Type="Integer" Enabled="True" Display="Dynamic"/>
<%--        <asp:CustomValidator runat="server" id="Validaemailexistente" ControlToValidate="txtRegistroEmail" 
        onservervalidate="Validaemailexistente_ServerValidate"   
        ErrorMessage="El usuario ya existe" ForeColor="red"/>--%>
        </label>
       </div>
        </div>
            <div class="mb-3">
            <div class="form-floating">
                <asp:TextBox runat="server" cssclass="form-control" ID="txtNombre" REQUIRED="1" placeholder="Nombre" autocomplete="off"  Style="width: 100%; max-width: none;"/>
                <label for="floatingNombre" cssclass="form-control">Ingrese Nombre
                <asp:RegularExpressionValidator ControlToValidate="txtNombre" 
                ErrorMessage="Minimo 4 caracteres" 
                runat="server" ValidationExpression="^[\s\S]{4,20}$"
                ForeColor="Red" Type="Integer" Enabled="True" 
                Display="Dynamic"/>
                </label>
            </div>
              </div>
<div class="mb-3">
            <div class="form-floating">
                <asp:TextBox runat="server" cssclass="form-control" ID="txtPassword" autocomplete="new-password" REQUIRED="1" type="password" TextMode="Password" placeholder="Contraseña"  Style="width: 100%; max-width: none;"/>
                <label for="floatingPassword" cssclass="form-control">Ingrese Contraseña
                <asp:RegularExpressionValidator ControlToValidate="txtPassword" 
                                                ErrorMessage="Minimo 6 caracteres" 
                                                runat="server" 
                                                ValidationExpression="^[\s\S]{6,20}$"
                                                ForeColor="Red" 
                                                Type="Integer" 
                                                Enabled="True" 
                                                Display="Dynamic"/>
                </label>
           </div>
            </div>
            <div class="mb-3">
            <asp:Button Text="Continuar" cssclass="btn btn-primary" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
            </div>
         <div class="d-flex gap-2 mt-2">
    <div id="alertDiv" runat="server" class="alert alert-secondary w-100 py-1 px-2" role="alert"  style="padding-top: 2px; padding-bottom: 2px;">
    </div>     
</div>
 </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
