from fastapi import APIRouter, HTTPException, status, Response
from db.schemas.products import product_schema, products_schema
from db.database import get_database_session, close_database_session
from sqlalchemy import text
from sqlalchemy.exc import SQLAlchemyError

from .queries import (
    GET_RANDOM_PRODUCTS,
    GET_PRODUCT_BY_ID,
    GET_PRODUCTS_BY_CATEGORY,
    GET_PRODUCTS_BY_CITY,
    GET_PRODUCTS_BY_CITY_AND_DATES
)
from db.mod import Product as ProductModel, Policy as PolicyModel, Address as AddressModel, Feature as FeatureModel, Image as ImageModel

router = APIRouter(
    prefix="/product",
    tags=["product"],
    responses={404: {"message": "No encontrado"}},
)

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
    with get_database_session() as session:
        results = session.execute(text(GET_RANDOM_PRODUCTS)).fetchall()
        random_products = products_schema(results)
    return random_products

# Obtener producto por su ID
def search_product_by_id(key):
    session = get_database_session()
    result = session.execute(GET_PRODUCT_BY_ID, (key,)).fetchone()
    if result:
        product_selected = product_schema(result, include_policy=True, include_reserve=True)
        session.close()
        return product_selected
    else:
        session.close()
        raise HTTPException(status_code=404, detail="Producto no encontrado")

# Obtener productos por su categoría
def search_products_by_category(key):
    session = get_database_session()
    results = session.execute(GET_PRODUCTS_BY_CATEGORY, (key,)).fetchall()
    products = products_schema(results)
    session.close()
    return products

# Obtener productos por su ciudad
def search_products_by_city(key):
    session = get_database_session()
    results = session.execute(GET_PRODUCTS_BY_CITY, (key,)).fetchall()
    products = products_schema(results)
    session.close()
    return products

# Obtener productos por su ciudad y fechas disponibles
def search_products_by_city_and_dates(name, checkin, checkout):
    session = get_database_session()
    results = session.execute(GET_PRODUCTS_BY_CITY_AND_DATES, (name, checkout, checkin)).fetchall()
    products = products_schema(results)
    session.close()
    return products

@router.post("/")
async def register_product(response: Response):
    # Realizar las operaciones necesarias para guardar el usuario en la base de datos
    try:
        session = get_database_session()

        # Insertar políticas del alojamiento y recuperar el id
        policy = PolicyModel(
            rules=response.policy.rules,
            security=response.policy.security,
            cancellation=response.policy.cancellation
        )
        session.add(policy)
        session.flush()
        product_policy = policy.policy_id

        # Insertar dirección del alojamiento y recuperar el id
        address = AddressModel(
            number=response.address.number,
            street=response.address.street,
            city_id=response.address.city
        )
        session.add(address)
        session.flush()
        address_id = address.address_id

        # Insertar alojamiento y recuperar el id
        new_product = ProductModel(
            description=response.description,
            review=response.review,
            scoring=response.scoring,
            stars=response.stars,
            title=response.title,
            address_address_id=address_id,
            category_id=response.category,
            policy_id=product_policy
        )
        session.add(new_product)
        session.flush()
        product_id = new_product.product_id

        # Insertar características del alojamiento
        for feature_id in response.features:
            feature = FeatureModel(products_product_id=product_id, features_feature_id=feature_id)
            session.add(feature)

        # Insertar imágenes del alojamiento
        for image in response.images:
            image_model = ImageModel(
                image_url=image.imageUrl,
                title=image.title,
                product_id=product_id
            )
            session.add(image_model)

        session.commit()

        # Retornar una respuesta exitosa
        response = Response(content={"message": "Product registered successfully"})
        response.headers["Access-Control-Allow-Origin"] = "http://localhost:5173"
        session.close()
        return response

    except SQLAlchemyError:
        # Manejar cualquier error que pueda ocurrir durante la inserción en la base de datos
        session.rollback()
        session.close()
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error registering product"
        )