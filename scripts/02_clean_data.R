# Cargar las tablas procesadas
load("data/processed/sigcom_historico.RData")
load("data/processed/prestaciones_valoradas.RData")
load("data/processed/grd_at.RData")
load("data/processed/grd_validas.RData")

# Procesar y limpiar los datos
# (Aquí iría el código específico de limpieza)

# Guardar los datos limpios
save(sigcom_historico, file = "data/processed/sigcom_historico_clean.RData")
save(prestaciones_valoradas, file = "data/processed/prestaciones_valoradas_clean.RData")
save(grd_at, file = "data/processed/grd_at_clean.RData")
save(grd_validas, file = "data/processed/grd_validas_clean.RData")
