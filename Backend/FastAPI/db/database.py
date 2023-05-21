from mysql.connector import connect, Error

# Establecer la conexión a la base de datos MySQL
def connect_to_database():
    try:
        db = connect(
            host="localhost",
            user="root",
            password="Defensor_1995",
            database="python_booking",
        )
        print("Connected to MySQL")
        return db
    except Error as e:
        print(f"Error al conectarse a la base de datos: {e}")
        return None

# Cerrar la conexión a la base de datos
def close_database_connection(db):
    if db:
        db.close()
        print("Connection to MySQL closed")
