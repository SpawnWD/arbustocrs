// ------------------------------------------------------------------------------
//  <autogenerated>
//      This code was generated by a tool.
//      Mono Runtime Version: 4.0.30319.42000
// 
//      Changes to this file may cause incorrect behavior and will be lost if 
//      the code is regenerated.
//  </autogenerated>
// ------------------------------------------------------------------------------

namespace MasTicket.wsMoon {
    using System.Diagnostics;
    using System;
    using System.Xml.Serialization;
    using System.ComponentModel;
    using System.Web.Services.Protocols;
    using System.Web.Services;
    
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    [System.Web.Services.WebServiceBindingAttribute(Name="wsMoonSoap", Namespace="http://tempuri.org/")]
    public partial class wsMoon : System.Web.Services.Protocols.SoapHttpClientProtocol {
        
        private System.Threading.SendOrPostCallback getTIMOperationCompleted;
        
        private System.Threading.SendOrPostCallback getTIMPerOperationCompleted;
        
        private System.Threading.SendOrPostCallback getSALDOSOperationCompleted;
        
        private System.Threading.SendOrPostCallback getSNOperationCompleted;
        
        /// CodeRemarks
        public wsMoon() {
            this.Url = "http://recargaselltesting.ddns.net/wsmoon/wsMoon.asmx";
        }
        
        public wsMoon(string url) {
            this.Url = url;
        }
        
        /// CodeRemarks
        public event getTIMCompletedEventHandler getTIMCompleted;
        
        /// CodeRemarks
        public event getTIMPerCompletedEventHandler getTIMPerCompleted;
        
        /// CodeRemarks
        public event getSALDOSCompletedEventHandler getSALDOSCompleted;
        
        /// CodeRemarks
        public event getSNCompletedEventHandler getSNCompleted;
        
        /// CodeRemarks
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/getTIM", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string getTIM(string key, string user, string password, string tp) {
            object[] results = this.Invoke("getTIM", new object[] {
                        key,
                        user,
                        password,
                        tp});
            return ((string)(results[0]));
        }
        
        /// CodeRemarks
        public void getTIMAsync(string key, string user, string password, string tp) {
            this.getTIMAsync(key, user, password, tp, null);
        }
        
        /// CodeRemarks
        public void getTIMAsync(string key, string user, string password, string tp, object userState) {
            if ((this.getTIMOperationCompleted == null)) {
                this.getTIMOperationCompleted = new System.Threading.SendOrPostCallback(this.OngetTIMOperationCompleted);
            }
            this.InvokeAsync("getTIM", new object[] {
                        key,
                        user,
                        password,
                        tp}, this.getTIMOperationCompleted, userState);
        }
        
