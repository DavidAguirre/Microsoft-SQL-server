<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FrmProducto.aspx.cs" Inherits="PuntoDeVentas.FrmProducto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 25px;
        }
        .style2
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
            var marca = grilla.rows[fila].cells[1].textContent;
            var categoria = grilla.rows[fila].cells[2].textContent;
            var codigobarra = grilla.rows[fila].cells[3].textContent;
            var nombre = grilla.rows[fila].cells[4].textContent;
            var descripcion = grilla.rows[fila].cells[5].textContent;
            var venta = grilla.rows[fila].cells[6].textContent;
            var costo = grilla.rows[fila].cells[7].textContent;
            var stock = grilla.rows[fila].cells[8].textContent;
            var execto = grilla.rows[fila].cells[9].textContent;
            var habilitado = grilla.rows[fila].cells[10].textContent;

            alert(marca + " " + categoria);
            document.getElementById('<%= txtIdProducto.ClientID %>').value = id;
            document.getElementById('<%= cmbMarca.ClientID %>').value = marca;
            document.getElementById('<%= cmbCategoria.ClientID %>').value = categoria;
            document.getElementById('<%= txtCodigoBarra.ClientID %>').value = codigobarra;
            document.getElementById('<%= txtNombre.ClientID %>').value = nombre;
            document.getElementById('<%= txtDescripcion.ClientID %>').value = descripcion;
            document.getElementById('<%= txtPrecioVenta.ClientID %>').value = venta;
            document.getElementById('<%= txtPrecioCosto.ClientID %>').value = costo;
            document.getElementById('<%= txtStock.ClientID %>').value = stock;
            document.getElementById('<%= chkExecto.ClientID %>').checked = execto == "Si" ? true : false;
            document.getElementById('<%= chkActivo.ClientID %>').checked = habilitado == "Si" ? true : false;
        }    
    </script>
    
    
    <p>
        <br />
        <table style="width: 100%; margin-top: 0px;">
            <tr>
                <td>
                    &nbsp;</td>
                <td class="style2">
                    <strong>Productos</strong></td>
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
                    <asp:HiddenField ID="txtIdProducto" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Marca</td>
                <td>
                    <asp:DropDownList ID="cmbMarca" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Categoria</td>
                <td>
                    <asp:DropDownList ID="cmbCategoria" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Codigo barras</td>
                <td>
                    <asp:TextBox ID="txtCodigoBarra" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtCodigoBarra" Display="Dynamic" 
                        ErrorMessage="Falta Codigo barras" ForeColor="Red" ValidationGroup="grabar"></asp:RequiredFieldValidator>
&nbsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtCodigoBarra" Display="Dynamic" 
                        ErrorMessage="**Solo Numeros**" ForeColor="Red" ValidationExpression="\d+" 
                        ValidationGroup="grabar"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Nombre</td>
                <td>
                    <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtNombre" ErrorMessage="Falta Nombre" ForeColor="Red" 
                        ValidationGroup="grabar"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Descripcion</td>
                <td>
                    <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtDescripcion" ErrorMessage="Falta descripción" 
                        ForeColor="Red" ValidationGroup="grabar"></asp:RequiredFieldValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Precio Venta</td>
                <td class="style1">
                    <asp:TextBox ID="txtPrecioVenta" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtPrecioVenta" Display="Dynamic" 
                        ErrorMessage="Falta precio Venta" ForeColor="Red" ValidationGroup="grabar"></asp:RequiredFieldValidator>
&nbsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtPrecioVenta" Display="Dynamic" 
                        ErrorMessage="**Solo Numeros**" ForeColor="Red" ValidationGroup="grabar"></asp:RegularExpressionValidator>
                </td>
                <td class="style1">
                </td>
            </tr>
            <tr>
                <td>
                    Precio Costo</td>
                <td>
                    <asp:TextBox ID="txtPrecioCosto" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtPrecioCosto" ErrorMessage="Falta precio Costo" 
                        ForeColor="Red" ValidationGroup="grabar" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="txtPrecioCosto" ErrorMessage="**Solo Numeros**" 
                        ForeColor="Red" ValidationGroup="grabar" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Stock</td>
                <td>
                    <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtStock" Display="Dynamic" ErrorMessage="Falta Stock" 
                        ForeColor="Red" ValidationGroup="grabar"></asp:RequiredFieldValidator>
&nbsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                        Display="Dynamic" ErrorMessage="**Solo Numeros**" ForeColor="Red" 
                        ValidationGroup="grabar" ControlToValidate="txtStock"></asp:RegularExpressionValidator>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Execto</td>
                <td>
                    <asp:CheckBox ID="chkExecto" runat="server" />
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
            
                    <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" />
            
                <asp:Button ID="btnGrabar" runat="server" onclick="btnGrabar_Click" 
                    Text="Grabar" ValidationGroup="grabar" />
               
               
                    <asp:Button ID="btnListar" runat="server" Text="Listar" 
                        onclick="btnListar_Click1" />
                    <asp:Button ID="btnVolver" runat="server" Text="Volver" 
                        onclick="btnVolver_Click1" />
               
               
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
