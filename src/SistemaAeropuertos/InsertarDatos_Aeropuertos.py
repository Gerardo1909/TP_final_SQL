import psycopg2
from faker import Faker

# Me conecto a la base de datos
def get_connection():
    return psycopg2.connect(
        host="aws-0-us-west-1.pooler.supabase.com",
        database="postgres",
        user="postgres.caoqlvpakvwljkfrpdkc",
        password="hola_queridos_alumnos",
        port="6543"
    )

conn = get_connection()
cursor = conn.cursor()
fake = Faker()

estado_reserva = ['ACTIVO', 'VENCIDO']
for estado in estado_reserva:
    cursor.execute("""
            INSERT INTO estado_reserva (estado)
            VALUES (%s)
        """, (
            estado,
        ))

# Commiteo cambios y cierro la conexión
conn.commit()
cursor.close()
conn.close()