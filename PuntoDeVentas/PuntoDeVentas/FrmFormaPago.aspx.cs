using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Libreria;

namespace PuntoDeVentas
{
    public partial class FrmFormaPago : System.Web.UI.Page
    {
        FormaPago formapago = new FormaPago();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            if (txtNombre.Text.Trim().Length < 1)
            {

                Response.Write("<script>alert('Falta Nombre');</script>");
                txtNombre.Focus();
                return;            
            }
            formapago.Id = 0;
            if (txtId.Value.Trim().Length > 0)
                formapago.Id = Int32.Parse(txtId.Value);
            formapago.Nombre = txtNombre.Text;
            formapago.Activo = chkActivo.Checked;

            if (formapago.existe())
            {
                Response.Write("<script>alert('Ya esta en la BDD');</script>");
                txtNombre.Focus();
                return;
            }
            int res = formapago.grabar();

            // si hay error avisa al usuario
            if (res < 0)
                Response.Write("<script>alert('Error en la BDD');</script>");
            else
                btnLimpiar_Click(null, null);

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            txtId.Value = "";
            txtNombre.Text = "";
            chkActivo.Checked = false;
            formapago.limpiar();
            txtNombre.Focus();
            Grilla.DataSource = null;
            Grilla.DataBind();
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            formapago.Nombre = txtNombre.Text;
            Grilla.DataSource = formapago.listar();
            Grilla.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuPrincipal.aspx");
        }

      

        protected void grilla_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes.Add("onclick", "Read_Data('" + e.Row.RowIndex + "')");
            }
        }

        protected void grilla_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

     
    
    }
}