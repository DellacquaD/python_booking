from fastapi import APIRouter, HTTPException, status, Response
from db.schemas.products import product_schema, products_schema
from db.database import connect_to_database, close_database_connection
from db.models.product import Product
from mysql.connector import Error

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

# GETS

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

# POSTS

# @router.post("/")
# async def register_product(product: Product):
#     # Verificar si el usuario ya existe en la base de datos

#     # Realizar las operaciones necesarias para guardar el usuario en la base de datos
#     if not db:
#         raise HTTPException(
#             status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
#             detail="Error connecting to the database"
#         )

#     try:
#         cursor = db.cursor()
#         # Insertar politicas del alojamiento y recuperar el id
#         query = "INSERT INTO policy (rules, security, cancellation) VALUES (%s, %s, %s)"
#         values = (product.policy.rules, product.policy.security, product.policy.cancellation)
#         cursor.execute(query, values)
#         product_policy = cursor.lastrowid
#         product.policy = product_policy
#         # Insertar dirección del alojamiento y recuperar el id
#         query = "INSERT INTO address (number, street, city_id) VALUES (%s, %s, %s)"
#         values = (product.address.number, product.address.street, int(product.address.city))
#         cursor.execute(query, values)
#         address_id = cursor.lastrowid
#         product.address = address_id
#         # Insertar alojamiento y recuperar el id
#         query = "INSERT INTO product (description, review, scoring, stars, title, address_address_id, category_id, policy_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
#         values = (product.description, product.review, int(product.scoring), int(product.stars), product.title, int(product.address), int(product.category), int(product.policy))
#         cursor.execute(query, values)
#         product_id = int(cursor.lastrowid)
#         # Insertar características del alojamiento
#         for feature in product.features:
#             feature_id = feature
#             query = "INSERT INTO product_feature (products_product_id, features_feature_id) VALUES (%s, %s)"
#             values = (int(product_id), int(feature_id))
#             cursor.execute(query, values)
#         for image in product.images:
#             query = "INSERT INTO image (image_url, title, product_id) VALUES (%s, %s, %s)"
#             values = (image.imageUrl, image.title, product_id)
#             cursor.execute(query, values)
#         db.commit()
#         cursor.close()
#         close_database_connection(db)

#         # Retornar una respuesta exitosa
#         return {"message": "Product registered successfully"}

#     except Error:
#         # Manejar cualquier error que pueda ocurrir durante la inserción en la base de datos
#         db.rollback()
#         cursor.close()
#         close_database_connection(db)
#         raise HTTPException(
#             status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
#             detail="Error registering product"
#         )

@router.post("/")
async def register_product(product: Product):
    # Verificar si el usuario ya existe en la base de datos

    # Realizar las operaciones necesarias para guardar el usuario en la base de datos
    if not db:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error connecting to the database"
        )

    try:
        cursor = db.cursor()

        # Insertar politicas del alojamiento y recuperar el id
        query = "INSERT INTO policy (rules, security, cancellation) VALUES (%s, %s, %s)"
        values = (product.policy.rules, product.policy.security, product.policy.cancellation)
        cursor.execute(query, values)
        product_policy = cursor.lastrowid
        product.policy = product_policy

        # Insertar dirección del alojamiento y recuperar el id
        query = "INSERT INTO address (number, street, city_id) VALUES (%s, %s, %s)"
        values = (product.address.number, product.address.street, int(product.address.city))
        cursor.execute(query, values)
        address_id = cursor.lastrowid
        product.address = address_id

        # Insertar alojamiento y recuperar el id
        query = "INSERT INTO product (description, review, scoring, stars, title, address_address_id, category_id, policy_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        values = (product.description, product.review, int(product.scoring), int(product.stars), product.title, int(product.address), int(product.category), int(product.policy))
        cursor.execute(query, values)
        product_id = int(cursor.lastrowid)

        # Insertar características del alojamiento
        for feature in product.features:
            feature_id = feature
            query = "INSERT INTO product_feature (products_product_id, features_feature_id) VALUES (%s, %s)"
            values = (int(product_id), int(feature_id))
            cursor.execute(query, values)

        # Insertar imágenes del alojamiento
        for image in product.images:
            query = "INSERT INTO image (image_url, title, product_id) VALUES (%s, %s, %s)"
            values = (image.imageUrl, image.title, product_id)
            cursor.execute(query, values)

        db.commit()
        cursor.close()
        close_database_connection(db)

        # Retornar una respuesta exitosa
        response = Response(content={"message": "Product registered successfully"})
        response.headers["Access-Control-Allow-Origin"] = "http://localhost:5173"
        return response
        # return {"message": "Product registered successfully"}

    except Error:
        # Manejar cualquier error que pueda ocurrir durante la inserción en la base de datos
        db.rollback()
        cursor.close()
        close_database_connection(db)
        
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error registering product"
        )



# Cerrar la conexión a la base de datos al finalizar la aplicación
def close_database():
    close_database_connection(db)

# Evento de cierre de la aplicación
@router.on_event("shutdown")
def on_shutdown():
    close_database()