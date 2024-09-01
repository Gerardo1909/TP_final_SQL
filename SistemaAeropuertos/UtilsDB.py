'''
    Este script contiene funciones de propósito general para trabajar con una base de datos SQL.
'''
import psycopg2
from psycopg2 import sql

def abrir_conexion() -> psycopg2.connect | None:
    try:
        # Configuración de la conexión a la base de datos
        conn = psycopg2.connect(
            host="aws-0-us-west-1.pooler.supabase.com",
            database="postgres",
            user="postgres.caoqlvpakvwljkfrpdkc",
            password="hola_queridos_alumnos",
            port="6543"
        )
        print("Conexión abierta exitosamente")
        return conn
    except Exception as e:
        print(f"Error al abrir la conexión: {e}")
        return None

def cerrar_conexion(conn: psycopg2.connect):
    if conn:
        try:
            conn.close()
            print("Conexión cerrada exitosamente")
        except Exception as e:
            print(f"Error al cerrar la conexión: {e}")

def insert_data(conn: psycopg2.connect, table_name: str, data: dict):
    try:
        # Genero el cursor para ejecutar la consultas
        cursor = conn.cursor()
        
        # Obtengo los valores a insertar a partir del diccionario
        columns = data.keys()
        values = [data[column] for column in columns]

        # Genero la consulta de inserción
        insert_query = sql.SQL("INSERT INTO {} ({}) VALUES ({})").format(
            sql.Identifier(table_name),
            sql.SQL(', ').join(map(sql.Identifier, columns)),
            sql.SQL(', ').join(sql.Placeholder() * len(values))
        )

        # Ejecuto la consulta de inserción
        cursor.execute(insert_query, values)
        
        # Confirmo los cambios en la base de datos
        conn.commit()
        print(f"Datos insertados en la tabla {table_name}")
    except Exception as e:
        print(f"Error al insertar datos: {e}")
        conn.rollback() # Hago un rollback para deshacer los cambios en caso de error
    finally:
        cursor.close() # Cierro el cursor