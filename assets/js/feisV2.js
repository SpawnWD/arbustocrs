$.extend(
{
    redirectPost: function (location, args) {
        var form = $('<form></form>');
        form.attr("method", "post");
        form.attr("action", location);

        $.each(args, function (key, value) {
            var field = $('<input></input>');

            field.attr("type", "hidden");
            field.attr("name", key);
            field.attr("value", value);

            form.append(field);
        });
        $(form).appendTo('body').submit();
    }
});

function statusChangeCallback(response) {
    if (response.status === 'connected') {
        getUserInfo();
    } else if (response.status === 'not_authorized') {
        FBLogin();
    } else {
        FBLogin();
    }
}

function checkLoginState() {
    FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
    });
}

function IniciarFeis() {
    window.fbAsyncInit = function () {
        FB.init({
            appId: '1380281871986278',
            cookie: true, 
            xfbml: true,  // parse social plugins on this page
            version: 'v2.7' 
        });
    };
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    //FB.getLoginStatus(function(response) {
    //    statusChangeCallback(response);
    //});
}

function getUserInfo(token) {
    FB.api('/me', 'get', { access_token: token, fields: 'id,first_name,last_name,name,gender,email,picture' }, 
	function (response) {
		
        var redirect = 'registro.aspx';
	    $.redirectPost(redirect, { data: JSON.stringify(response) });
		
			 
        //alert(response);
        /*$.ajax({
              type: "POST",
              dataType: 'text',
              data: response,
              url: 'registro.aspx',
              success: function(msg) {
              },
              error: function (xhr, ajaxOptions, thrownError) {
                  alert(xhr.status);
                  alert(thrownError);
              }
        });*/

    });
}

function FBLogout()
{
    FB.logout(function(response) {
        $('#fblogin').show();
        $('#fbstatus').hide();
    });
}

function FBLogin()
{
    FB.login(function(response) {
        if (response.authResponse) {
            var token = response.authResponse.accessToken;
            getUserInfo(token);
        } else {
			 var redirect = 'registro.aspx';
          $.redirectPost(redirect, { data: jsonString });
            //alert('Authorization failed.');
        }
    },{scope: 'public_profile,email'});
}
