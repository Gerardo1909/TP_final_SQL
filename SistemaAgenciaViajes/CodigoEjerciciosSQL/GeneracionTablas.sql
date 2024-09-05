-- Tabla: ocupacion
CREATE TABLE ocupacion (
    id_ocupacion SERIAL PRIMARY KEY,
    descripcion VARCHAR(255)
);

-- Tabla: grupo_familiar
CREATE TABLE grupo_familiar (
    id_grupo_familiar SERIAL PRIMARY KEY,
    cantidad_integrantes INT
);

-- Tabla: cliente
CREATE TABLE cliente (
    codigo_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    ocupacion INT REFERENCES ocupacion(id_ocupacion),
    grupo_familiar INT REFERENCES grupo_familiar(id_grupo_familiar)
);

-- Tabla: tipo_pago
CREATE TABLE tipo_pago (
    id_tipo_pago SERIAL PRIMARY KEY,
    descripcion VARCHAR(255)
);

-- Tabla: importe_tour
CREATE TABLE importe_tour (
    codigo_transaccion SERIAL PRIMARY KEY,
    codigo_cliente INT REFERENCES cliente(codigo_cliente),
    codigo_tour INT REFERENCES tour(codigo_tour),
    tipo_pago INT REFERENCES tipo_pago(id_tipo_pago),
    cuotas_totales INT,
    cuotas_pagas INT
);

-- Tabla: cargo
CREATE TABLE cargo (
    id_cargo SERIAL PRIMARY KEY,
    nombre_cargo VARCHAR(255),
    sueldo_base DECIMAL(10, 2)
);

-- Tabla: empleado
CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre_completo VARCHAR(255),
    id_cargo INT REFERENCES cargo(id_cargo),
    tiempo_en_empresa INT,
    tours_atendidos INT,
    id_sueldo DECIMAL(10, 2)
);

-- Tabla: escala
CREATE TABLE escala (
    codigo_escal_a SERIAL PRIMARY KEY,
    ubicacion VARCHAR(255),
    id_especialista_escala INT
);

-- Tabla: tour
CREATE TABLE tour (
    codigo_tour SERIAL PRIMARY KEY,
    datetime_salida TIMESTAMP,
    datetime_llegada TIMESTAMP,
    cant_plazas INT,
    id_empleado INT REFERENCES empleado(id_empleado),
    id_escala INT REFERENCES escala(codigo_escala)
);

-- Tabla: empleado_tour
CREATE TABLE empleado_tour (
    id_empleado_tour SERIAL PRIMARY KEY,
    id_empleado INT REFERENCES empleado(id_empleado),
    id_tour INT REFERENCES tour(codigo_tour)
);

-- Tabla: escala_tour
CREATE TABLE escala_tour (
    codigo_tour_escala SERIAL PRIMARY KEY,
    codigo_escala INT REFERENCES escala(codigo_escala),
    codigo_tour INT REFERENCES tour(codigo_tour),
    datetime_llegada TIMESTAMP,
    tiempo_estadia INT
);