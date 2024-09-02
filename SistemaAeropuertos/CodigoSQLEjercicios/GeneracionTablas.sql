CREATE TABLE tipo_mostrador (
    id_tipo_mostrador SERIAL PRIMARY KEY,
    descripcion VARCHAR(255)
);

CREATE TABLE estado_asignacion (
    id_estado_asignacion SERIAL PRIMARY KEY,
    estado VARCHAR(50)
);

CREATE TABLE pais (
    id_pais SERIAL PRIMARY KEY,
    nombre_pais VARCHAR(100)
);

CREATE TABLE tipo_documento (
    id_tipo_documento SERIAL PRIMARY KEY,
    tipo_documento VARCHAR(50)
);

CREATE TABLE tipo_operacion (
    id_tipo_operacion SERIAL PRIMARY KEY,
    nombre_operacion VARCHAR(100)
);

CREATE TABLE tipo_vuelo (
    id_tipo_vuelo SERIAL PRIMARY KEY,
    descripcion VARCHAR(100)
);

CREATE TABLE ciudad (
    id_ciudad SERIAL PRIMARY KEY,
    nombre_ciudad VARCHAR(100)
);

CREATE TABLE aeropuerto (
    id_aeropuerto SERIAL PRIMARY KEY,
    nombre_aeropuerto VARCHAR(255)
);

CREATE TABLE ubicacion (
    id_ubicacion SERIAL PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    nombre VARCHAR(255),
    coordenadas VARCHAR(255)
);

CREATE TABLE pista (
    id_pista SERIAL PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_ubicacion INT REFERENCES ubicacion(id_ubicacion),
    nombre_pista VARCHAR(255)
);

CREATE TABLE mostrador (
    id_mostrador SERIAL PRIMARY KEY,
    id_aeropuerto INT REFERENCES aeropuerto(id_aeropuerto),
    id_ubicacion INT REFERENCES ubicacion(id_ubicacion),
    id_tipo_mostrador INT REFERENCES tipo_mostrador(id_tipo_mostrador),
    nro_mostrador VARCHAR(50)
);

CREATE TABLE aerolinea (
    id_aerolinea SERIAL PRIMARY KEY,
    nombre_aerolinea VARCHAR(255)
);

CREATE TABLE asignacion_mostrador (
    id_asignacion SERIAL PRIMARY KEY,
    id_aerolinea INT REFERENCES aerolinea(id_aerolinea),
    id_mostrador INT REFERENCES mostrador(id_mostrador),
    id_estado_asignacion INT REFERENCES estado_asignacion(id_estado_asignacion),
    fecha_inicio TIMESTAMP,
    fecha_fin TIMESTAMP
);

CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    id_tipo_documento INT REFERENCES tipo_documento(id_tipo_documento),
    id_pais_emisor_documento INT REFERENCES pais(id_pais),
    nro_documento VARCHAR(50),
    nombre VARCHAR(100),
    apellido VARCHAR(100)
);

CREATE TABLE tipo_avion (
    id_tipo_avion SERIAL PRIMARY KEY,
    nombre_tipo VARCHAR(100)
);

CREATE TABLE avion (
    id_avion SERIAL PRIMARY KEY,
    id_aerolinea INT REFERENCES aerolinea(id_aerolinea),
    id_tipo_avion INT REFERENCES tipo_avion(id_tipo_avion),
    cantidad_asientos INT
);

CREATE TABLE vuelo (
    id_vuelo SERIAL PRIMARY KEY,
    id_avion INT REFERENCES avion(id_avion),
    id_ciudad_origen INT REFERENCES ciudad(id_ciudad),
    id_ciudad_destino INT REFERENCES ciudad(id_ciudad),
    numero_vuelo VARCHAR(50),
    datetime_salida TIMESTAMP,
    duracion_estimada INTERVAL,
    id_tipo_vuelo INT REFERENCES tipo_vuelo(id_tipo_vuelo)
);

CREATE TABLE pista_vuelo (
    id_pista_vuelo SERIAL PRIMARY KEY,
    id_pista INT REFERENCES pista(id_pista),
    id_vuelo INT REFERENCES vuelo(id_vuelo),
    id_tipo_operacion INT REFERENCES tipo_operacion(id_tipo_operacion),
    datetime_operacion TIMESTAMP
);

CREATE TABLE estado_reserva (
    id_estado_reserva SERIAL PRIMARY KEY,
    estado VARCHAR(50)
);

CREATE TABLE reserva (
    id_reserva SERIAL PRIMARY KEY,
    id_cliente INT REFERENCES cliente(id_cliente),
    id_vuelo INT REFERENCES vuelo(id_vuelo),
    id_aerolinea INT REFERENCES aerolinea(id_aerolinea),
    id_estado_reserva INT REFERENCES estado_reserva(id_estado_reserva),
    id_categoria_boleto INT REFERENCES categoria_boleto(id_categoria_boleto),
    num_vuelo_deseado VARCHAR(50),
    codigo_reserva VARCHAR(50),
    datetime_transaccion TIMESTAMP,
    fecha_vencimiento DATE
);

CREATE TABLE categoria_boleto (
    id_categoria_boleto SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);