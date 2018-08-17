using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for recarga_detalle
/// </summary>
public class recarga_detalle
{
    public recarga_detalle()
    {
        //
        // TODO: Add constructor logic here
        //
    }
   
    public string fecha { get; set; }
    public string rsauthorization { get; set; }
    public string rsrcode { get; set; }
    public string rstransactionid { get; set; }
    public string operadora { get; set; }
    public decimal den_monto { get; set; }
    public string numerorecarga { get; set; }
}