library(RMySQL)

##Crear conexión a la base de datos
cnc<-dbConnect(MySQL(),user='product',host='35.184.1.48',
               password='Merlin123',dbname='producto-prueba')

##Se enlistan todas las tablas que hay en la base de datos
dbGetQuery(cnc,statement = 'SHOW TABLES')