/*  Ejercicio 10 b   */
SELECT
  nombre_completo,
  tours_atendidos
FROM
  empleado
ORDER BY
  tours_atendidos DESC
LIMIT
  5; 

/*  Ejercicio 10 c   */
SELECT
  c.codigo_cliente,
  c.nombre,
  COUNT(*) AS cantidad_viajes
FROM
  importe_tour it inner join cliente c on it.codigo_cliente = c.codigo_cliente
GROUP BY 
  c.codigo_cliente
ORDER BY
  cantidad_viajes DESC
  LIMIT 5;

/* Ejercicio 10 d */
SELECT
  codigo_cliente
FROM
  cliente
WHERE
  nombre = 'Hugo Lopez';

SELECT
  cliente.codigo_cliente, cliente.nombre, tour.codigo_tour, tour.salida, tour.llegada
FROM
  cliente
  INNER JOIN importe_tour ON cliente.codigo_cliente = importe_tour.codigo_cliente
  INNER JOIN tour ON importe_tour.codigo_tour = tour.codigo_tour
WHERE
  cliente.codigo_cliente = 504
  AND salida >= '2022-10-01 00:00:00' 
  AND salida < '2022-11-01 00:00:00';

/* Ejercicio e y f */
Select 
  * 
from 
  grupofam
where 
  id_grupofam = 94 /* La fila no existe */

INSERT INTO grupofam (id_grupofam, cant_integrantes)
VALUES (94, 3) 

Select 
  * 
from 
  grupofam
where 
  id_grupofam = 94  /* Ahora Sí*/

DELETE FROM grupofam WHERE id_grupofam = 94

Select 
  * 
from 
  grupofam
where 
  id_grupofam = 94  /* Ahora la eliminamos*/


/* Ejercicio 10 g */ 

CREATE INDEX index_cargo ON empleado (id_cargo);

SELECT nombre_completo, tours_atendidos FROM empleado WHERE id_cargo = 2 AND tiempo_en_empresa > 10;

/* Ejercicio 10 h */
SELECT tipo_pago, COUNT(*) AS total_transacciones
FROM importe_tour GROUP BY tipo_pago ORDER BY tipo_pago DESC;

/* Ejercicio 10 i */
SELECT
  cliente.nombre,
  ocupacion.descripcion as trabajo
FROM
  cliente  INNER JOIN ocupacion ON cliente.ocupacion = ocupacion.id_ocupacion
LIMIT
  100;

/* Ejercicio 10 j */

SELECT
  c.nombre,
  o.descripcion as trabajo
FROM
  cliente c
  LEFT OUTER JOIN ocupacion o ON c.ocupacion = o.id_ocupacion
LIMIT
  100;

/* Ejercicio 10 k */ 

/*  Ejercicio 10 b  - opt */
CREATE INDEX index_tours_atendidos ON empleado (tours_atendidos)

SELECT
  nombre_completo,
  tours_atendidos
FROM
  empleado
ORDER BY
  tours_atendidos DESC
LIMIT
  5; 

/* Ejercicio 10 c - opt */
CREATE INDEX index_cliente ON cliente (codigo_cliente, nombre)

SELECT
  c.codigo_cliente,
  c.nombre,
  COUNT(*) AS cantidad_viajes
FROM
  importe_tour it inner join cliente c on it.codigo_cliente = c.codigo_cliente
GROUP BY 
  c.codigo_cliente
ORDER BY
  cantidad_viajes DESC
  LIMIT 5;

/* Ejercicio 10 d - opt*/  

/* Esta consulta va a usar el indice index_cliente para realizar su busqueda*/

CREATE INDEX index_importe_tour on importe_tour (codigo_tour, codigo_cliente)

SELECT
  codigo_cliente
FROM
  cliente
WHERE
  nombre = 'Hugo Lopez';

SELECT
  cliente.codigo_cliente, cliente.nombre, tour.codigo_tour, tour.salida, tour.llegada
FROM
  cliente
  INNER JOIN importe_tour ON cliente.codigo_cliente = importe_tour.codigo_cliente
  INNER JOIN tour ON importe_tour.codigo_tour = tour.codigo_tour
WHERE
  cliente.codigo_cliente = 504
  AND salida >= '2022-10-01 00:00:00' 
  AND salida < '2022-11-01 00:00:00';


/* Ejercicio e y f - optimizados*/

CREATE INDEX index_grupofam ON grupofam (id_grupofam)

Select 
  * 
from 
  grupofam
where 
  id_grupofam = 94 /* La fila no existe */

INSERT INTO grupofam (id_grupofam, cant_integrantes)
VALUES (94, 3) 

Select 
  * 
from 
  grupofam
where 
  id_grupofam = 94  /* Ahora Sí*/

DELETE FROM grupofam WHERE id_grupofam = 94

Select 
  * 
from 
  grupofam
where 
  id_grupofam = 94  /* Ahora la eliminamos*/

/* 10 g se encuentra optimizado en su forma actual */

/* Ejercicio 10 h - opt */
CREATE INDEX index_pago ON importe_tour (tipo_pago)

SELECT tipo_pago, COUNT(*) AS total_transacciones
FROM importe_tour GROUP BY tipo_pago ORDER BY tipo_pago DESC;

/* Ejercicio 10 i - opt */
CREATE INDEX index_ocupacion ON ocupacion (id_ocupacion, descripcion)

SELECT
  cliente.nombre,
  ocupacion.descripcion as trabajo
FROM
  cliente  INNER JOIN ocupacion ON cliente.ocupacion = ocupacion.id_ocupacion
LIMIT
  100;

/* Ejercicio 10 j - optimizado, utiliza el mismo índice que el ejercicio anterior*/

SELECT
  c.nombre,
  o.descripcion as trabajo
FROM
  cliente c
  LEFT OUTER JOIN ocupacion o ON c.ocupacion = o.id_ocupacion
LIMIT
  100;