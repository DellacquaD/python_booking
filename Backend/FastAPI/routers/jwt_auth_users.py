from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from jose import jwt, JWTError
from passlib.context import CryptContext
from datetime import datetime, timedelta
from db.database import connect_to_database, close_database_connection
from mysql.connector import Error

ALGORITHM = "HS256"
ACCESS_TOKEN_DURATION = 10
SECRET = "201d573bd7d1344d3a3bfce1550b69102fd11be3db6d379508b6cccc58ea230b"

router = APIRouter(prefix="/auth",
                   tags=["auth"],
                   responses={status.HTTP_404_NOT_FOUND: {"message": "Not Found"}})

oauth2 = OAuth2PasswordBearer(tokenUrl="login")

crypt = CryptContext(schemes=["bcrypt"])


class User(BaseModel):
    username: str
    first_name: str
    last_name: str
    email: str


class UserDB(BaseModel):
    username: str
    first_name: str
    last_name: str
    email: str
    password: str


# Establecer la conexión a la base de datos MySQL
db = connect_to_database()
client = db.cursor()

def close_database():
    close_database_connection(db)

# Evento de cierre de la aplicación
@router.on_event("shutdown")
def on_shutdown():
    close_database()


def search_user(username: str):
    db = connect_to_database()
    if not db:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error connecting to the database")

    cursor = db.cursor()
    query = "SELECT * FROM users WHERE username = %s"
    cursor.execute(query, (username,))
    user_row = cursor.fetchone()
    cursor.close()
    close_database_connection(db)

    if not user_row:
        return None

    user = UserDB(
        username=user_row[0],
        first_name=user_row[1],
        last_name=user_row[2],
        email=user_row[3],
        password=user_row[4]
    )

    return user

async def auth_user(token: str = Depends(oauth2)):

    exception = HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Invalid authentication credentials",
        headers={"WWW-Authenticate": "Bearer"})

    try:
        username = jwt.decode(token, SECRET, algorithms=[ALGORITHM]).get("sub")
        if username is None:
            raise exception

    except JWTError:
        raise exception

    return search_user(username)


async def current_user(user: User = Depends(auth_user)):
    if user.disabled:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Inactive user")

    return user


@router.post("/login")
async def login(form: OAuth2PasswordRequestForm = Depends()):

    db = connect_to_database()
    if not db:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error connecting to the database")

    cursor = db.cursor()
    query = f"""
        SELECT username, first_name, last_name, email, password, role FROM users 
        WHERE username = %s
    """
    cursor.execute(query, (form.username,))
    user_row = cursor.fetchone()
    cursor.close()
    close_database_connection(db)

    if not user_row:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Invalid username")

    user = UserDB(
        username=user_row[0],
        first_name=user_row[1],
        last_name=user_row[2],
        email=user_row[3],
        password=user_row[4]
    )

    if not crypt.verify(form.password, user.password):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Invalid password")

    token = {
        "sub": user.username,
        "exp": datetime.utcnow() + timedelta(minutes=ACCESS_TOKEN_DURATION)
    }

    return {"token": jwt.encode(token, SECRET, algorithm=ALGORITHM), "token_type": "bearer", "role": user_row[5], "firstname": user_row[1], "lastname": user_row[2]}

@router.post("/register")
async def register_user(user: UserDB):
    # Verificar si el usuario ya existe en la base de datos
    existing_user = search_user(user.username)
    if existing_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Username already exists"
        )

    # Realizar las operaciones necesarias para guardar el usuario en la base de datos
    db = connect_to_database()
    if not db:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error connecting to the database"
        )

    try:
        cursor = db.cursor()
        query = "INSERT INTO users (username, first_name, last_name, email, password) VALUES (%s, %s, %s, %s, %s)"
        values = (user.username, user.first_name, user.last_name, user.email, crypt.hash(user.password))
        cursor.execute(query, values)
        db.commit()
        cursor.close()
        close_database_connection(db)

        # Retornar una respuesta exitosa
        return {"message": "User registered successfully"}

    except Error:
        # Manejar cualquier error que pueda ocurrir durante la inserción en la base de datos
        db.rollback()
        cursor.close()
        close_database_connection(db)
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Error registering user"
        )