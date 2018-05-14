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
cand_sta$timeStamp<-as.Date(cand_sta$timeStamp)
cand_sta$idUser<-as.character(cand_sta$idUser)
str(cand_sta)

##El id de los candidatos más calificados
x<-subset(cand,duration=='+3 Years',select = idUser)
x<-as.list(x)

##data frame con los candidatos mejor calificado que aplicaron
A<-subset(cand_sta,idUser %in% x$idUser)
B<-subset(A,event=='Application')

##buenos candidatos/candidatos
C<-subset(cand_sta,event=='Application')
m<-length(B$id)/length(C$id)

##numero de semanas
n<-length(unique(cand_sta$timeStamp))/7
n<-as.integer(n)

##respuesta
(m/n)*100
