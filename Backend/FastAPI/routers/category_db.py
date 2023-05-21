from fastapi import APIRouter, HTTPException, status
from db.models.category import Category
from db.schemas.category import category_schema, categorys_schema
from mysql.connector import connect, Error

router = APIRouter(prefix="/category",
                   tags=["category"],
                   responses={status.HTTP_404_NOT_FOUND: {"message": "No encontrado"}})

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
async def get_categorys():
    return category_list()
################################################################

def category_list():
    query = "SELECT * FROM category"
    client.execute(query)
    result = client.fetchall()
    result_list = [dict(zip(client.column_names, row)) for row in result]
    return categorys_schema(result_list)


def search_category(field: str, key):
    query = "SELECT * FROM category WHERE category_id = %s".format(field)
    values = (key,)
    client.execute(query, values)
    result = client.fetchone()

    if result is not None:
        return Category(
            category_id=result[0],
            description=result[1],
            image_url=result[2],
            quantity=result[3],
            title=result[4]
        )
    else:
        return None
    
def search_random_categorys():
    query = "SELECT * FROM category ORDER BY RAND() LIMIT 8"
    client.execute(query)
    results = client.fetchall()

    random_categorys = []
    for result in results:
        random_categorys.append(Category(
            category_id=result[0],
            description=result[1],
            image_url=result[2],
            quantity=result[3],
            title=result[4]
        ))

    return random_categorys 

# POST 

# @router.post("/", response_model=category, status_code=status.HTTP_201_CREATED)
# async def create_category(category: category):
#     query = "SELECT * FROM category WHERE id = %s"
#     values = (category.category_id,)
#     client.execute(query, values)
#     result = client.fetchone()

#     if result is not None:
#         raise HTTPException(
#             status_code=status.HTTP_404_NOT_FOUND, detail="El categoryo ya existe"
#         )

#     query = "INSERT INTO users (first_name, last_name, username, email, role, password) VALUES (%s, %s, %s, %s, %s, %s)"
#     values = (user.first_name, user.last_name, user.username, user.email, user.role, user.password)
#     client.execute(query, values)
#     db.commit()

#     new_category_id = client.lastrowid
#     new_user = search_category("category_id", new_category_id)

#     return new_user

# PUT /users

# @router.put("/", response_model=User)
# async def update_user(user: User):
#     query = "UPDATE users SET first_name = %s, last_name = %s, username = %s, email = %s, role = %s, password = %s WHERE category_id = %s"
#     values = (user.first_name, user.last_name, user.username, user.email, user.role, user.password, user.category_id)
#     client.execute(query, values)
#     db.commit()

#     return search_category("category_id", user.category_id)


# @router.delete("/{id}", status_code=status.HTTP_204_NO_CONTENT)
# async def delete_user(id: int):
#     query = "DELETE FROM category WHERE category_id = %s"
#     values = (id,)
#     client.execute(query, values)
#     db.commit()

#     if client.rowcount == 0:
#         return {"error": "No se ha eliminado el usuario"}
    

