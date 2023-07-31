b_inmuebles_limpio <- b_inmuebles %>%
  filter(superficie_aproximada_m2 <= 10000)

b_inmuebles_limpio <- b_inmuebles %>%
  mutate(superficie_rangos = case_when(superficie_aproximada_m2 < 10000 ~ "Menor a 10.000",
                                       superficie_aproximada_m2 >= 10000 ~ "Mayor a 10.000"))

b_inmuebles_limpio <- b_inmuebles %>%
  mutate(superficie_rangos = case_when(superficie_aproximada_m2 >= 0 & superficie_aproximada_m2 <= 253 ~ "De 0 a 253",
                                       superficie_aproximada_m2 > 253 & superficie_aproximada_m2 <= 432 ~ "De 254 a 432",
                                       superficie_aproximada_m2 > 432 & superficie_aproximada_m2 <= 720 ~ "De 433 a 720",
                                       superficie_aproximada_m2 > 720 & superficie_aproximada_m2 <= 1300 ~ "De 720 a 1300",
                                       superficie_aproximada_m2 > 1300 ~ "Mayor a 1300"))

b_inmuebles_ordenado <- b_inmuebles %>%
  select(superficie_aproximada_m2) %>%
  arrange(-superficie_aproximada_m2)

b_inmuebles %>%
  slice_min(order_by = superficie_aproximada_m2,
            n = 10)
class(b_inmuebles$codigo_del_inmueble)

prueba <- b_inmuebles %>%
  mutate(across(.cols = c("superficie_aproximada_m2", "latitud", "longitud"),
                ~ round(., digits = 1)))
