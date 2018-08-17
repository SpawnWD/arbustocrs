using System;
//using Xamarin.Forms;
using System.Collections.ObjectModel;
using System.Threading.Tasks;
using System.Linq;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace MasTicket
{

    public class CatalogosViewModel : BaseViewModel
    {
        private wsac.IsacClient ws;
        public wsac.IsacClient WS
        {
            set
            {
                ws = value;
                Inicia();
            }
            get { return ws; }
        }
        private ObservableCollection<catErrores> lserrores;
		public ObservableCollection<catErrores> lsErrores()
		{
			return (lserrores);
		}
        private ObservableCollection<catPais> lspais;
        public ObservableCollection<catPais> lsPais()
        {
            return (lspais);
        }
        private ObservableCollection<catEstado> lsestados;
        public ObservableCollection<catEstado> lsEstados()
        {
            return (lsestados);
        }
        public ObservableCollection<catEstado> lsEstados(int idp)
        {
            return (lsestados.Where(x => x.idpais == idp).ToObservableCollection());
        }
        private ObservableCollection<catMunicipio> lsmunicipios;
        public ObservableCollection<catMunicipio> lsMunicipios()
        {
            return (lsmunicipios);
        }
        public ObservableCollection<catMunicipio> lsMunicipios(int ide)
        {
            return (lsmunicipios.Where(x => x.idestado == ide).ToObservableCollection());
        }
        private ObservableCollection<catOperadora> lsoperadoras;
        public ObservableCollection<catOperadora> LsOperadoras(int idp)
        {
            return (lsoperadoras.Where(x => x.idpais == idp).ToObservableCollection());
        }
        public ObservableCollection<catOperadora> LsOperadoras()
        {
            return (lsoperadoras.ToObservableCollection());
        }

        private ObservableCollection<catPaquete> lspaquetes;
        public ObservableCollection<catPaquete> LsPaquetes(int ido)
        {
            return (lspaquetes.Where(x => x.idoperadora == ido).ToObservableCollection());
        }
        public ObservableCollection<catPaquete> LsPaquetes()
        {
            return (lspaquetes.ToObservableCollection());
        }

        private ObservableCollection<catFormasPago> lstformaspago;
		public ObservableCollection<catFormasPago> LstFormasPago()
		{
			return (lstformaspago);
		}

		private ObservableCollection<catEmisorTC> lsemisores;
		public ObservableCollection<catEmisorTC> LsEmisores()
		{
			return (lsemisores);
		}


        public CatalogosViewModel()
        {
            lstformaspago = new ObservableCollection<catFormasPago>();
            lstformaspago.Add(new catFormasPago() { idformapago = 1, formapago = "Monedero" });
            lstformaspago.Add(new catFormasPago() { idformapago = 2, formapago = "Tarjeta" });
        }
        public void Inicia()
        {
            lsoperadoras = JsonConvert.DeserializeObject<List<catOperadora>>(ws.GetCatalogo(1, "")).ToObservableCollection();
            lspaquetes = JsonConvert.DeserializeObject<List<catPaquete>>(ws.GetCatalogo(3, "")).ToObservableCollection();
            lsemisores = JsonConvert.DeserializeObject<List<catEmisorTC>>(ws.GetCatalogo(4, "")).ToObservableCollection();
        }
    }
}
