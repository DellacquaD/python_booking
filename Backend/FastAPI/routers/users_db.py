from fastapi import APIRouter, HTTPException, status
from db.models.user import User
from db.schemas.user import user_schema, users_schema
from mysql.connector import connect, Error

router = APIRouter(prefix="/users",
                   tags=["users"],
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

@router.get("/{id}")
async def get_user(id: int):
    return search_user("user_id", id)


@router.get("/")
async def get_users():
    return list_users()

# POST 

@router.post("/", response_model=User, status_code=status.HTTP_201_CREATED)
async def create_user(user: User):
    query = "SELECT * FROM users WHERE email = %s"
    values = (user.email,)
    client.execute(query, values)
    result = client.fetchone()

    if result is not None:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="El usuario ya existe"
        )

    query = "INSERT INTO users (first_name, last_name, username, email, role, password) VALUES (%s, %s, %s, %s, %s, %s)"
    values = (user.first_name, user.last_name, user.username, user.email, user.role, user.password)
    client.execute(query, values)
    db.commit()

    new_user_id = client.lastrowid
    new_user = search_user("user_id", new_user_id)

    return new_user

# PUT /users

@router.put("/", response_model=User)
async def update_user(user: User):
    query = "UPDATE users SET first_name = %s, last_name = %s, username = %s, email = %s, role = %s, password = %s WHERE user_id = %s"
    values = (user.first_name, user.last_name, user.username, user.email, user.role, user.password, user.user_id)
    client.execute(query, values)
    db.commit()

    return search_user("user_id", user.user_id)


@router.delete("/{id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_user(id: int):
    query = "DELETE FROM users WHERE user_id = %s"
    values = (id,)
    client.execute(query, values)
    db.commit()

    if client.rowcount == 0:
        return {"error": "No se ha eliminado el usuario"}
    

def list_users():
    query = "SELECT * FROM users"
    client.execute(query)
    result = client.fetchall()
    result_list = [dict(zip(client.column_names, row)) for row in result]
    return users_schema(result_list)


def search_user(field: str, key):
    query = "SELECT * FROM users WHERE {} = %s".format(field)
    values = (key,)
    client.execute(query, values)
    result = client.fetchone()

    if result is not None:
        return User(
            user_id=result[0],
            first_name=result[1],
            last_name=result[2],
            username=result[3],
            email=result[4],
            role=result[5],
            password=result[6]
        )
    else:
        return None
