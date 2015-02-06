using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class FrmProducto : System.Web.UI.Page
    {
        Productos productos = new Productos();
      
   
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cmbMarca.DataTextField = "NOMBRE";
                cmbMarca.DataValueField = "ID";
                cmbMarca.DataSource = new Marca().llenarComboBox();
                cmbMarca.DataBind();

                ListItem i = new ListItem("Seleccionar", "-1");
                cmbMarca.Items.Add(i);
                cmbMarca.SelectedIndex = cmbMarca.Items.IndexOf(cmbMarca.Items.FindByValue("-1"));

               cmbCategoria.DataTextField = "NOMBRE";
               cmbCategoria.DataValueField = "ID";
               cmbCategoria.DataSource = new Productos().llenarComboBox();
               cmbCategoria.DataBind();

                 i = new ListItem("Seleccionar", "-1");
                cmbCategoria.Items.Add(i);
                cmbCategoria.SelectedIndex = cmbCategoria.Items.IndexOf(cmbCategoria.Items.FindByValue("-1"));
            }

        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if (cmbMarca.SelectedIndex < 0)
            {

                Response.Write("<script>alert('Falta Marca');</script>");              
                return;
            }
            else if (txtNombre.Text.Trim().Length < 1)
            {

                Response.Write("<script>alert('Falta Nombre');</script>");
                txtNombre.Focus();

                return;
            }

            if(txtIdProducto.Value.Length > 0)
                productos.Id_producto = Int32.Parse("0" + txtIdProducto.Value);

            productos.Id_marca = Int32.Parse("0" + cmbMarca.SelectedValue);
            productos.Id_categoria = Int32.Parse("0" + cmbCategoria.SelectedValue);
                 productos.Codigo =Int32.Parse(txtCodigoBarra.Text);
                 productos.Nombre = txtNombre.Text;
                 productos.Descripcion = txtDescripcion.Text;
                 productos.Venta = decimal.Parse(txtPrecioVenta.Text);
                 productos.Costo = decimal.Parse(txtPrecioCosto.Text);
                 productos.Stock = decimal.Parse(txtStock.Text);
                 productos.Execto = chkExecto.Checked;                 
                 productos.Activo = chkActivo.Checked;

           
            if (productos.existe())
            {
                Response.Write("<script>alert('Ya esta en la BDD');</script>");
                txtNombre.Focus();
                return;
            }
            int res = productos.grabar();

            // si hay error avisa al usuario
            if (res < 0)
                Response.Write("<script>alert('Error en la BDD');</script>");
            else
                btnLimpiar_Click(null, null);
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
        
        }

       
       protected void btnListar_Click1(object sender, EventArgs e)
        {
            productos.Nombre = txtNombre.Text;
            Grilla.DataSource = productos.listar();
            Grilla.DataBind();
        }

        protected void btnVolver_Click1(object sender, EventArgs e)
        {

        }

        protected void Grilla_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Grilla_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
                e.Row.Attributes.Add("onclick", "Read_Data('" + e.Row.RowIndex + "')");
        }

        protected void Grilla_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
     }

       
}
