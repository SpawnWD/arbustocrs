using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Renci.SshNet;
using Renci.SshNet.Sftp;
using System.IO;
using Microsoft.VisualBasic.FileIO;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using System.Diagnostics;

namespace DailyFile
{
    class Program
    {
        static private EventLog evt;

        static void Main(string[] args)
        {
            evt = new EventLog();
            if (!EventLog.SourceExists("AC_VestaDialy"))
            {
                EventLog.CreateEventSource("AC_VestaDialy", "AC_VestaDialy");
            }
            evt.Source = "AC_VestaDialy";
            evt.Log = "AC_VestaDialy";
            evt.WriteEntry("Iniciando la conexion a FTP Vesta");

            /*var ini = Inicia();
            Task.WaitAll(ini);*/

            DateTime dtInicioConteo = new DateTime(2017, 4, 4);
            DateTime dt = DateTime.Now.AddDays(-1).AddMonths(-3);
            int fileid = 1;
            while (true)
            {
                string fecha = dt.Year.ToString() + dt.Month.ToString().PadLeft(2, '0') + dt.Day.ToString().PadLeft(2, '0');
                if (dt > dtInicioConteo)
                {
                    fileid = (int)((dt - dtInicioConteo).TotalDays + 1);
                    var ini = Inicia(fecha, fileid);
                    Task.WaitAll(ini);
                }
                dt = dt.AddDays(1);
                if (dt.Date == DateTime.Now.Date)
                    break;
            }
        }

        //static private async Task Inicia(string fecha)
        static private async Task Inicia(string fecha, int fileid)
        {
            //string fecha = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.AddDays(-1).Day.ToString().PadLeft(2, '0');
            string filename = "STANDARD-" + fileid.ToString().PadLeft(10, '0') + "-"; //ConfigurationManager.AppSettings["filename"];

            string nombrefile = filename + fecha + ".csv"; //"Recargasell_" + fecha + ".csv";
            string cs = ConfigurationManager.ConnectionStrings["ac"].ConnectionString;
            int numrows = 0;

            using (var conn = new MySqlConnection(cs))
            {
                using (var cmd = new MySqlCommand("select count(procesado) from vestadialydate where fechaprocesado = '" + fecha + "' and procesado = 1", conn))
                {
                    conn.Open();
                    int procesado = int.Parse(cmd.ExecuteScalar().ToString());
                    conn.Close();
                    if (procesado == 0)
                    {
                        SftpClient cli = null;
                        try
                        {
                            PasswordConnectionInfo info = new PasswordConnectionInfo("162.254.14.20", "xfr_recargasell", "meGeWachek&T5a");
                            cli = new SftpClient(info);
                            cli.Connect();
                            //var fp = cli.ListDirectory(Path.Combine(cli.WorkingDirectory, "staging/outbox"));
                            //foreach(SftpFile sf in fp)
                            //    Console.WriteLine("No existe " + nombrefile);
                            nombrefile = Path.Combine(cli.WorkingDirectory, "staging/outbox/", nombrefile);
                            if (cli.Exists(nombrefile))
                            {
                                evt.WriteEntry("Archivo del dia " + fecha + " encontrado");
                                string contenido = cli.ReadAllText(nombrefile);
                                MemoryStream ms = new MemoryStream();
                                cli.DownloadFile(nombrefile, ms);
                                ms.Seek(0, SeekOrigin.Begin);

                                using (TextFieldParser parser = new TextFieldParser(new MemoryStream(ms.GetBuffer())))
                                //using (TextFieldParser parser = new TextFieldParser("Recargasell_" + fecha + ".csv"))
                                {
                                    parser.TextFieldType = FieldType.Delimited;
                                    parser.SetDelimiters(",");
                                    while (!parser.EndOfData)
                                    {
                                        string[] fields = parser.ReadFields();
                                        if (fields[0].ToUpper() == "D")
                                        {
                                            InsertaRow(fields);
                                            numrows++;
                                        }
                                    }
                                }
                                if (numrows > 0)
                                {
                                    evt.WriteEntry("Se proceso " + numrows.ToString() + " rows del dia " + fecha);
                                    using (var cmd2 = new MySqlCommand("insert into vestadialydate (fechaprocesado, procesado, numrows, fileid) values ('" + fecha + "', 1, " + numrows.ToString() + ", " + fileid.ToString() + ")", conn))
                                    {
                                        conn.Open();
                                        cmd2.ExecuteNonQuery();
                                        conn.Close();
                                    }
                                }
                            }
                            else {
                                DateTime dt = DateTime.Now.AddDays(-1);
                                if (fecha == dt.Year.ToString() + dt.Month.ToString().PadLeft(2, '0') + dt.Day.ToString().PadLeft(2, '0'))
                                    evt.WriteEntry("Archivo del dia " + fecha + " NO encontrado");
                            }
                        }
                        catch (Exception ex)
                        {
                            //Console.WriteLine(ex.Message);
                            //Console.ReadKey();
                            evt.WriteEntry(ex.Message);
                        }
                        finally
                        {
                            //cli.Disconnect();
                        }
                    }
                }
            }
        }

        static private void InsertaRow(string[] f)
        {
            int res = 0;
            string cs = ConfigurationManager.ConnectionStrings["ac"].ConnectionString;
            DataSet ds = new DataSet();
            using (var conn = new MySqlConnection(cs))
            {
                string command = "insert into vestadialy (paymentid, transactionid, amount, paymenttype, vestadate, partnerdate, paymentstatus, paymentstatusreason, vestafee, Indemnification, originalpaymentid, originaltransactionid, paymentdescriptor) ";
                command += "values (@paymentid, @transactionid, @amount, @paymenttype, @vestadate, @partnerdate, @paymentstatus, ";
                command += "@paymentstatusreason, @vestafee, @indemnification, @originalpaymentid, @originaltransactionid, @paymentdescriptor)";
                using (var cmd = new MySqlCommand(command, conn))
                {
                    cmd.Parameters.Add("@paymentid", MySqlDbType.VarChar, 12).Value = f[2];
                    cmd.Parameters.Add("@transactionid", MySqlDbType.VarChar, 36).Value = f[3];
                    cmd.Parameters.Add("@amount", MySqlDbType.Decimal).Value = decimal.Parse(f[4]);
                    cmd.Parameters.Add("@paymenttype", MySqlDbType.Int32).Value = f[5];
                    cmd.Parameters.Add("@vestadate", MySqlDbType.DateTime).Value = f[6];
                    cmd.Parameters.Add("@partnerdate", MySqlDbType.DateTime).Value = f[7];
                    cmd.Parameters.Add("@paymentstatus", MySqlDbType.Int32).Value = f[8];
                    int reason = 0;     int.TryParse(f[9], out reason);
                    cmd.Parameters.Add("@paymentstatusreason", MySqlDbType.Int32).Value = reason;
                    cmd.Parameters.Add("@vestafee", MySqlDbType.Decimal).Value = decimal.Parse(f[11]);
                    cmd.Parameters.Add("@indemnification", MySqlDbType.Int32).Value = f[13];
                    cmd.Parameters.Add("@originalpaymentid", MySqlDbType.VarChar, 12).Value = f[14];
                    cmd.Parameters.Add("@originaltransactionid", MySqlDbType.VarChar, 36).Value = f[15];
                    cmd.Parameters.Add("@paymentdescriptor", MySqlDbType.VarChar, 128).Value = f[16];
                    conn.Open();
                    if (cmd.ExecuteNonQuery() > 0)
                    {
                        res = (int)cmd.LastInsertedId;
                    }
                }
            }
        }

    }
}