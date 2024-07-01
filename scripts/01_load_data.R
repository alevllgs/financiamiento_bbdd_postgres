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


# Cerrar la conexión
dbDisconnect(con)





