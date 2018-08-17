using System;
using System.Collections.Generic;
using System.Text;
//using SQLite;
using System.Runtime.CompilerServices;
using System.ComponentModel;
//using Xamarin.Forms;
using System.Collections.ObjectModel;
using System.Linq;
using Newtonsoft.Json;
using System.Net;
using System.Threading.Tasks;
using System.Net.Http;
//using ModernHttpClient;
using System.IO;

namespace MasTicket
{
    public enum TipoTransaccion
    {
        PrimeraVez,
        SegundaVez
    };

    public class RecargasViewModel : CatalogosViewModel
    {
		private GetSessionTags tags;

        public bool ReadOnly { get; set; }
        public bool EdicionOnly { get; set; }

        private string _openpaydeviceid;
        public string OpenPayDeviceId
        {
            get { return _openpaydeviceid; }
            set
            {
                _openpaydeviceid = value;
                NotifyPropertyChanged("OpenPayDeviceId");
            }
        }
        private string _openpaytokenid;
        public string OpenPayTokenId
        {
            get { return _openpaytokenid; }
            set
            {
                _openpaytokenid = value;
                NotifyPropertyChanged("OpenPayTokenId");
            }
        }

        private TipoTransaccion _tipotrans;
        public TipoTransaccion TipoTrans
        {
            get
            {
                return _tipotrans;
            }
            set
            {
                _tipotrans = value;
            }
        }
        private errRecarga _err;
		public errRecarga Err
		{
			get
			{
				return _err;
			}
			set
			{
				if (value != _err)
				{
					_err = value;
					NotifyPropertyChanged("Err");
				}
			}
		}
		private int _idusuario;
		public int IdUsuario
		{
			get
			{
				return _idusuario;
			}
			set
			{
				if (value != _idusuario)
				{
					_idusuario = value;
					NotifyPropertyChanged("IdUsuario");
				}
			}
		}
        private string _diasrecarga;
        public string DiasRecarga
        {
            get
            {
                return _diasrecarga;
            }
            set
            {
                if (value != _diasrecarga)
                {
                    _diasrecarga = value;
                    NotifyPropertyChanged("DiasRecarga");
                }
            }
        }
		private TipoRecarga _tiporecarga;
		public TipoRecarga Tiporecarga
		{
			get
			{
				return _tiporecarga;
			}
			set
			{
				if (value != _tiporecarga)
				{
					_tiporecarga = value;
					NotifyPropertyChanged("TipoRecarga");
				}
			}
		}
		private decimal _montorecargamonedero;
		public decimal MontoRecargaMonedero
		{
			get
			{
				return _montorecargamonedero;
			}
			set
			{
				if (value != _montorecargamonedero)
				{
					_montorecargamonedero = value;
					NotifyPropertyChanged("MontoRecargaMonedero");
				}
			}
		}
		private string _contactorecarga;
		public string ContactoRecarga
		{
			get
			{
				return _contactorecarga;
			}
			set
			{
				if (value != _contactorecarga)
				{
					_contactorecarga = value;
					NotifyPropertyChanged("ContactoRecarga");
				}
			}
		}
		private string _numerorecarga;
		public string NumeroRecarga
		{
			get
			{
				return _numerorecarga;
			}
			set
			{
				if (value != _numerorecarga)
				{
					_numerorecarga = value;
					NotifyPropertyChanged("NumeroRecarga");
				}
				OnRecargaIncompleta(null);
			}
		}
		private int _idformapago;
		public int idFormaPago
		{
			get
			{
				return _idformapago;
			}
			set
			{
				if (value != _idformapago)
				{
					_idformapago = value;
					NotifyPropertyChanged("idFormaPago");
				}
			}
		}
		private int _idtarjeta;
		public int IdTarjeta
		{
			get
			{
				return _idtarjeta;
			}
			set
			{
				if (value != _idtarjeta)
				{
					_idtarjeta = value;
					NotifyPropertyChanged("IdTarjeta");
				}
			}
		}
        private int _idpais;
        public int idpais
        {
            get
            {
                return _idpais;
            }
            set
            {
                if (value != _idpais)
				{
					if (value > 0)
					{
						_idpais = value;
						_idoperadora = 0;
						_idpaquete = 0;
					}
                }
				OnRecargaIncompleta(null);
			}
        }
        private int _idoperadora;
        public int idoperadora
        {
            get
            {
                return _idoperadora;
            }
            set
            {
                if (value != _idoperadora)
                {
                    _idpaquete = 0;
					catOperadora co = LsOperadoras(_idpais).Where(x => x.idoperadora == value).FirstOrDefault();
					if (co != null)
					{
						_idoperadora = value;
					}
                }
				OnRecargaIncompleta(null);
			}
        }
        private int _idpaquete;
        public int idpaquete
        {
            get
            {
                return _idpaquete;
            }
            set
            {
                if (value != _idpaquete)
                {
                    catPaquete cp = LsPaquetes(_idoperadora).Where(x => x.idpaquete == value).FirstOrDefault();
					if (cp != null)
					{
						_idpaquete = value;
					}
                }
				OnRecargaIncompleta(null);
			}
        }

