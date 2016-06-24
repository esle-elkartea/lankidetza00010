function inputCombo(){
	this.lista = new Array();
	this.lista[0]="primero"; 
	this.lista[1]="segundo";
	this.lista[2]="tercero";
	this.lista[3]="caurtoo";
	this.lista[4]="quintoo";
	this.lista[5]="sextooo";
	this.lista[6]="septimo";
	this.lista[7]="ocatavo";
	this.lista[8]="novenoo";
	this.lista[9]="decimoo";
	this.lista[10]="primera";
	this.lista[11]="segunda";
	this.lista[12]="tercera";
	this.lista[13]="cuartaa";
	this.lista[14]="quintaa";
	this.lista[15]="sextaaa";
	this.lista[16]="septima";
	this.lista[17]="octavaa";		
	this.lista[18]="novenaa";
	this.lista[19]="decimaa";
	
	this.posicionActual = -1;
	this.nombre = "nombre";	
	this.expresion = "";
}

function mueveArray(evt){
 evt = (evt) ? evt : event;
 var charCode = (evt.charCode) ? evt.charCode : ((evt.keyCode) ? evt.keyCode :
     ((evt.which) ? evt.which : 0));
 if (charCode ==  38){
 	if(this.lista.length - 1  > this.posicionActual){
  		this.posicionActual = this.posicionActual + 1;
  		this.actualizarElemento();
  	}
  	return true;
 }else if (charCode ==  40){
	if(this.posicionActual > 0){
		this.posicionActual = this.posicionActual - 1;
  		this.actualizarElemento();
  	}
  	return true;
 }else{
 	this.actualizarLista();
 	this.posicionActual = 0;
	this.actualizarElemento();
 	return true;
 }
}
inputCombo.prototype.mueveArray= mueveArray;

function getElementoActual(){
	//alert("elemento a mostrar: "+ this.lista[this.posicionActual]);
	return this.lista[this.posicionActual];
}
inputCombo.prototype.getElementoActual= getElementoActual;

function actualizarElemento(){
	document.forms[0].elements[this.nombre].value = this.getElementoActual();
}
inputCombo.prototype.actualizarElemento= actualizarElemento;

function actualizarLista(){
  //aqui la funcion que actualiza la lista según el criterio
  var reg = /a/i;
  var listaIntermedia = new Array()
  var contador = 0
  for (i=0;i<this.lista.length;i++){
  	if(reg.test(this.lista[i])){
  		listaIntermedia[contador]=this.lista[i];
  		contador +=1;
  	}	
  }
  this.lista = listaIntermedia;
}
inputCombo.prototype.actualizarLista= actualizarLista;