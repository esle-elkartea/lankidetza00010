<%
ResourceBundle diccionario  = null;
ResourceBundle propiedades  = null;
propiedades = ResourceBundle.getBundle("net/idtoki/amicyf/app/config/amicyf-config");
diccionario = ResourceBundle.getBundle("net/idtoki/amicyf/app/diccionario/diccionario");
String alias = propiedades.getString("amicyf.alias.estatico");
%>