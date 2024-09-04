import psycopg2
from faker import Faker
import random as rd

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

cursor.execute("""
                Select codigo_escala from escala
               """)

vista_escala = cursor.fetchall()

id_escalas = []
for id in vista_escala:
    id_escalas.append(id[0])

cursor.execute("""
                SELECT codigo_tour from tour
               """)

vista_tours = cursor.fetchall()

id_tours = []
for id in vista_tours:
    id_tours.append(id[0])

cursor.execute("""
               Select salida from tour
               """)

salidas = cursor.fetchall()

hora_salida = []
for hora in salidas:
    hora_salida.append(hora[0])

for _ in range(1,3500):
    id_escala = rd.choice(id_escalas)
    id_tour = rd.choice(id_tours)
    hora = hora_salida[id_tour-1]    
    if hora.hour > 18:
        llegada = hora.replace(hour = 18)
    else:
        llegada = hora.replace(hour = hora.hour+1) 
    cursor.execute("""
            INSERT INTO escala_tour (codigo_tour_escala, codigo_escala, codigo_tour, llegada, tiempo_estadia)
            VALUES(%s, %s, %s, %s, %s)
            """, (
            _,
            id_escala,
            id_tour,
            llegada,
            fake.random_int(min=15, max=60)
            ))

conn.commit()
cursor.close()
conn.close()