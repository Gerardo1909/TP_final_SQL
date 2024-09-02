SELECT 
  cliente.nombre,
  cliente.apellido,
  categoria_boleto.nombre_categoria,
  ciudad.nombre_ciudad as ciudad_destino
FROM reserva 
  INNER JOIN cliente ON reserva.id_cliente = cliente.id_cliente
  INNER JOIN categoria_boleto ON reserva.id_categoria_boleto = categoria_boleto.id_categoria_boleto
  INNER JOIN vuelo ON reserva.id_vuelo = vuelo.id_vuelo
  INNER JOIN ciudad ON vuelo.id_ciudad_destino = ciudad.id_ciudad
WHERE 
  nombre_categoria = 'BUSINESS' AND nombre_ciudad = 'Madrid';