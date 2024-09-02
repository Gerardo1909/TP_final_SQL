SELECT   
  aerolinea.nombre_aerolinea,   
  DATE_PART('month', vuelo.datetime_salida) AS mes_salida,
  DATE_PART('year', vuelo.datetime_salida) AS anio_salida
FROM vuelo
  INNER JOIN avion ON vuelo.id_avion = avion.id_avion
  INNER JOIN aerolinea ON avion.id_aerolinea = aerolinea.id_aerolinea
WHERE 
  nombre_aerolinea = 'Aerolineas Argentina' AND 
  DATE_PART('month', datetime_salida) = 3 AND 
  DATE_PART('year', datetime_salida) = 2011;