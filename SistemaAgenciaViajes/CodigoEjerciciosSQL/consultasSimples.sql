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
  codigo_cliente,
  COUNT(*) AS cantidad_viajes
FROM
  importe_tour
GROUP BY
  codigo_cliente
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
  *
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




