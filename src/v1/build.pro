####################################################################
#
#
#archivo de configuración de la aplicacion consta de un parte para el 
#despliegue en tomcat y otra para el uso del torque-gen
#
#
#####################################################################

torque.home = d:/aplic/torque-gen-3.1.1
project = amicyfC
torque.project.dir = d:/aplic/${project}
database = postgresql
targetPackage = net.idtoki.amicyf.torque.data
torque.project = ${project}
torque.database = ${database}
torque.targetPackage = ${targetPackage}
torque.runOnlyOnSchemaChange = false

#torque.addGetByNameMethod = true
#torque.addIntakeRetrievable = false
#torque.addSaveMethod = true
#torque.addTimeStamp = true
#torque.basePrefix = Base
#torque.complexObjectModel = true
#torque.useClasspath = false
#torque.useManagers = false

#para postgress
#createDatabaseUrl = jdbc:postgresql://192.168.1.211:5432/template1
#buildDatabaseUrl = jdbc:postgresql://192.168.1.211:5432/dci
#databaseUrl = jdbc:postgresql://192.168.1.211:5432/dci
#databaseDriver = org.postgresql.Driver
#databaseUser = dci
#databasePassword = dci
#databaseHost = 192.168.1.211

createDatabaseUrl = jdbc:postgresql://localhost:5432/AMICYFDB
buildDatabaseUrl = jdbc:postgresql://localhost:5432/AMICYFDB
databaseUrl = jdbc:postgresql://localhost:5432/AMICYFDB
databaseDriver = org.postgresql.Driver
databaseUser = amicyf-user
databasePassword = amicyf-user
databaseHost = localhost
databaseSchema = public
databaseName = AMICYFDB

#createDatabaseUrl = jdbc:oracle:thin:@10.107.214.25:1521:AMIS
#buildDatabaseUrl = jdbc:oracle:thin:@10.107.214.25:1521:AMIS
#databaseUrl = jdbc:oracle:thin:@10.107.214.25:1521:AMIS
#databaseDriver = oracle.jdbc.driver.OracleDriver
#databaseUser = dci
#databasePassword = dci
#databaseHost = oracle.zylk.net
#databaseSchema = AMIS

torque.sameJavaName = false


# -------------------------------------------------------------------
#
#  D I R E C T O R I E S
#
# -------------------------------------------------------------------

outputDirectory = ./
schemaDirectory = schema
templatePath = ${torque.home}/templates
useClasspath = false

torque.output.dir = ${torque.project.dir}/${outputDirectory}
torque.schema.dir = ${torque.project.dir}/${schemaDirectory}
torque.templatePath = ${templatePath}
torque.useClasspath = ${useClasspath}

torque.doc.dir = ${torque.output.dir}/doc
torque.java.dir = ${torque.output.dir}/src
torque.javadoc.dir = ${torque.output.dir}/javadoc
torque.ojb.dir = ${torque.output.dir}/ojb
torque.sql.dir = ${torque.output.dir}/sql
torque.omzip.dir = ${torque.output.dir}


# -------------------------------------------------------------------
#
#  D A T A B A S E   S E T T I N G S
#
# -------------------------------------------------------------------

# createDatabaseUrl = jdbc:postgresql://127.0.0.1:5432/template1
# buildDatabaseUrl = jdbc:postgresql://127.0.0.1:5432/bookstore
# databaseUrl = jdbc:postgresql://127.0.0.1:5432/bookstore
# databaseDriver = org.postgresql.Driver
# databaseUser = jvanzyl
# databasePassword =
# databaseHost = 127.0.0.1

# databaseSchema =
# databaseName =
database.manual.creation = false
sameJavaName = false

torque.database.createUrl = ${createDatabaseUrl}
torque.database.buildUrl = ${buildDatabaseUrl}
torque.database.url = ${databaseUrl}
torque.database.driver = ${databaseDriver}
torque.database.user = ${databaseUser}
torque.database.password = ${databasePassword}
torque.database.host = ${databaseHost}

torque.database.schema = ${databaseSchema}
torque.database.name = ${databaseName}
torque.database.manualCreation = ${database.manual.creation}
torque.saveJavaName = ${sameJavaName}


# -------------------------------------------------------------------
#
#  T E M P L A T E   V A R I A B L E S
#
# -------------------------------------------------------------------

addGetByNameMethod = true
addIntakeRetrievable = false
addSaveMethod = true
addTimeStamp = true
basePrefix = Base
complexObjectModel = true
useManagers = false
useClasspath = false

torque.addGetByNameMethod = ${addGetByNameMethod}
torque.addIntakeRetrievable = ${addIntakeRetrievable}
torque.retrievableInterface = org.apache.turbine.om.Retrievable
torque.addSaveMethod = ${addSaveMethod}
torque.addTimeStamp = ${addTimeStamp}
torque.basePrefix = ${basePrefix}
torque.complexObjectModel = ${complexObjectModel}
torque.saveException = Exception
torque.useClasspath = ${useClasspath}
torque.useManagers = ${useManagers}

