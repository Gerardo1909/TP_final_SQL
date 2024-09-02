'''
    Este script tiene como propósito insertar datos en las tablas generales de la base de datos.
'''
from faker import Faker 
fake = Faker()


datos_aerolinea = [
    {
        'nombre_aerolinea': 'Aerolineas ' + fake.country() 
    }
    for _ in range(20)
]

datos_ciudad = [
    {
        'nombre_ciudad': fake.city()
    }
    for _ in range(20)
]

datos_vuelo = [
    {
        'id_avion': fake.random_int(min=1, max=14),
        'id_ciudad_origen': fake.random_int(min=1, max=22),
        'id_ciudad_destino': fake.random_int(min=1, max=22),
        'numero_vuelo': fake.random_int(min=1000, max=9999),
        'datetime_salida': fake.date_time_this_year(),
        'duracion_estimada': f"{fake.random_int(min=1, max=6)} hour",   
        'id_tipo_vuelo': fake.random_int(min=1, max=2),
    }
    for _ in range(100)
]

datos_cliente = [
    {
        'id_tipo_documento': fake.random_int(min=1, max=3),
        'id_pais_emisor_documento': fake.random_int(min=1, max=11),
        'nro_documento': fake.random_int(min=1000000, max=50000000),
        'nombre': fake.first_name(),
        'apellido': fake.last_name()
    }
    for _ in range(100)
]


if __name__ == '__main__':
    
    from UtilsDB import abrir_conexion, cerrar_conexion, insertar_datos
    
    cone = abrir_conexion()

    insertar_datos(cone, 'cliente', datos_cliente)
    
    cerrar_conexion(cone)
    
    