using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class FrmProveedor : System.Web.UI.Page
    {
        Proveedor proveedor = new Proveedor();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Value = "";
            txtNombre.Text = "";
            txtRut.Text = "";
            txtDigito.Text = "";
            txtRazonSocial.Text = "";
            txtTelefono1.Text = "";
            txtTelefono2.Text = "";
            txtEmail.Text = "";
            chkActivo.Checked = false;
            proveedor.limpiar();
            txtNombre.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text.Trim().Length < 1)
            {

                Response.Write("<script>alert('Falta Nombre');</script>");
                txtNombre.Focus();
              
                return;
            }
            proveedor.Id = 0;
            if (txtId.Value.Trim().Length > 0)
                 proveedor.Id = Int32.Parse(txtId.Value);
                 proveedor.Rut = Int32.Parse(txtRut.Text);
                 proveedor.Digito = char.Parse(txtDigito.Text);
                 proveedor.Razon = txtRazonSocial.Text;
                 proveedor.Nombre = txtNombre.Text;
                 proveedor.Telefono1 = txtTelefono1.Text;
                 proveedor.Telefono2 = txtTelefono2.Text;
                 proveedor.Email = txtEmail.Text;
                 proveedor.Activo = chkActivo.Checked;

           
            if (proveedor.existe())
            {
                Response.Write("<script>alert('Ya esta en la BDD');</script>");
                txtNombre.Focus();
                return;
            }
            int res = proveedor.grabar();

            // si hay error avisa al usuario
            if (res < 0)
                Response.Write("<script>alert('Error en la BDD');</script>");
            else
                btnLimpiar_Click(null, null);
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            proveedor.Nombre = txtNombre.Text;
            Grilla.DataSource = proveedor.listar();
            Grilla.DataBind();
        }

        protected void Grilla_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onclick", "Read_Data('" + e.Row.RowIndex + "')");
            }
        }

        protected void Grilla_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {

        }

        protected void Grilla_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}