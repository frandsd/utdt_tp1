library(tidyverse)

obras_urbanas_1 <- read_csv(file = "C:/Users/Comuna 7/Desktop/utdt_tp1/Datos/observatorio-de-obras-urbanas.csv")

install.packages("janitor")

library (janitor)

library(readr)

# Análisis de Obras Urbanas en Ciudad de Buenos Aires
## Fuente: Observatorio de obras urbanas de Gobierno de Ciudad de Buenos Aires

### ¿Es equilibrada la distribución de obras públicas en las distintas Comunas que conforman la Ciudad de Buenos Aires?


####Vamos a entender un poco los valores de las columnas

unique(obras_urbanas_1$etapa)

#### En etapa notamos que, por un lado, hay valores que hay que desestimar ya que no fueron ejecutados, como "neutralizada" y "desestimada" y por otro lado varios valores que estan escritos de manera similar pero que R los lee como valor distintos, como "Finalizada", "Finalizado", FInalizada".

colnames(obras_urbanas_1)

#### Vamos a limpiar el dataset. Notamos que en los campos hay espacios, tildes, mayúsculas, etc. Vamos a utilizar la función clean_names del janitor labrary para solucionar este problema.
#### Con el Pipe, vamos a seleccionar solo aquellas columnas necesarias para el posterior análisis, deshaciéndonos de aquellas columnas que podamos prescindir. 

?filter

obras_urbanas_limpio <- obras_urbanas_1 %>%
  clean_names() %>%
  select(id, nombre, etapa, tipo, area_responsable, monto_contrato, comuna, barrio, fecha_inicio, fecha_fin_inicial, plazo_meses, contratacion_tipo, licitacion_anio) %>%
  filter(etapa %in% c("Finalizada", "En ejecución", "En obra", "Finalizado",  "En proyecto", "Finalizada/desestimada", "Piloto 1", "Piloto 2", "Etapa 3 - frente 1", "Iniciada", "En Ejecución",  "FInalizada", "Proyecto finalizado", "En curso"))

#### Como nos interesa que la columna "Comunas" tenga un campo para continuar con nuestro análisis vamos a revisar con "unique" que valores tenemos:

unique(obras_urbanas_limpio$comuna)

#### Están todas las Comunas presentes, pero ademas tenemos el valor NA que implica que hay varios campos vacíos.

summary(obras_urbanas_limpio)
?mutate
