library(RPostgres)
library(DBI)
library(readxl)
library(janitor)

cod_establecimientos_sigges <- clean_names(read_excel("G:/Unidades compartidas/08_DIS_2/7. Financiamiento/2024/1. PPV/cod_establecimientos_sigges.xlsx"))


# Conectar a la base de datos PostgreSQL
con <- dbConnect(RPostgres::Postgres(),
                 dbname = dbname,
                 host = host,
                 port = port,
                 user = user,
                 password = password)

# Crear la tabla en PostgreSQL
query <- "
CREATE TABLE establecimientos_sigges (
    sigges TEXT,
    codigo_antiguo TEXT,
    codigo_vigente DOUBLE PRECISION,
    codigo_madre_antiguo TEXT,
    codigo_madre_nuevo TEXT,
    codigo_region TEXT,
    nombre_region TEXT,
    codigo_dependencia_jerarquica_seremi_servicio_de_salud DOUBLE PRECISION,
    nombre_dependencia_jerarquica_seremi_servicio_de_salud TEXT,
    pertenencia_al_snss TEXT,
    tipo_establecimiento_unidad TEXT,
    ambito_de_funcionamiento TEXT,
    nombre_oficial TEXT,
    certificacion TEXT,
    dependencia_administrativa TEXT,
    nivel_de_atencion TEXT,
    codigo_comuna TEXT,
    nombre_comuna TEXT,
    via TEXT,
    numero TEXT,
    direccion TEXT,
    telefono TEXT,
    fecha_inicio_funcionamiento TEXT,
    tiene_servicio_de_urgencia TEXT,
    tipo_de_urgencia TEXT,
    clasificcion_tipo_de_sapu TEXT,
    latitud_grados_decimales DOUBLE PRECISION,
    longitud_grados_decimales TEXT,
    tipo_de_prestador_sistema_de_salud TEXT,
    estado_de_funcionamiento TEXT,
    nivel_de_complejidad TEXT,
    tipo_de_atencion TEXT,
    fecha_de_incorporacion_a_la_base TIMESTAMP
);
"
dbExecute(con, query)

# Insertar los datos desde el dataframe en R a la tabla en PostgreSQL
dbWriteTable(con, "establecimientos_sigges", cod_establecimientos_sigges, append = TRUE, row.names = FALSE)

# Cerrar la conexión a la base de datos
dbDisconnect(con)

