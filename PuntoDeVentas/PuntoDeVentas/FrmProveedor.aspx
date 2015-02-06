<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmProveedor.aspx.cs" Inherits="PuntoDeVentas.FrmProveedor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
<script>
    function Read_Data(value) {
        var fila = parseInt(value) + 1;
        var grilla = document.getElementById('<%= Grilla.ClientID %>');
        var id = grilla.rows[fila].cells[0].textContent;
        var rut = grilla.rows[fila].cells[1].textContent;
        var digito = grilla.rows[fila].cells[2].textContent;
        var razon = grilla.rows[fila].cells[3].textContent;
        var nombre = grilla.rows[fila].cells[4].textContent;
        var tele1 = grilla.rows[fila].cells[5].textContent;
        var tele2 = grilla.rows[fila].cells[6].textContent;
        var email = grilla.rows[fila].cells[7].textContent;
        var activo = grilla.rows[fila].cells[8].textContent;

        document.getElementById('<%= txtId.ClientID %>').value = id;
        document.getElementById('<%= txtRut.ClientID %>').value = rut;
        document.getElementById('<%= txtDigito.ClientID %>').value = digito;
        document.getElementById('<%= txtRazonSocial.ClientID %>').value = razon;
        document.getElementById('<%= txtNombre.ClientID %>').value = nombre;
        document.getElementById('<%= txtTelefono1.ClientID %>').value = tele1;
        document.getElementById('<%= txtTelefono2.ClientID %>').value = tele2; 
        document.getElementById('<%= txtEmail.ClientID %>').value = email;

        document.getElementById('<%= chkActivo.ClientID %>').checked = activo == "Si" ? true : false;
    }    
    </script>
    <script runat="server">
        protected void Page_Load(object sender, EventArgs e)
        {
            // limpia el formulario
            this.btnLimpiar.Attributes.Add("OnClick", "javascript:return Limpiar();");            
        }

        protected void grilla_RowCreated(object sender, GridViewRowEventArgs e)
        {
            //oculta celdas
            e.Row.Cells[0].Style.Add(HtmlTextWriterStyle.Display, "none");
        }
    </script>

    <p>
        <br />
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style1">
                    <strong>Proveedor</strong></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                <asp:HiddenField ID="txtId" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Rut</td>
                <td>
                    <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="Falta Rut" 
                        ForeColor="Red" ValidationGroup="grabar"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtRut" Display="Dynamic" ErrorMessage="**Solo numeros**" 
                        ForeColor="Red" ValidationExpression="\d+" ValidationGroup="grabar"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Digito
                </td>
                <td>
                    <asp:TextBox ID="txtDigito" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtDigito" ErrorMessage="Falta digito" ForeColor="Red" 
                        ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Razon Social</td>
                <td>
                    <asp:TextBox ID="txtRazonSocial" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtRazonSocial" ErrorMessage="Falta Razon" ForeColor="Red" 
                        ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Nombre</td>
                <td>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtNombre" ErrorMessage="Falta Nombre" ForeColor="Red" 
                        ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                  Telefono 1</td>
                <td>
                    <asp:TextBox ID="txtTelefono1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtTelefono1" ErrorMessage="Falta Telefono " ForeColor="Red" 
                        ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Telefono 2</td>
                <td>
                    <asp:TextBox ID="txtTelefono2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtTelefono2" ErrorMessage="Falta Telefono" ForeColor="Red" 
                        ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Email</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Falta email" ForeColor="Red" 
                        ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Activo</td>
                <td>
                <asp:CheckBox ID="chkActivo" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Opciones</td>
                <td>
                <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click"
                    Text="Limpiar" />
                <asp:Button ID="btnGrabar" runat="server" onclick="btnGrabar_Click" 
                    Text="Grabar" ValidationGroup="grabar" style="height: 26px" />
                <asp:Button ID="btnListar" runat="server" onclick="btnListar_Click" 
                    Text="Listar" />
                <asp:Button ID="btnVolver" runat="server" Text="Volver" 
                    PostBackUrl="~/MenuPrincipal.aspx" onclick="btnVolver_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="Grilla" runat="server" onrowcreated="Grilla_RowCreated" 
                        onrowdatabound="Grilla_RowDataBound" 
                        onselectedindexchanged="Grilla_SelectedIndexChanged">
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </p>
</asp:Content>
