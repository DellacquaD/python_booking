from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import os

database_password = os.environ.get('DATABASE_PASSWORD')

# Función para obtener una sesión de la base de datos
def get_database_session():
    try:
        engine = create_engine(f'mysql+mysqlconnector://root:{database_password}@localhost/python_booking')
        Session = sessionmaker(bind=engine)
        session = Session()
        print("Connected to MySQL")
        return session
    except Exception as e:
        print(f"Error al conectarse a la base de datos: {e}")
        return None

# Función para cerrar la sesión de la base de datos
def close_database_session(session):
    if session:
        session.close()
        print("Connection to MySQL closed")
