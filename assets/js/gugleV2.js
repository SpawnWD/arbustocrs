var googleUser = {};
var startApp = function() {
    gapi.load('auth2', function(){
        // Retrieve the singleton for the GoogleAuth library and set up the client.
        auth2 = gapi.auth2.init({
            client_id: '575858484188-fu504sovv3e4nfo87af9152t9jpcvks5.apps.googleusercontent.com',
            cookiepolicy: 'single_host_origin',
            // Request scopes in addition to 'profile' and 'email'
            //scope: 'additional_scope'
        });
        attachSignin(document.getElementById('btnGG'));
    });
};
function attachSignin(element) {
    auth2.attachClickHandler(element, {},
	
        function(googleUser) {
            var usr = googleUser.getBasicProfile();
            var obj = {name:usr.getName(), email:usr.getEmail(), picture:{data:{url:usr.getImageUrl()}}};
            var jsonString = JSON.stringify(obj);
			
		    var redirect = 'registro.aspx';
			
            $.redirectPost(redirect, { data: jsonString });
        }, function(error) {
            alert(JSON.stringify(error, undefined, 2));
			
			 var redirect = 'registro.aspx';
			   $.redirectPost(redirect);
    //    $.redirectPost(redirect, { data: JSON.stringify(response) });
        });
}

function GGsignOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
        console.log('User signed out.');
    });
}
//--------------------------------------------------------------------------------------------