		public event EventHandler<RecargaIncompletaEventArgs> RecargaIncompleta;
		protected virtual void OnRecargaIncompleta(RecargaIncompletaEventArgs e)
		{
			var handler = RecargaIncompleta;
			if (handler != null)
			{
				if (EsIncompleta())
					handler(this, new RecargaIncompletaEventArgs { estaincompleta = true });
				else
					handler(this, new RecargaIncompletaEventArgs { estaincompleta = false });
			}
		}

		public bool EsIncompleta()
		{
			bool ret;
			if (_idpais == 0 || _idoperadora == 0 || _idpaquete == 0 || String.IsNullOrEmpty(_numerorecarga))
				ret = true;
			else
				ret = false;
			return (ret);
		}

		public event EventHandler<EventArgs> RecargaAltaProg;
		protected virtual void OnRecargaAltaProg(EventArgs ea)
		{
			var handler = RecargaAltaProg;
			if (handler != null)
			{
				handler(this, ea);
			}
		}
		public event EventHandler<errRecargaEventArgs> RecargaAltaErr;
		protected virtual void OnRecargaAltaErr(errRecargaEventArgs ea)
		{
			var handler = RecargaAltaErr;
			if (handler != null)
			{
				handler(this, ea);
			}
		}
		/*public event EventHandler<AltaRecargaCompletedEventArgs> RecargaAlta;
		protected virtual void OnRecargaAlta(AltaRecargaCompletedEventArgs ea)
		{
			var handler = RecargaAlta;
			if (handler != null)
			{
				handler(this, ea);
			}
		}
		public event EventHandler<CargaVestaCompletedEventArgs> ProcesadoEnVesta;
		protected virtual void OnProcesadoEnVesta(CargaVestaCompletedEventArgs ea)
		{
			var handler = ProcesadoEnVesta;
			if (handler != null)
			{
				handler(this, ea);
			}
		}
		public event EventHandler<AltaRecargaViaWalletCompletedEventArgs> AltaViaWallet;
		protected virtual void OnAltaViaWallet(AltaRecargaViaWalletCompletedEventArgs ea)
		{
			var handler = AltaViaWallet;
			if (handler != null)
			{
				handler(this, ea);
			}
		}*/
		public event EventHandler<FingerPrintEventArgs> CargaFinger;
		protected virtual void OnCargaFinger(FingerPrintEventArgs ea)
		{
			var handler = CargaFinger;
			if (handler != null)
			{
				handler(this, ea);
			}
		}
		public void Alta()
		{
			Recarga r = new Recarga()
			{
				idusuario = _idusuario,
				idpais = _idpais,
				idoperadora = _idoperadora,
				idpaquete = _idpaquete,
				idformapago = _idformapago,
				idtarjeta = (_idformapago == 2) ? _idtarjeta : -1,
				numerorecarga = _numerorecarga,
				contactorecarga = _contactorecarga,
				fecha = DateTime.Now,
				TransactionID = Guid.NewGuid().ToString(),
				err = -1, // -1 es una recarga recien creada q aun no ha sido procesada (pagada)
				//os = DependencyService.Get<IContactos>().GetOS()
			};
			if (_idformapago == 1) //monedero
			{
				/*EventHandler<AltaRecargaViaWalletCompletedEventArgs> atc = null;
				atc = (s, ea) =>
				{
					App.WS.AltaRecargaViaWalletCompleted -= atc;
					if (ea.Error == null && !ea.Cancelled)
					{
						errRecarga err = JsonConvert.DeserializeObject<errRecarga>(ea.Result);
						r.idrecarga = err.idrecarga;
						r.err = err.err;
						r.errVs = err.errVs;
						r.errRs = err.errRs;
						r.rsauthorization = err.tresp.op_authorization;
						r.rstransactionid = err.tresp.transaction_id;
						r.rsrcode = err.tresp.rcode_description;
						r.printdata = err.tresp.printDatam_data;
						App.db.AltaRecarga(r);
						this._err = err;
						if (err.err == 0)
						{
							string json = "";
							json = App.WSc.GetCatalogo(12, "where idusuario = " + App.usr.idusuario.ToString());
							List<SaldoMonedero> sm = JsonConvert.DeserializeObject<List<SaldoMonedero>>(json);
							if (sm.Count() > 0)
								App.db.DescargaSaldo(sm.FirstOrDefault());
						}
						Device.BeginInvokeOnMainThread(() => OnAltaViaWallet(ea));
					}
					else
						Device.BeginInvokeOnMainThread(() => OnRecargaAltaErr(null));
					App.WS.Close();
				};
				App.Current.IniciaWS();
				App.WS.AltaRecargaViaWalletCompleted += atc;
				r.ip = DependencyService.Get<IContactos>().GetIP();
				App.WS.AltaRecargaViaWalletAsync(ConvertRecargaToTemp(r));
                */
			}
			else { //2 tarjeta
				/*EventHandler<CargaVestaCompletedEventArgs> av = null;
				av = (s, ea) =>
				{
					App.WS.CargaVestaCompleted -= av;
					if (ea.Error == null && !ea.Cancelled)
					{
						errRecarga err = JsonConvert.DeserializeObject<errRecarga>(ea.Result);
						r.err = err.err;
						r.errVs = err.errVs;
						r.errRs = err.errRs;
						r.PaymentID = err.PaymentID;
						r.rsauthorization = err.tresp.op_authorization;
						r.rstransactionid = err.tresp.transaction_id;
						r.rsrcode = err.tresp.rcode_description;
						App.db.AltaRecarga(r);
						this._err = err;
						Device.BeginInvokeOnMainThread(() => OnProcesadoEnVesta(ea));
					}
					else
						Device.BeginInvokeOnMainThread(() => OnRecargaAltaErr(null));
					App.WS.Close();
				};
				EventHandler<AltaRecargaCompletedEventArgs> atc = null;
				atc = async (s, ea) =>
				{
					App.WS.AltaRecargaCompleted -= atc;
					if (ea.Error == null && !ea.Cancelled)
					{
						tags = JsonConvert.DeserializeObject<GetSessionTags>(ea.Result);
						Device.BeginInvokeOnMainThread(() => OnCargaFinger(new FingerPrintEventArgs { url = Constantes.FingerprintAPI, orgid = tags.OrgID, webses = tags.WebSessionID } ));
						await Task.Delay(TimeSpan.FromSeconds(30));
						//---	iOS		---
						//await LlamaFingerp(tags);
						//---			---
						r.idrecarga = tags.idrecarga;
						App.db.AltaRecarga(r);
						App.WS.CargaVestaCompleted += av;
						App.WS.CargaVestaAsync(ConvertRecargaToTemp(r), null, tags.WebSessionID);
					}
					else
						Device.BeginInvokeOnMainThread(() => OnRecargaAltaErr(null));
				};
				App.Current.IniciaWS();
				App.WS.AltaRecargaCompleted += atc;
				r.ip = DependencyService.Get<IContactos>().GetIP();
				App.WS.AltaRecargaAsync(ConvertRecargaToTemp(r));*/
			}
		}

