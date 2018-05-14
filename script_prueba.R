library(RMySQL)

##Crear conexión a la base de datos
cnc<-dbConnect(MySQL(),user='product',host='35.184.1.48',
               password='Merlin123',dbname='producto-prueba')

##Se enlistan todas las tablas que hay en la base de datos
dbGetQuery(cnc,statement = 'SHOW TABLES')

##1
##Establecemos pues los criterios con  los cuales se calificara la calidad
##del candidato
jobs<-dbGetQuery(cnc,statement = 'SELECT idJob, idCategory, experienceName,
                 jobType, duration FROM jobs')
head(jobs)

##Elegimos las variables que pueden caracterizar a un buen candidato
cand<-dbGetQuery(cnc,statement = 'SELECT idUser, idCategory, position, duration
                 FROM work_experiences')
head(cand)

##2
cand_sta<-dbGetQuery(cnc,statement = 'SELECT * FROM candidate_statistics')
str(cand_sta)

##Solo fecha,es decir: año, mes y día
cand_sta$timeStamp<-as.Date(cand_sta$timeStamp)
