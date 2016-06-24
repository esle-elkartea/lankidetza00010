var ventanaCalendario=false

function muestraCalendario(raiz,formulario_destino,campo_destino,mes_destino,ano_destino){
	//funcion para abrir una ventana con un calendario.
	//Se deben indicar los datos del formulario y campos que se desean editar con el calendario, es decir, los campos donde va la fecha.
	if (typeof ventanaCalendario.document == "object") {
		ventanaCalendario.close()
	}
	ventanaCalendario = window.open("calendario/index.php?formulario=" + formulario_destino + "&nomcampo=" + campo_destino,"calendario","width=165,height=200,left=0,top=0")
}
var ventanaVentana=false

function muestraVentana(raiz,formulario_destino,campo_destino,idEmp){
	//funcion para abrir una ventana con un calendario.
	//Se deben indicar los datos del formulario y campos que se desean editar con el calendario, es decir, los campos donde va la fecha.
	if (typeof ventanaVentana.document == "object") {
		ventanaVentana.close()
	}
	ventanaVentana = window.open("calendario/asigUser.php?idEmp="+idEmp+"&formulario=" + formulario_destino + "&nomcampo=" + campo_destino,"calendario","width=165,height=200,left=0,top=0,scrollbars=no,menubars=no,statusbar=NO,status=NO,resizable=YES,location=NO")
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}