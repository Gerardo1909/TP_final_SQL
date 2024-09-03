import psycopg2
from faker import Faker
import random as rd

#TODO Faltan poblar: Tour, empleado_tour, escala_tour, importe_tour

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

# Creo una vista para traer los ids de los especialistas
view_especialistas = cursor.execute(""" 
                        SELECT id_empleado FROM empleado WHERE id_cargo = 2
                               """) 

id_espec = cursor.fetchall() #los guardo en una lista de tuplas 

id_especialistas = [] #Parseo la lista para que solo guarde los ids sin usar tuplas (Facilitar indexado)
for id in id_espec:
    id_especialistas.append(id[0])

for _ in range(1,41):
    especialista = rd.choice(id_especialistas)
    cursor.execute("""
            INSERT INTO escala (codigo_escala, ubicacion, id_especialista_escala)
            VALUES(%s, %s, %s)
            """, (
            _,
            fake.city(),
            especialista

            ))


conn.commit()
cursor.close()
conn.close()