from fastapi import APIRouter, HTTPException, status
from db.models.city import City
from db.models.state import State
from db.models.country import Country
from mysql.connector import connect, Error

router = APIRouter(prefix="/country",
                   tags=["country"],
                   responses={status.HTTP_404_NOT_FOUND: {"message": "Country no encontrado"}})

# Establecer la conexión a la base de datos MySQL
try:
    db = connect(
        host="localhost",
        user="root",
        password="Defensor_1995",
        database="python_booking",
    )
    print("Connected to MySQL")
except Error as e:
    print(f"Error al conectarse a la base de datos: {e}")
    exit()

# Obtener una referencia al cliente de la base de datos
client = db.cursor()

# GET

@router.get("/")
async def get_states():
    return city_list()

################################################################

def city_list():
    query = """
        SELECT city_id, city.name AS city, state.state_id,state.name AS state, country.name AS country
        FROM city
        LEFT JOIN state ON city.state_id = state.state_id
        LEFT JOIN country ON state.country_id = country.country_id
    """
    client.execute(query)
    result = client.fetchall()
    result_list = [dict(zip(client.column_names, row)) for row in result]

    transformed_data = []
    for item in result_list:
        city_id = item["city_id"]
        country = item["country"]
        state = item["state"]
        city = item["city"]

        # Buscar si el país ya existe en transformed_data
        country_data = next((data for data in transformed_data if data["name"] == country), None)
        if country_data is None:
            # Si no existe, agregar el país con una lista vacía de estados
            country_data = {"id": len(transformed_data) + 1, "name": country, "states": []}
            transformed_data.append(country_data)

        # Buscar si el estado ya existe en el país actual
        state_data = next((data for data in country_data["states"] if data["name"] == state), None)
        if state_data is None:
            # Si no existe, agregar el estado con una lista vacía de ciudades
            state_data = {"id": len(country_data["states"]) + 1, "name": state, "cities": []}
            country_data["states"].append(state_data)

        # Agregar la ciudad a la lista de ciudades del estado actual
        state_data["cities"].append({"id": city_id, "name": city})

    return transformed_data