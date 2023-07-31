library(tidyverse)

obras_urbanas_1 <- read_csv(file = "C:/Users/Comuna 7/Desktop/utdt_tp1/Datos/observatorio-de-obras-urbanas.csv")

install.packages("janitor")

library (janitor)

# Análisis de Obras Urbanas en Ciudad de Buenos Aires
## Fuente: Observatorio de obras urbanas de Gobierno de Ciudad de Buenos Aires

### ¿Como es la distribución de obras en las distintas Comunas que conforman la Ciudad de Buenos Aires?

#### Vamos a limpiar el dataset. Notamos que en los campos hay espacios, tildes, mayúsculas, etc. Vamos a utilizar la función clean_names del janitor labrary para solucionar este problema.

obras_urbanas_limpio <- obras_urbanas_1 %>%
  clean_names() %>%
  select(id, nombre, etapa, tipo, area_responsable, monto_contrato, comuna, barrio, fecha_inicio, fecha_fin_inicial, plazo_meses, contratacion_tipo)