torque.omzip.src.base = false
torque.omzip.src.extension = false
torque.omzip.bin.base = false
torque.omzip.bin.extension = false
torque.omzip.deleteFiles = false

torque.generateDeprecated = true

# -------------------------------------------------------------------
#
#  M I S C .   S E T T I N G S
#
# -------------------------------------------------------------------

idTableXMLFile =
documentationFormat = html

#
# ID Broker Default Values
#
initialID      = 101
torque.initialIDValue = 1000
torque.initialIDStep  = 10

torque.idTableXMLFile = ${idTableXMLFile}
torque.doc.format = ${documentationFormat}
torque.doc.html.normalFont = font-family: Verdana; font-size: 10pt;
torque.doc.html.fkColor = afe295
torque.initialID = ${initialID}


# -------------------------------------------------------------------
#
#  C O N T R O L   T E M P L A T E S
#
# -------------------------------------------------------------------

SQLControlTemplate = sql/base/Control.vm
OMControlTemplate = om/Control.vm
idTableControlTemplate = sql/id-table/Control.vm
DataDTDControlTemplate = data/Control.vm
DataDumpControlTemplate = data/dump/Control.vm
DataSQLControlTemplate = sql/load/Control.vm
DocControlTemplate = doc/Control.vm

torque.template.sql = ${SQLControlTemplate}
torque.template.om = ${OMControlTemplate}
torque.template.idTable = ${idTableControlTemplate}
torque.template.dataDtd = ${DataDTDControlTemplate}
torque.template.dataDump = ${DataDumpControlTemplate}
torque.template.dataSql = ${DataSQLControlTemplate}
torque.template.doc = ${DocControlTemplate}
torque.template.sqlDbInit = sql/db-init/Control.vm
torque.template.ojb = ojb/repository/Control.vm
torque.template.ojbModel = ojb/model/Control.vm


# -------------------------------------------------------------------
#
#  C O M P I L E   S E T T I N G S
#
# -------------------------------------------------------------------

src.dir = ${torque.java.dir}
build.dest = bin/classes
debug = on
deprecation = on
optimize = off

torque.compile.src.dir = ${src.dir}
torque.compile.build.dir = ${build.dest}
torque.compile.debug = ${debug}
torque.compile.deprecation = ${deprecation}
torque.compile.optimize = ${optimize}


# -------------------------------------------------------------------
#
#  I N C L U D E   A N D   E X C L U D E   S E T T I N G S
#
# -------------------------------------------------------------------

torque.schema.sql.includes = *-schema.xml
torque.schema.sql.excludes =
torque.schema.doc.includes = *-schema.xml
torque.schema.doc.excludes =
torque.schema.create-db.includes = *-schema.xml
torque.schema.create-db.excludes =
torque.schema.init-sql.includes = *-schema.xml
torque.schema.init-sql.excludes = id-table-schema.xml
torque.schema.om.includes = *-schema.xml
torque.schema.om.excludes = id-table-schema.xml
torque.schema.ojb.includes = *-schema.xml
torque.schema.ojb.excludes =
########################################################################
#
#tomcat
#
#
########################################################################

############################################################################
#  app.name             Base name of this application, used to
#                       construct filenames and directories.
#                       Defaults to "myapp".
#
#  app.path             Context path to which this application should be
#                       deployed (defaults to "/" plus the value of the
#                       "app.name" property).
#
#  app.version          Version number of this iteration of the application.
#
#  build.home           The directory into which the "prepare" and
#                       "compile" targets will generate their output.
#                       Defaults to "build".
#
#  catalina.home        The directory in which you have installed
#                       a binary distribution of Tomcat 5.  This will
#                       be used by the "deploy" target.
#
#  dist.home            The name of the base directory in which
#                       distribution files are created.
#                       Defaults to "dist".
#
#  manager.password     The login password of a user that is assigned the
#                       "manager" role (so that he or she can execute
#                       commands via the "/manager" web application)
#
#  manager.url          The URL of the "/manager" web application on the
#                       Tomcat installation to which we will deploy web
#                       applications and web services.
#
#  manager.username     The login username of a user that is assigned the
#                       "manager" role (so that he or she can execute
#                       commands via the "/manager" web application)
#
##########################################################################


#Contexto en el que se crea la aplicacion
app.path=/amicyfC

#nombre de la aplicacion
app.name= amicyfC

#Directorio de instalacion del tomcat 554
#catalina.home=d:/tomcat554
#catalina.home=/usr/local/tomcat
#direccion para las tareas de despliegue/repliegue de la aplicación
#manager.url = http://localhost:8080/manager

#usuario y password que controla el tomcat
#manager.username = tomcat554
#manager.password = tomcat554
#manager.username = tomcat5028
#manager.password = tomcat5028

#para el despliegue en jboss
jetty.home = ./instalable-win32/app-server/jetty-5.1.4
jetty.deploy = ${jetty.home}/webapps
jboss.home = d:/jboss325
#jboss.home = /usr/local/jboss
jboss.deploy = ${jboss.home}/server/default/deploy
