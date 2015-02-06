<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmFormaPago.aspx.cs" Inherits="PuntoDeVentas.FrmFormaPago" %>
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
    <p>
    <script>
        function Read_Data(value) {
            // agregar evento RowDataBound
            var ivalue = parseInt(value) + 1;
            var grilla = document.getElementById('<%= Grilla.ClientID %>');
            var id = grilla.rows[ivalue].cells[0].textContent;
            var nombre = grilla.rows[ivalue].cells[1].textContent;
            var habilitado = grilla.rows[ivalue].cells[2].textContent;

            document.getElementById('<%=txtId.ClientID%>').value = id;
            document.getElementById('<%=txtNombre.ClientID%>').value = nombre;
            document.getElementById('<%=chkActivo.ClientID%>').checked = habilitado == "Si" ? true : false;
        }
        function Limpiar() {
            document.getElementById('<%=txtId.ClientID%>').value = 0;
            document.getElementById('<%=txtNombre.ClientID%>').value = "";
            document.getElementById('<%=chkActivo.ClientID%>').checked = false;
            document.getElementById('<%=Grilla.ClientID %>').style.display = "none";
            return false;
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
        <br />
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style1">
                    <strong>Forma Pago</strong></td>
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
                    Nombre</td>
                <td>
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtNombre" ErrorMessage="* Falta Nombre" ForeColor="Red" 
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
                    Text="Grabar" ValidationGroup="grabar" />
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
               
                    <asp:GridView ID="Grilla" runat="server" onrowdatabound="grilla_RowDataBound">
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
    </p>
</asp:Content>
