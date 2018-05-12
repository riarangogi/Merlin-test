library(RMySQL)

##Crear conexión a la base de datos
cnc<-dbConnect(MySQL(),user='product',host='35.184.1.48',
               password='Merlin123',dbname='producto-prueba')

##Se enlistan todas las tablas que hay en la base de datos
dbGetQuery(cnc,statement = 'SHOW TABLES')

##Establecemos pues los criterios con  los cuales se calificara la calidad
##del candidato
jobs<-dbGetQuery(cnc,statement = 'SELECT idJob, idCategory, experienceName,
                 jobType, duration FROM jobs')
head(jobs)

job_app<-dbGetQuery(cnc,statement = 'SELECT * FROM job_applications')
str(job_app)
