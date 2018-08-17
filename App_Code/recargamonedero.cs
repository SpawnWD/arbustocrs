using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for recargamonedero
/// </summary>
/// 
namespace MasTicket
{ 
    public class recargamonedero
    {
        public recargamonedero()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public int idrecargamonedero { get; set; }
        public int idtarjeta { get; set; }
        public decimal monto { get; set; }
        public DateTime fecha { get; set; }
        public int err { get; set; }
        public int errVs { get; set; }
        public string TransactionID { get; set; }
        public string PaymentID { get; set; }
        public int idusuario { get; set; }
        public string ip { get; set; }
        public string riskxml { get; set; }
        public string os { get; set; }
    }
}