        /*private tempuri.org.RecargaMonedero ConvertRecargaMonToTemp(RecargaMonedero rm)
		{
			tempuri.org.RecargaMonedero torm = new tempuri.org.RecargaMonedero()
			{
				ip = rm.ip,
				idusuario = rm.idusuario,
				idrecargamonedero = rm.idrecargamonedero,
				idtarjeta = rm.idtarjeta,
				monto = rm.monto,
				fecha = rm.fecha,
				TransactionID = rm.TransactionID,
				err = rm.err,

			};
			return (torm);
		}*/

        /*private tempuri.org.Recarga ConvertRecargaToTemp(Recarga r)
		{
			tempuri.org.Recarga tor = new tempuri.org.Recarga()
			{
				ip = r.ip,
				idusuario = r.idusuario,
				idrecarga = r.idrecarga,
				idpais = r.idpais,
				idoperadora = r.idoperadora,
				idpaquete = r.idpaquete,
				idformapago = r.idformapago,
				idtarjeta = r.idtarjeta,
				numerorecarga = r.numerorecarga,
				contactorecarga = r.contactorecarga,
				fecha = r.fecha,
				TransactionID = r.TransactionID,
				err = r.err,
				os = r.os,
			};
			return (tor);
		}*/
        /*private tempuri.org.RecargaProg ConvertRecargaProgToTemp(RecargaProg r)
		{
			tempuri.org.RecargaProg tor = new tempuri.org.RecargaProg()
			{
				idusuario = r.idusuario,
				idrecarga = r.idrecarga,
				idpais = r.idpais,
				idoperadora = r.idoperadora,
				idpaquete = r.idpaquete,
				idformapago = r.idformapago,
				idtarjeta = r.idtarjeta,
				numerorecarga = r.numerorecarga,
				contactorecarga = r.contactorecarga,
				diasmes = r.diasmes,
			};
			return (tor);
		}*/

