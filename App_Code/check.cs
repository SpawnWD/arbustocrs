using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Text.RegularExpressions;

/// <summary>
/// Summary description for check
/// </summary>
public static class check
{
    public static string GeneraMenu()
    {
        //wsac.IsacClient ws;
        //ws = HttpContext.Current.Session["wsac"] as wsac.IsacClient;
        //int hab = ws.GetMonederoHab();
        string menu = "";
        menu = @"<nav class=""nav-main mega-menu"">
                        <ul class=""nav nav-pills nav-main scroll-menu"" id=""topMain"">
                            <li class=""active"">
                                <a class=""dropdown-toggle"" href=""datosrecarga.aspx"">
                                    <i class=""fa fa-mobile""></i> Recargas
                                </a>
                            </li>
                            <li class=""active"">
                                <a class=""dropdown-toggle"" href=""recgratis.aspx"">
                                    <i class=""fa fa-share-square-o""></i> Compartir
                                </a>
                            </li>
                            <li class=""active"">
                                <a class=""dropdown-toggle"" href=""recargas_historial.aspx"">
                                    <i class=""fa fa-calendar""></i> Historial de Recargas
                                </a>
                            </li>";
        //  18/Mar/2017
        //if (hab == 1)
        //{
        //    menu += @"<li class=""active"">
        //                        <a class=""dropdown-toggle"" href=""monedero.aspx"">
        //                            <i class=""fa fa-briefcase""></i> Monedero
        //                        </a>
        //                    </li>";
        //}
        menu += @"<li class=""active"">
                                <a class=""dropdown-toggle"" href=""histrecprog.aspx"">
                                    <i class=""fa fa-clock-o""></i> Recargas programadas
                                </a>
                            </li>
                            <li class=""active"">
                                <a class=""dropdown-toggle"" onclick=""javascript:FBLogout();GGsignOut();"" href=""javascript:__doPostBack('lnkSalir','');"">
                                    <i class=""fa fa-times""></i> <b>SALIR</b>
                                </a>
                            </li>
                        </ul>
                    </nav>";
        return (menu);
    }

    public static bool ValidaNip(string nip)
    {
        bool ret = false; int inip = 0;
        string emailRegex = @"^(?!(.)\1{3})\d{4}$";
        if (!Regex.IsMatch(nip, emailRegex, RegexOptions.IgnoreCase, TimeSpan.FromMilliseconds(250)))
            ret = false;
        else
        {
            emailRegex = @"^(?!(.)\1{2})\d{4}$";
            if (!Regex.IsMatch(nip, emailRegex, RegexOptions.IgnoreCase, TimeSpan.FromMilliseconds(250)))
                ret = false;
            else
            {
                emailRegex = @"^(?!(.)\1{3})(?!19|20)(?!0123|1234|2345|3456|4567|5678|6789|7890|0987|9876|8765|7654|6543|5432|4321|3210)\d{4}$";
                if (!Regex.IsMatch(nip, emailRegex, RegexOptions.IgnoreCase, TimeSpan.FromMilliseconds(250)))
                    ret = false;
                else
                {
                    if (int.TryParse(nip, out inip) && nip.Length == 4)
                        ret = true;
                }
            }
        }
        return (ret);
    }

    public static string SafeSqlLiteral(string inputSQL)
    {
        //return inputSQL.Replace("'", "''");

        HashSet<char> removeChars = new HashSet<char>("?&^$#!()+-,:;<>’\'-*");
        StringBuilder result = new StringBuilder(inputSQL.Length);
        foreach (char c in inputSQL)
            if (!removeChars.Contains(c))
                result.Append(c);
        return result.ToString();
    }
}