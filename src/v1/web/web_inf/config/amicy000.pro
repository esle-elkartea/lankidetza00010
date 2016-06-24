#log4j.rootCategory = DEBUG, default
log4j.logger.org.apache.torque.util.BasePeer = DEBUG
log4j.appender.default = org.apache.log4j.FileAppender
log4j.appender.default.file = ./torque.log
log4j.appender.default.layout = org.apache.log4j.SimpleLayout


############PARA POSTGRESQL##################

torque.database.default=AMICYF
torque.database.AMICYF.adapter=postgresql
torque.database.AMICYF.driver = org.postgresql.Driver
torque.database.AMICYF.url = jdbc:postgresql://localhost:5432/AMICYFDB
torque.database.AMICYF.username = amicyf-user
torque.database.AMICYF.password = amicyf-user
torque.dsfactory.AMICYF.factory = org.apache.torque.dsfactory.SharedPoolDataSourceFactory
#torque.dsfactory.AMICYF.pool.defaultMaxActive=10
#torque.dsfactory.AMICYF.testOnBorrow=true
torque.dsfactory.AMICYF.validationQuery=SELECT 1
torque.dsfactory.AMICYF.connection.driver = org.postgresql.Driver
torque.dsfactory.AMICYF.connection.url = jdbc:postgresql://localhost:5432/AMICYFDB
torque.dsfactory.AMICYF.connection.user = amicyf-user
torque.dsfactory.AMICYF.connection.password = amicyf-user



##############para oracle#####################
#
#torque.database.default=dCiManager
#torque.database.dCiManager.adapter=oracle
#torque.database.dCiManager.databaseSchema = AMIS
#torque.dsfactory.dCiManager.factory = org.apache.torque.dsfactory.SharedPoolDataSourceFactory
#torque.dsfactory.dCiManager.pool.defaultMaxConnections=10
#torque.dsfactory.dCiManager.maxExpiryTime=3600
#torque.dsfactory.dCiManager.connectionWaitTimeout=10
#torque.dsfactory.dCiManager.connection.driver = oracle.jdbc.driver.OracleDriver
#torque.dsfactory.dCiManager.connection.url = jdbc:oracle:thin:@192.168.2.8:1521:DCI
#torque.dsfactory.dCiManager.connection.url = jdbc:oracle:thin:@10.107.214.25:1521:AMIS
#torque.dsfactory.dCiManager.connection.url = jdbc:oracle:thin:@oracle.zylk.net:1521:AMIS
#torque.dsfactory.dCiManager.connection.user = dci
#torque.dsfactory.dCiManager.connection.password = dci
#torque.dsfactory.dCiManager.databaseSchema = AMIS
#torque.dsfactory.dCiManager.connection.databaseSchema = AMIS
#
###############################################


##############para oracle###con pool en el jndi publicado en JNDI#
#torque.database.default = AMICYF
#torque.database.AMICYF.adapter = postgresql
#torque.database.AMICYF.databaseSchema = public
#torque.dsfactory.AMICYF.factory = org.apache.torque.dsfactory.JndiDataSourceFactory
#torque.dsfactory.AMICYF.jndi.path = java:/amicyfDS
###############################################



