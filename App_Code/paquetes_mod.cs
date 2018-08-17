using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for paquetes_mod
/// </summary>
namespace MasTicket
{
    public class paquetes_mod
    {
        public paquetes_mod()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public int idrecarga { get; set; }
        public string name { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string numerorecarga { get; set; }
        public decimal monto { get; set; }
        public string contactorecarga { get; set; }
    }
}