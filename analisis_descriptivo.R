library(readxl)
library(dplyr)

# Lectura de datasets

futbol <- read_excel("C:/Users/mcond/OneDrive/Escritorio/laliga.xlsx")

# Reduccion de base de datos

reduccion = dimension1[ ,c(8,12,21,23)]

scatterplot(reduccion)

# Tabla e histograma de frecuencias del numero de goles

describe(futbol$Local)

table(futbol$Local)
table(futbol$Visitante)

table(futbol$goles)
hist(futbol$goles)

# Se muestran los partidos con frecuencua superior a 10 goles

Masgoles <- filter(futbol, goles>10)

partidos = Masgoles[ ,c(2,3,4,5,6,7,8)]

# Frecuencias del numero de goles como Local y Visitante

table(futbol$goles_local)

table(futbol$goles_visitante)


# Creamos dataframe de los partidos con mayor frecuencia como visitante

golesVisitante <- filter(futbol, goles_visitante == 8)

partidos = golesVisitante[ ,c(2,3,4,5,6,7,8)]


# Eliminamos las 2 temporadas que tenian 42 jornadas (equipo Local) para el grafico temporal

serieReduc = futbol[c(925:10044), ]

serie = serieReduc[ ,c(7)]

serieReduc = futbol[c(8145:10044), ]

serie2 = serieReduc[ ,c(8)]

serieLocal = serie[c(531:9120), ]

evolTiempo = ts(serie,start = 1997 ,frequency=380)

evolTiempoVisit = ts(serie2,start = 2016 ,frequency=380)

plot(evolTiempoVisit)

plot(evolTiempo)