        /*public void AltaProg()
        {
            RecargaProg r = new RecargaProg()
            {
				idusuario = _idusuario,
				idpais = _idpais,
                idoperadora = _idoperadora,
                idpaquete = _idpaquete,
                idformapago = _idformapago,
                idtarjeta = (_idformapago == 2) ? _idtarjeta : -1,
                numerorecarga = _numerorecarga,
                contactorecarga = _contactorecarga,
                diasmes = _diasrecarga,
            };

			EventHandler<AltaRecargaProgCompletedEventArgs> atc = null;
			atc = (s, ea) =>
			{
				App.WS.AltaRecargaProgCompleted -= atc;
				if (ea.Error == null && !ea.Cancelled)
				{
					r.idrecarga = ea.Result;
					App.db.AltaRecargaProg(r);
					Device.BeginInvokeOnMainThread(() => OnRecargaAltaProg(null));
				}
				else
					Device.BeginInvokeOnMainThread(() => OnRecargaAltaErr(null));
			};
			App.Current.IniciaWS();
			App.WS.AltaRecargaProgCompleted += atc;
			App.WS.AltaRecargaProgAsync(ConvertRecargaProgToTemp(r));
        }

        public void AltaMonedero()
		{
			RecargaMonedero rm = new RecargaMonedero()
			{
				idusuario = _idusuario,
				idtarjeta = (_idformapago == 2) ? _idtarjeta : -1,
				monto = _montorecargamonedero,
				fecha = DateTime.Now,
				TransactionID = Guid.NewGuid().ToString(),
				os = DependencyService.Get<IContactos>().GetOS(),
				err = -1 // -1 es una recarga recien creada q aun no ha sido procesada (pagada)
			};
			EventHandler<CargaVestaCompletedEventArgs> av = null;
			av = (s, ea) =>
			{
				App.WS.CargaVestaCompleted -= av;
				if (ea.Error == null && !ea.Cancelled)
				{
					errRecarga err = JsonConvert.DeserializeObject<errRecarga>(ea.Result);
					rm.err = err.err;
					rm.errVs = err.errVs;
					rm.PaymentID = err.PaymentID;
					if (err.err == 0)
					{
						App.db.AltaRecargaMonedero(rm, true);
						string json = "";
						json = App.WSc.GetCatalogo(12, "where idusuario = " + App.usr.idusuario.ToString());
						List<SaldoMonedero> sm = JsonConvert.DeserializeObject<List<SaldoMonedero>>(json);
						if (sm.Count() > 0)
							App.db.DescargaSaldo(sm.FirstOrDefault());
						_montorecargamonedero = App.db.SelSaldo().saldo;
					}
					else
						App.db.AltaRecargaMonedero(rm, false);
					this._err = err;
					Device.BeginInvokeOnMainThread(() => OnProcesadoEnVesta(ea));
				}
				else
					Device.BeginInvokeOnMainThread(() => OnRecargaAltaErr(null));
				App.WS.Close();
			};

			EventHandler<AltaRecargaMonederoCompletedEventArgs> atc = null;
			atc = async (s, ea) =>
			{
				App.WS.AltaRecargaMonederoCompleted -= atc;
				if (ea.Error == null && !ea.Cancelled)
				{
					tags = JsonConvert.DeserializeObject<GetSessionTags>(ea.Result);
					Device.BeginInvokeOnMainThread(() => OnCargaFinger(new FingerPrintEventArgs { url = Constantes.FingerprintAPI, orgid = tags.OrgID, webses = tags.WebSessionID }));
					await Task.Delay(TimeSpan.FromSeconds(30));
					rm.idrecargamonedero = tags.idrecarga; //tags regresa idr o idr monedero segun sea el caso, en el mismo campo "idrecarga"
					App.db.AltaRecargaMonedero(rm, false);
					App.WS.CargaVestaCompleted += av;
					App.WS.CargaVestaAsync(null, ConvertRecargaMonToTemp(rm), tags.WebSessionID);
				}
				else
					Device.BeginInvokeOnMainThread(() => OnRecargaAltaErr(null));
			};
			App.Current.IniciaWS();
			App.WS.AltaRecargaMonederoCompleted += atc;
			rm.ip = DependencyService.Get<IContactos>().GetIP();
			App.WS.AltaRecargaMonederoAsync(ConvertRecargaMonToTemp(rm));
		}

		public void Refresh()
		{
			_idoperadora = 0;
			_idpaquete = 0;
			_numerorecarga = "";
			_contactorecarga = "";
			_idformapago = 0;
			_idtarjeta = 0;

			_opcpais = new opcMenu(1, 0, "Pais", "Seleccione un pais", new FileImageSource() { File = "globe.png" });
			if (App.usr.idpais != 0)
			{
				_opcpais.idOpcion = App.usr.idpais;
				_opcpais.Desc = lsPais().Where(x => x.idpais == App.usr.idpais).FirstOrDefault().pais;
			}
			_opcoperadora = new opcMenu(2, 0, "Compañia", "Seleccione una compañia", new FileImageSource() { File = "radiotower.png" });
			_opcnumero = new opcMenu(3, 0, "Numero", "Seleccione un numero", new FileImageSource() { File = "phone.png" });
			_opcpaquete = new opcMenu(4, 0, "Monto", "Seleccione un monto", new FileImageSource() { File = "money.png" });
			_opccupon = new opcMenu(5, 0, "Cupon", "Seleccione un cupon", new FileImageSource() { File = "shop.png" });
			_opclimpiar = new opcMenu(6, 0, "Limpiar", "Nueva recarga (limpiar campos)", new FileImageSource() { File = "backward.png" });

			NotifyPropertyChanged("IdTarjeta");
			NotifyPropertyChanged("idFormaPago");
			NotifyPropertyChanged("idpaquete");
			NotifyPropertyChanged("idoperadora");
			NotifyPropertyChanged("NumeroRecarga");
			NotifyPropertyChanged("ContactoRecarga");
			NotifyPropertyChanged("opcOperadora");
			NotifyPropertyChanged("opcPaquete");
		}
        public List<Recarga> SelRecargas()
        {
            return App.db.SelRecargas();
        }
		public List<RecargaMonedero> SelRecargasWallet()
		{
			return App.db.SelRecargasWallet();
		}
        public List<RecargaFrecuente> SelRecargasFrecuentes()
        {
            return App.db.SelRecargasFrecuentes();
        }
        public List<RecargaProg> SelRecargasProg()
        {
            return App.db.SelRecargasProg();
        }
        public void DelRecargaFrecuente(RecargaProg rf)
        {
            App.db.DelRecargaFrecuente(rf);
        }
        */

