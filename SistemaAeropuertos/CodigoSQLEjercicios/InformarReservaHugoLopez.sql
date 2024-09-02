SELECT 
  cliente.nombre AS nombre_cliente,
  cliente.apellido AS apellido_cliente,
  DATE_PART('month', reserva.fecha_vencimiento) AS mes_reserva,
  DATE_PART('year', reserva.fecha_vencimiento) AS anio_reserva
FROM reserva
  INNER JOIN cliente ON reserva.id_cliente = cliente.id_cliente
WHERE 
  nombre = 'Hugo' AND 
  apellido = 'López' AND 
  DATE_PART('month', reserva.fecha_vencimiento) > DATE_PART('month', NOW());