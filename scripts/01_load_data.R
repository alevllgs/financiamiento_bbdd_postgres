# Instalar y cargar las bibliotecas necesarias
if (!requireNamespace("RPostgres", quietly = TRUE)) {
  install.packages("RPostgres")
}
if (!requireNamespace("DBI", quietly = TRUE)) {
  install.packages("DBI")
}
if (!requireNamespace("dotenv", quietly = TRUE)) {
  install.packages("dotenv")
}

library(RPostgres)
library(DBI)
library(dotenv)

# Cargar las variables de entorno
dotenv::load_dot_env()

# Obtener las variables de entorno
dbname <- Sys.getenv("DB_NAME")
host <- Sys.getenv("DB_HOST")
port <- Sys.getenv("DB_PORT")
user <- Sys.getenv("DB_USER")
password <- Sys.getenv("DB_PASSWORD")

# Conectar a la base de datos
con <- dbConnect(RPostgres::Postgres(),
                 dbname = dbname,
                 host = host,
                 port = port,
                 user = user,
                 password = password)

# Traer las tablas
sigcom_historico <- dbReadTable(con, "sigcom_historico")
prestaciones_valoradas <- dbReadTable(con, "prestaciones_valoradas")
grd_at <- dbReadTable(con, "at")
grd_validas <- dbReadTable(con, "validas")

# Guardar las tablas en el directorio de datos procesados
save(sigcom_historico, file = "data/processed/sigcom_historico.RData")
save(prestaciones_valoradas, file = "data/processed/prestaciones_valoradas.RData")
save(grd_at, file = "data/processed/grd_at.RData")
save(grd_validas, file = "data/processed/grd_validas.RData")

# Cerrar la conexión
dbDisconnect(con)

grd_indices <- read_excel("G:/Mi unidad/02_Dashboard Financiero/Soporte/1_VEEOS_Tabular_2022_2023.xlsx", skip = 3)
save(grd_indices, file = "data/processed/grd_indices.RData")