        private void OngetTIMOperationCompleted(object arg) {
            if ((this.getTIMCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.getTIMCompleted(this, new getTIMCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// CodeRemarks
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/getTIMPer", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string getTIMPer(string key, string user, string password, string tp, string dINI, string dFIN) {
            object[] results = this.Invoke("getTIMPer", new object[] {
                        key,
                        user,
                        password,
                        tp,
                        dINI,
                        dFIN});
            return ((string)(results[0]));
        }
        
        /// CodeRemarks
        public void getTIMPerAsync(string key, string user, string password, string tp, string dINI, string dFIN) {
            this.getTIMPerAsync(key, user, password, tp, dINI, dFIN, null);
        }
        
        /// CodeRemarks
        public void getTIMPerAsync(string key, string user, string password, string tp, string dINI, string dFIN, object userState) {
            if ((this.getTIMPerOperationCompleted == null)) {
                this.getTIMPerOperationCompleted = new System.Threading.SendOrPostCallback(this.OngetTIMPerOperationCompleted);
            }
            this.InvokeAsync("getTIMPer", new object[] {
                        key,
                        user,
                        password,
                        tp,
                        dINI,
                        dFIN}, this.getTIMPerOperationCompleted, userState);
        }
        
        private void OngetTIMPerOperationCompleted(object arg) {
            if ((this.getTIMPerCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.getTIMPerCompleted(this, new getTIMPerCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// CodeRemarks
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/getSALDOS", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public string getSALDOS(string key, string user, string password, string tp) {
            object[] results = this.Invoke("getSALDOS", new object[] {
                        key,
                        user,
                        password,
                        tp});
            return ((string)(results[0]));
        }
        
        /// CodeRemarks
        public void getSALDOSAsync(string key, string user, string password, string tp) {
            this.getSALDOSAsync(key, user, password, tp, null);
        }
        
        /// CodeRemarks
        public void getSALDOSAsync(string key, string user, string password, string tp, object userState) {
            if ((this.getSALDOSOperationCompleted == null)) {
                this.getSALDOSOperationCompleted = new System.Threading.SendOrPostCallback(this.OngetSALDOSOperationCompleted);
            }
            this.InvokeAsync("getSALDOS", new object[] {
                        key,
                        user,
                        password,
                        tp}, this.getSALDOSOperationCompleted, userState);
        }
        
        private void OngetSALDOSOperationCompleted(object arg) {
            if ((this.getSALDOSCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.getSALDOSCompleted(this, new getSALDOSCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// CodeRemarks
        [System.Web.Services.Protocols.SoapDocumentMethodAttribute("http://tempuri.org/getSN", RequestNamespace="http://tempuri.org/", ResponseNamespace="http://tempuri.org/", Use=System.Web.Services.Description.SoapBindingUse.Literal, ParameterStyle=System.Web.Services.Protocols.SoapParameterStyle.Wrapped)]
        public bool getSN(string key, string user, string password, string op, string data) {
            object[] results = this.Invoke("getSN", new object[] {
                        key,
                        user,
                        password,
                        op,
                        data});
            return ((bool)(results[0]));
        }
        
        /// CodeRemarks
        public void getSNAsync(string key, string user, string password, string op, string data) {
            this.getSNAsync(key, user, password, op, data, null);
        }
        
        /// CodeRemarks
        public void getSNAsync(string key, string user, string password, string op, string data, object userState) {
            if ((this.getSNOperationCompleted == null)) {
                this.getSNOperationCompleted = new System.Threading.SendOrPostCallback(this.OngetSNOperationCompleted);
            }
            this.InvokeAsync("getSN", new object[] {
                        key,
                        user,
                        password,
                        op,
                        data}, this.getSNOperationCompleted, userState);
        }
        
        private void OngetSNOperationCompleted(object arg) {
            if ((this.getSNCompleted != null)) {
                System.Web.Services.Protocols.InvokeCompletedEventArgs invokeArgs = ((System.Web.Services.Protocols.InvokeCompletedEventArgs)(arg));
                this.getSNCompleted(this, new getSNCompletedEventArgs(invokeArgs.Results, invokeArgs.Error, invokeArgs.Cancelled, invokeArgs.UserState));
            }
        }
        
        /// CodeRemarks
        public new void CancelAsync(object userState) {
            base.CancelAsync(userState);
        }
    }
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    public delegate void getTIMCompletedEventHandler(object sender, getTIMCompletedEventArgs e);
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class getTIMCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal getTIMCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// CodeRemarks
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    public delegate void getTIMPerCompletedEventHandler(object sender, getTIMPerCompletedEventArgs e);
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class getTIMPerCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal getTIMPerCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// CodeRemarks
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    public delegate void getSALDOSCompletedEventHandler(object sender, getSALDOSCompletedEventArgs e);
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class getSALDOSCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal getSALDOSCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// CodeRemarks
        public string Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((string)(this.results[0]));
            }
        }
    }
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    public delegate void getSNCompletedEventHandler(object sender, getSNCompletedEventArgs e);
    
    /// CodeRemarks
    [System.CodeDom.Compiler.GeneratedCodeAttribute("XamarinStudio", "7.0.1.24")]
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.ComponentModel.DesignerCategoryAttribute("code")]
    public partial class getSNCompletedEventArgs : System.ComponentModel.AsyncCompletedEventArgs {
        
        private object[] results;
        
        internal getSNCompletedEventArgs(object[] results, System.Exception exception, bool cancelled, object userState) : 
                base(exception, cancelled, userState) {
            this.results = results;
        }
        
        /// CodeRemarks
        public bool Result {
            get {
                this.RaiseExceptionIfNecessary();
                return ((bool)(this.results[0]));
            }
        }
    }
}
