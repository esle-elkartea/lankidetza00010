# S�lo consola
#handlers= java.util.logging.ConsoleHandler

# Consola y fichero
handlers= java.util.logging.FileHandler

############################################################
# Niveles de traza
# .level= ALL
# .level= FINEST
# .level= FINER
# .level= FINE
# .level= CONFIG
# .level= INFO
# .level= WARNING
# .level= SEVERE
# .level= OFF
############################################################

# M�ximo nivel a trazar, salvo indicaci�n m�s precisa
.level= SEVERE

############################################################
# En consola
############################################################

#java.util.logging.ConsoleHandler.level = SEVERE
#java.util.logging.ConsoleHandler.formatter = java.util.logging.SimpleFormatter

############################################################
# En fichero
############################################################

#java.util.logging.FileHandler.pattern = C:/amiCyF-app/jetty-5.1.4/logs/amicyf.log
java.util.logging.FileHandler.pattern = C:/amicyf-app/amicyf.log
java.util.logging.FileHandler.level = SEVERE
java.util.logging.FileHandler.formatter = java.util.logging.XMLFormatter


############################################################
# Nivel espec�fico de un paquete [y clase]
############################################################
