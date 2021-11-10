/*
Name: 			Utilitario para vistas
Written by: 	Cesar Huachua
Theme Version: 	1.0
*/ 

    var letters=' ABCÇDEFGHIJKLMNÑOPQRSTUVWXYZabcçdefghijklmnñopqrstuvwxyzàáÀÁéèÈÉíìÍÌïÏóòÓÒúùÚÙüÜ'
	var numbers='1234567890'
	var signs=',.:;@-\''
	var mathsigns='+-=()*/'
	var custom='<>#$%&?¿'
		
	function setCookie(cname, cvalue, exdays) {
	    var d = new Date();
	    d.setTime(d.getTime() + (exdays*24*60*60*1000));
	    var expires = "expires="+ d.toUTCString();
	    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
	}
    
    function getCookie(cname) {
        var name = cname + "=";
        var decodedCookie = decodeURIComponent(document.cookie);
        var ca = decodedCookie.split(';');
        for(var i = 0; i <ca.length; i++) {
            var c = ca[i];
            while (c.charAt(0) == ' ') {
                c = c.substring(1);
            }
            if (c.indexOf(name) == 0) {
                return c.substring(name.length, c.length);
            }
        }
        return "";
    }

	function alpha(e,allow) {
	     var k;
	     k=document.all?parseInt(e.keyCode): parseInt(e.which);
	     return (allow.indexOf(String.fromCharCode(k))!=-1);
	}

function callNotification(type, msm, title){
	    
	 new PNotify({
			title: title,
			text: msm,
			type: type
		});


 }


function OpenWindowWithPost(url, windowoption, name, params,tipo){
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", url);
    
    if(tipo=="popup"){
    form.setAttribute("target", name);
    }


    for (var i in params) {
        if (params.hasOwnProperty(i)) {
            var input = document.createElement('input');
            input.type = 'hidden';
            input.name = i;
            input.value = params[i];
            form.appendChild(input);
        }
    }
    
    document.body.appendChild(form);
    
  if(tipo=="page"){
    window.location="load.htm";
  }else{
    var ancho=1180;
	    var alto=500;
    var posicion_x; 
    var posicion_y;
    posicion_x=(screen.width/2)-(ancho/2);
    posicion_y=(screen.height/2)-(alto/2);
   window.open("", name, "width=1180,height=500,menubar=0,toolbar=0,directories=0,scrollbars=no,resizable=no,left="+posicion_x+",top="+posicion_y+"");
        }
    
    form.submit();
    
    document.body.removeChild(form);
}