        public RecargasViewModel()
        {
            ReadOnly = false;
            EdicionOnly = false;
        }
        public string GetExternalIP()
        {
            try
            {
                using (WebClient client = new WebClient())
                {
                    client.Headers["User-Agent"] =
                    "Mozilla/4.0 (Compatible; Windows NT 5.1; MSIE 6.0) " +
                    "(compatible; MSIE 6.0; Windows NT 5.1; " +
                    ".NET CLR 1.1.4322; .NET CLR 2.0.50727)";
                    try
                    {
                        byte[] arr = client.DownloadData("http://checkip.amazonaws.com/");
                        string response = System.Text.Encoding.UTF8.GetString(arr);
                        return response.Trim();
                    }
                    catch (WebException ex)
                    {
                        try
                        {
                            byte[] arr = client.DownloadData("http://icanhazip.com/");
                            string response = System.Text.Encoding.UTF8.GetString(arr);
                            return response.Trim();
                        }
                        catch (WebException exc)
                        { return ""; }
                    }
                }
            }
            catch (Exception ex)
            {
                return "";
            }
        }
    }

    public class Response3dSecure
    {
        public bool err { get; set; }
        public string desc { get; set; }
    }
    public class FingerPrintEventArgs : EventArgs
	{
		public string url { get; set; }
		public string orgid { get; set; }
		public string webses { get; set; }
	}
	public class RecargaIncompletaEventArgs : EventArgs
	{
		public bool estaincompleta { get; set; }
	}
	public class errRecargaEventArgs : EventArgs
	{
		public string printdata { get; set; }
	}
    public class ChargeAccountToTemporaryToken
    {
        public string ChargeAccountNumberToken { get; set; }
        public string PaymentDeviceLast4 { get; set; }
        public int PaymentDeviceTypeCD { get; set; }
        public int ResponseCode { get; set; }
        public string ResponseText { get; set; }
    }
    public class GetSessionTags
	{
		public string OrgID { get; set; }
		public int ResponseCode { get; set; }
		public string ResponseText { get; set; }
		public string WebSessionID { get; set; }
		public int idrecarga { get; set; }
	}
    public class errRecarga
    {
        public int idtarjeta { get; set; }
        public int idrecarga { get; set; }
        public string PaymentID { get; set; }
        public int err { get; set; }
        public int errVs { get; set; }
        public int errRs { get; set; }
        public tresp tresp { get; set; }
    }

    public class tresp
    {
        public string printDatam_data { get; set; }
        public string op_authorization { get; set; }
        public string transaction_id { get; set; }
        public string rcode_description { get; set; }
    }



}
