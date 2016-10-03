$(document).ready(function() { 

	/* MAIN MENU */
	$('#main-menu > li:has(ul.sub-menu)').addClass('parent');
	$('ul.sub-menu > li:has(ul.sub-menu) > a').addClass('parent');

	$('#menu-toggle').click(function() {
		$('#main-menu').slideToggle(300);
		return false;
	});

	$(window).resize(function() {
		if ($(window).width() > 700) {
			$('#main-menu').removeAttr('style');
		}
	});

});

$(document).on("click", "#cabeza", function(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 

	today = yyyy+'-'+mm+'-'+dd;

	try{
		document.getElementById("bill_fecha").setAttribute("max", today);
	}catch(e){}

	try{
		document.getElementById("lincense_fechaInicio").setAttribute("max", today);
	}catch(e){}

	try{
	document.getElementById("employee_fecha_ingreso").setAttribute("max", today);
	}catch(e){}

	try{
	document.getElementById("fecha_fecha").setAttribute("min", today);
	document.getElementById("fecha_fecha").setAttribute("max", today);
	}catch(e){}
	try{
	document.getElementById("order_fecha").setAttribute("min", today);
	document.getElementById("order_fecha").setAttribute("max", today);

	document.getElementById("order_fecha_final").setAttribute("min", today);
	yyyy = today.getFullYear()+1;
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("order_fecha_final").setAttribute("max", today);
	}catch(e){}
	
});

$(function validar_numero(field){
	var num=field.value;
	try{
		var x = parseInt(field.value);
	}
	catch(e){
		var x = field.value.substr(0,field.value.length-2);
		field.setAttribute("value", x);
	}
});

$(function holamundo() {

	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	 if(dd<10){
	        dd='0'+dd
	    } 
	    if(mm<10){
	        mm='0'+mm
	    } 

	today = yyyy+'-'+mm+'-'+dd;

	try{
		document.getElementById("bill_fecha").setAttribute("max", today);
	}catch(e){}

	try{
		document.getElementById("lincense_fechaInicio").setAttribute("max", today);
	}catch(e){}

	try{
	document.getElementById("employee_fecha_ingreso").setAttribute("max", today);
	}catch(e){}

	try{
	document.getElementById("fecha_fecha").setAttribute("min", today);
	document.getElementById("fecha_fecha").setAttribute("max", today);
	}catch(e){}
	try{
	document.getElementById("order_fecha").setAttribute("min", today);
	document.getElementById("order_fecha").setAttribute("max", today);

	document.getElementById("order_fecha_final").setAttribute("min", today);
	yyyy = today.getFullYear()+1;
	today = yyyy+'-'+mm+'-'+dd;
	document.getElementById("order_fecha_final").setAttribute("max", today);
	}catch(e){}

});

