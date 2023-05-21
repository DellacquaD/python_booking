from fastapi import APIRouter, HTTPException, status
from db.schemas.products import product_schema, products_schema
from db.database import connect_to_database, close_database_connection
from .queries import (
    GET_RANDOM_PRODUCTS,
    GET_PRODUCT_BY_ID,
    GET_PRODUCTS_BY_CATEGORY,
    GET_PRODUCTS_BY_CITY,
    GET_PRODUCTS_BY_CITY_AND_DATES
)

router = APIRouter(
    prefix="/product",
    tags=["product"],
    responses={404: {"message": "No encontrado"}},
)

# Establecer la conexión a la base de datos MySQL
db = connect_to_database()
client = db.cursor()

@router.get("/random")
async def get_random_products():
    return search_random_products()

@router.get("/{id}")
async def get_product_by_id(id: int):
    return search_product_by_id(id)

@router.get("/byCategory/{id}")
async def get_products_by_category(id: int):
    return search_products_by_category(id)

@router.get("/byCity/{city_name}")
async def get_products_by_city(city_name: str):
    return search_products_by_city(city_name)

@router.get("/byCityAndDates/{city_name}/{checkin}/{checkout}")
async def get_products_by_city_and_dates(city_name: str, checkin: str, checkout: str):
    return search_products_by_city_and_dates(city_name, checkin, checkout)

# Obtener 8 productos RANDOM
def search_random_products():
    client.execute(GET_RANDOM_PRODUCTS)
    results = client.fetchall()
    random_products = products_schema(results)
    return random_products

# Obtener producto por su ID
def search_product_by_id(key):
    values = (key,)
    client.execute(GET_PRODUCT_BY_ID, values)
    result = client.fetchone()
    if result:
        product_selected = product_schema(result, include_policy=True, include_reserve=True)
        return product_selected
    else:
        raise HTTPException(status_code=404, detail="Producto no encontrado")

# Obtener productos por su categoría
def search_products_by_category(key):
    values = (key,)
    client.execute(GET_PRODUCTS_BY_CATEGORY, values)
    results = client.fetchall()
    products = products_schema(results)
    return products

# Obtener productos por su ciudad
def search_products_by_city(key):
    values = (key,)
    client.execute(GET_PRODUCTS_BY_CITY, values)
    results = client.fetchall()
    products = products_schema(results)
    return products

# Obtener productos por su ciudad y fechas disponibles
def search_products_by_city_and_dates(name, checkin, checkout):
    values = (name, checkout, checkin)
    client.execute(GET_PRODUCTS_BY_CITY_AND_DATES, values)
    results = client.fetchall()
    products = products_schema(results)
    return products

# Cerrar la conexión a la base de datos al finalizar la aplicación
def close_database():
    close_database_connection(db)

# Evento de cierre de la aplicación
@router.on_event("shutdown")
def on_shutdown():
    close_database()
