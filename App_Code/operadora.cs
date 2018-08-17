using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for operadora
/// </summary>
namespace MasTicket
{
    public class operadora
    {
        public operadora()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public int idoperadora { get; set; }
        public string telefonia { get; set; }
        public decimal Total_Recargas { get; set; }
        public decimal MontoPesos { get; set; }
        public string img { get; set; }
    }
}