import psycopg2
from faker import Faker

# Me conecto a la base de datos
def get_connection():
    return psycopg2.connect(
        host="aws-0-us-west-1.pooler.supabase.com",
        database="postgres",
        user="postgres.oydrnoodxdavpeszjhur",
        password="JQ44bvgqYqESRBFMQ0uv",
        port="6543",

    )

conn = get_connection()
cursor = conn.cursor()
fake = Faker()

#NO EJECUTAR - Pendiente de resolver.
antiguedad = range(0.0, 40.9)
for _ in range(1,21):
    cursor.execute("""
            INSERT INTO empleado (id_empleado, nombre_completo, id_cargo, tiempo_en_empresa, tours_atendidos, sueldo_total)
            VALUES(%s, %s, %s, %s, %s, %s)
            """, (
            _ ,
            fake.name(),
            fake.random_int(min=1, max=3),
            fake.random_choices(antiguedad), #TODO Resolver cómo generar un float aleatorio. Dejo una idea
            fake.random_int(min=1, max=100),
            #Para el sueldo_total cuidado de pisarse entre tablas cargo y empleado, peligro de inconsistencias.

            ))

conn.commit()
cursor.close()
conn.close()