# Cargar los datos limpios
load("data/processed/sigcom_historico_clean.RData")
load("data/processed/prestaciones_valoradas_clean.RData")
load("data/processed/grd_at_clean.RData")
load("data/processed/grd_validas_clean.RData")

# Realizar el análisis
# (Aquí iría el código específico del análisis)
library(RPostgreSQL)
library(dplyr)

# Configura la conexión a la base de datos
drv <- dbDriver("PostgreSQL")
con <- dbConnect(RPostgres::Postgres(),
                 dbname = dbname,
                 host = host,
                 port = port,
                 user = user,
                 password = password)

# Ejecuta la consulta SQL para obtener los datos
query <- "
  SELECT
    e.sigla,
    sh.ano,
    sh.mes,
    m.mes_descripcion,
    SUM(sh.monto) AS total_monto
  FROM
    sigcom_historico sh
  JOIN
    establecimientos e ON sh.establecimiento = e.establecimiento
  JOIN
    meses m ON sh.mes = m.num_mes
  GROUP BY
    e.sigla, sh.ano, sh.mes, m.mes_descripcion
  ORDER BY
    e.sigla, sh.ano, sh.mes;
"

# Guarda los resultados en un data frame
total_sigcom <- dbGetQuery(con, query)

# Cierra la conexión a la base de datos
dbDisconnect(con)

# Muestra el data frame
print(total_sigcom)
