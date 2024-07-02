# Cargar los datos limpios
load("data/processed/sigcom_historico_clean.RData")
load("data/processed/prestaciones_valoradas_clean.RData")
load("data/processed/grd_at_clean.RData")
load("data/processed/grd_validas_clean.RData")

# Crear visualizaciones
# (Aquí iría el código específico de las visualizaciones)

# Guardar las figuras
ggsave("outputs/figures/mi_grafico.png")
