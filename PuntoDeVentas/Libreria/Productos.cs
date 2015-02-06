using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
namespace Libreria
{
    public class Productos : Conectar, IOperaciones
    {
        private int id_producto;

        public int Id_producto
        {
            get { return id_producto; }
            set { id_producto = value; }
        }
        private int id_marca;

        public int Id_marca
        {
            get { return id_marca; }
            set { id_marca = value; }
        }
        private int id_categoria;

        public int Id_categoria
        {
            get { return id_categoria; }
            set { id_categoria = value; }
        }
        private int codigo;

        public int Codigo
        {
            get { return codigo; }
            set { codigo = value; }
        }
        private String nombre;

        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }
        private String descripcion;

        public String Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        private Decimal venta;

        public Decimal Venta
        {
            get { return venta; }
            set { venta = value; }
        }
        private Decimal costo;

        public Decimal Costo
        {
            get { return costo; }
            set { costo = value; }
        }
        private Decimal stock;

        public Decimal Stock
        {
            get { return stock; }
            set { stock = value; }
        }
        private Boolean execto;

        public Boolean Execto
        {
            get { return execto; }
            set { execto = value; }
        }
        private Boolean activo;

        public Boolean Activo
        {
            get { return activo; }
            set { activo = value; }
        }

        public int grabar()
        {
            String sql = "P_GRABARPRODUCTO  "+ Id_producto + "," + 
                                                Id_marca + "," + 
                                                Id_categoria + "," + 
                                                Codigo + ",'" + 
                                                Nombre + "','" + 
                                                Descripcion + "','" +  
                                                Venta + "','" + 
                                                Costo + "','" + 
                                                Stock + "'," +
                                                (Execto ? 1 : 0) + "," + 
                                                (Activo ? 1 : 0);
            return grabarConReturn(sql);
        }

        public System.Data.DataSet listar()
        {
            string sql = "P_LISTARPRODUCTO '" + Nombre + "'";
            return listar(sql);
        }



        public void leer()
        {
            throw new NotImplementedException();
        }

        public void limpiar()
        {
            Id_producto = 0;
            Nombre = "";
            Activo = false;
        }
        public Boolean existe()
        {
            String sql = "P_EXISTEMARCA " + Id_producto + ",'" +
                                            Nombre + "'";
            return grabarConReturn(sql) != 0 ? true : false;

        }

        public DataSet llenarComboBox()
        {
            String sql = "P_LLENARCOMBOCATEGORIA";
            return listar(sql);

        }
    }
}
