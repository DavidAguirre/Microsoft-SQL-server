using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Libreria
{
   public class Proveedor : Conectar, IOperaciones
    {
        private int id;
        public int Id
        {
            get { return id; }
            set { id = value; }
        }

        private int rut;
        public int Rut
        {
            get { return rut; }
            set { rut = value; }
        }

        private char digito;
        public char Digito
        {
            get { return digito; }
            set { digito = value; }
        }

        private String razon;
        public String Razon
        {
            get { return razon; }
            set { razon = value; }
        }

        private String nombre;
        public String Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        private String telefono1;
        public String Telefono1
        {
            get { return telefono1; }
            set { telefono1 = value; }
        }

        private String telefono2;
        public String Telefono2
        {
            get { return telefono2; }
            set { telefono2 = value; }
        }

        private String email;
        public String Email
        {
            get { return email; }
            set { email = value; }
        }
        private Boolean activo;

        public Boolean Activo
        {
            get { return activo; }
            set { activo = value; }
        }


        public int grabar()
        {
            String sql = "P_GRABARPROVEEDOR " + Id + ",'"  +
                                                Rut + "','" +
                                                Digito + "','" +
                                                Razon + "','" +
                                                Nombre + "','" +
                                                Telefono1 + "','" +
                                                Telefono2 + "','" +
                                                Email + "'," +
                                                (Activo ? 1 : 0);
            return grabarConReturn(sql);
        }

        public DataSet listar()
        {
            String sql = "P_LISTARPROVEEDOR '" + Nombre + "'";
            return listar(sql);
        }

        public void leer()
        {
            throw new NotImplementedException();
        }

        public void limpiar()
        {
            id = 0;
            nombre = "";
           

            activo = false;
        }

        public Boolean existe()
        {
            String sql = "P_EXISTEPROVEEDOR " + Id + ",'" +
                                                Nombre + "'";
            return grabarConReturn(sql) != 0 ? true : false;
        }
    }
}
