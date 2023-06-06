from fastapi import APIRouter, HTTPException, status, Depends
from sqlalchemy.orm import Session
from db.mod import City, State

from db.database import get_database_session

router = APIRouter(prefix="/country",
                   tags=["country"],
                   responses={status.HTTP_404_NOT_FOUND: {"message": "Country no encontrado"}})

@router.get("/")
async def get_states(session: Session = Depends(get_database_session)):
    return city_list(session)

def city_list(session: Session):
    cities = session.query(City).join(City.state).join(State.country).all()
    transformed_data = []

    for city in cities:
        city_id = city.city_id
        country = city.state.country.name
        state = city.state.name
        city_name = city.name

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
        state_data["cities"].append({"id": city_id, "name": city_name})

    return transformed_data
