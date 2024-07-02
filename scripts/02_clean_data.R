# Cargar las tablas procesadas
load("data/processed/sigcom_historico.RData")
load("data/processed/prestaciones_valoradas.RData")
load("data/processed/grd_at.RData")
load("data/processed/grd_validas.RData")
load("data/processed/grd_indices.RData")

library(janitor)
library(tidyverse)

grd_indices <- clean_names(grd_indices)
cod_establecimientos_sigges <- clean_names(read_excel("G:/Unidades compartidas/08_DIS_2/7. Financiamiento/2024/1. PPV/cod_establecimientos_sigges.xlsx"))



# Guardar los datos limpios
save(sigcom_historico, file = "data/processed/sigcom_historico_clean.RData")
save(prestaciones_valoradas, file = "data/processed/prestaciones_valoradas_clean.RData")
save(grd_at, file = "data/processed/grd_at_clean.RData")
save(grd_validas, file = "data/processed/grd_validas_clean.RData")
save(grd_indices, file = "data/processed/grd_indices_clean.RData")
